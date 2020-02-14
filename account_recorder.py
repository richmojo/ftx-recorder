import time
from datetime import datetime
import threading
from influxdb import InfluxDBClient
from influxdb.exceptions import InfluxDBClientError

from config import *


client = InfluxDBClient(
    host="localhost", port=8086, database="accountdb"
)

try:
    client.create_database("accountdb")
except InfluxDBClientError:
    client.switch_database("accountdb")


def get_account():
    try:
        account = Exchange.privateGetAccount()
    except ccxt.BaseError:
        pass
    else:
        t = datetime.utcnow().isoformat()
        account = account["result"]
        positions = account["positions"]

        account_write = {
            "measurement": "account",
            "tags": {
                "username": account["username"],
            },
            "fields": {
                "collateral": account["collateral"],
                "freeCollateral": account["freeCollateral"],
                "marginFraction": account["marginFraction"],
                "openMarginFraction": account["openMarginFraction"],
                "totalAccountValue": account["totalAccountValue"],
                "totalPositionSize": account["totalPositionSize"],
            },
            "time": t,
        }
        account_write["fields"] = {k: v for k, v in account_write["fields"].items() if v is not None}
        client.write_points(account_write, time_precision="ms")

        if positions:
            positions_write = [{
                "measurement": "positions",
                "tags": {
                    "future": p["future"],
                },
                "fields": {
                    "collateralUsed": p["collateralUsed"],
                    "cost": p["cost"],
                    "entryPrice": p["entryPrice"],
                    "estimatedLiquidationPrice": p["estimatedLiquidationPrice"],
                    "netSize": p["netSize"],
                    "openSize": p["openSize"],
                    "realizedPnl": p["realizedPnl"],
                    "side": p["side"],
                    "size": p["size"],
                    "unrealizedPnl": p["unrealizedPnl"],
                },
                "time": t,
            } for p in positions]
            for p in positions_write:
                p["fields"] = {k: v for k, v in p["fields"].items() if v is not None}
            client.write_points(positions_write, time_precision="ms")


def get_balances():
    try:
        balances = Exchange.fetchBalance()
    except ccxt.BaseError:
        pass
    else:
        t = datetime.utcnow().isoformat()
        balances = balances["info"]["result"]

        balances_write = [{
            "measurement": "balances",
            "tags": {
                "coin": c["coin"],
            },
            "fields": {
                "free": c["free"],
                "total": c["total"],
                "usdValue": c["usdValue"],
            },
            "time": t,
        } for c in balances]
        client.write_points(balances_write, time_precision="ms")


def get_orders():
    # grab last 5 minutes worth
    since = int(time.time() - 300)
    try:
        orders = Exchange.privateGetOrdersHistory(params={'start_time': since})
    except ccxt.BaseError:
        pass
    else:
        orders = orders["result"]

        if orders:
            orders_write = [{
                "measurement": "orders",
                "tags": {
                    "future": o["future"],
                    "market": o["market"],
                    "type": o["type"],
                },
                "fields": {
                    "avgFillPrice": o["avgFillPrice"],
                    "filledSize": o["filledSize"],
                    "id": o["id"],
                    "price": o["price"],
                    "reduceOnly": o["reduceOnly"],
                    "side": o["side"],
                    "size": o["size"],
                    "status": o["status"],
                },
                "time": o["createdAt"],
            } for o in orders]
            for o in orders_write:
                o["fields"] = {k: v for k, v in o["fields"].items() if v is not None}
            client.write_points(orders_write, time_precision="ms")


def get_fills():
    # grab last 5 minutes worth
    since = int(time.time() - 300)
    try:
        fills = Exchange.privateGetFills(params={'start_time': since})
    except ccxt.BaseError:
        pass
    else:
        fills = fills["result"]

        if fills:
            fills_write = [{
                "measurement": "orders",
                "tags": {
                    "future": o["future"],
                    "market": o["market"],
                    "type": o["type"],
                },
                "fields": {
                    "fee": o["fee"],
                    "feeRate": o["feeRate"],
                    "id": o["id"],
                    "liquidity": o["liquidity"],
                    "orderId": o["orderId"],
                    "price": o["price"],
                    "side": o["side"],
                    "size": o["size"],
                    "type": o["type"],
                },
                "time": o["time"],
            } for o in fills]
            for o in fills_write:
                o["fields"] = {k: v for k, v in o["fields"].items() if v is not None}
            client.write_points(fills_write, time_precision="ms")


def recorder():
    threads = [
        threading.Thread(target=get_account),
        threading.Thread(target=get_balances),
        threading.Thread(target=get_orders),
        threading.Thread(target=get_fills),
    ]
    for thread in threads:
        thread.start()
        thread.join()


def main():
    while True:
        recorder()
        time.sleep(1.0)


if __name__ == "__main__":
    while True:
        try:
            main()
        except ccxt.BaseError:
            time.sleep(1)
            continue
        except Exception:
            time.sleep(1)
            continue

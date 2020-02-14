import time
from datetime import datetime
import logging
import sys
from influxdb import InfluxDBClient
from influxdb.exceptions import InfluxDBClientError

from config import *


formatter = logging.Formatter(
    fmt="%(asctime)s - %(levelname)s - %(module)s - %(message)s"
)

stream_handler = logging.StreamHandler()
stream_handler.setFormatter(formatter)
stream_handler.setLevel(logging.INFO)

logger = logging.getLogger("account_recorder")
logger.setLevel(logging.INFO)
logger.addHandler(stream_handler)

client = InfluxDBClient(
    host="localhost", port=8086, database="accountdb"
)

if drop_db:
    logger.info("Deleting existing account database.")
    try:
        client.drop_database("accountdb")
    except InfluxDBClientError:
        client.create_database("accountdb")
    else:
        client.create_database("accountdb")
    finally:
        logger.info("Created new account database.")
else:
    try:
        client.create_database("accountdb")
    except InfluxDBClientError:
        logger.info("Using existing account database.")
    else:
        logger.info("Created new account database.")


def get_account():
    try:
        account = Exchange.privateGetAccount()
    except ccxt.BaseError as e:
        logger.error(f"Could not get account with error: {e}")
        raise e
    else:
        logger.info("Writing account.")
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
        account_write["fields"] = {k: float(v) for k, v in account_write["fields"].items() if v is not None}
        client.write_points([account_write])

        if positions:
            logger.info("Writing positions.")
            positions_write = [{
                "measurement": "positions",
                "tags": {
                    "future": p["future"],
                    "side": p["side"],
                },
                "fields": {
                    "collateralUsed": p["collateralUsed"],
                    "cost": p["cost"],
                    "entryPrice": p["entryPrice"],
                    "estimatedLiquidationPrice": p["estimatedLiquidationPrice"],
                    "netSize": p["netSize"],
                    "openSize": p["openSize"],
                    "realizedPnl": p["realizedPnl"],
                    "size": p["size"],
                    "unrealizedPnl": p["unrealizedPnl"],
                },
                "time": t,
            } for p in positions]
            for p in positions_write:
                p["fields"] = {k: float(v) for k, v in p["fields"].items() if v is not None}
            client.write_points(positions_write)


def get_balances():
    try:
        balances = Exchange.fetchBalance()
    except ccxt.BaseError as e:
        logger.error(f"Could not get balances with error: {e}")
        raise e
    else:
        logger.info("Writing balances.")
        t = datetime.utcnow().isoformat()
        balances = balances["info"]["result"]

        balances_write = [{
            "measurement": "balances",
            "tags": {
                "coin": c["coin"],
            },
            "fields": {
                "free": float(c["free"]),
                "total": float(c["total"]),
                "usdValue": float(c["usdValue"]),
            },
            "time": t,
        } for c in balances]
        client.write_points(balances_write)


def get_orders():
    # grab last 5 minutes worth
    since = int(time.time() - 300)
    try:
        orders = Exchange.privateGetOrdersHistory(params={'start_time': since})
    except ccxt.BaseError as e:
        logger.error(f"Could not get order history with error: {e}")
        raise e
    else:
        logger.info("Writing orders.")
        orders = orders["result"]

        if orders:
            orders_write = [{
                "measurement": "orders",
                "tags": {
                    "future": o["future"],
                    "market": o["market"],
                    "type": o["type"],
                    "side": o["side"],
                    "reduceOnly": o["reduceOnly"],
                    "status": o["status"],
                    "postOnly": o["postOnly"],
                },
                "fields": {
                    "avgFillPrice": o["avgFillPrice"],
                    "filledSize": o["filledSize"],
                    "price": o["price"],
                    "size": o["size"],
                },
                "time": o["createdAt"][:-6] + 'Z',
            } for o in orders]
            for o in orders_write:
                o["fields"] = {k: float(v) for k, v in o["fields"].items() if v is not None}
                o["tags"] = {k: str(v) for k, v in o["tags"].items() if v is not None}
            client.write_points(orders_write)


def get_fills():
    # grab last 5 minutes worth
    since = int(time.time() - 300)
    try:
        fills = Exchange.privateGetFills(params={'start_time': since})
    except ccxt.BaseError as e:
        logger.error(f"Could not get fills history with error: {e}")
        raise e
    else:
        logger.info("Writing fills.")
        fills = fills["result"]

        if fills:
            fills_write = [{
                "measurement": "fills",
                "tags": {
                    "future": f["future"],
                    "market": f["market"],
                    "type": f["type"],
                    "liquidity": f["liquidity"],
                    "side": f["side"],
                },
                "fields": {
                    "fee": f["fee"],
                    "feeRate": f["feeRate"],
                    "price": f["price"],
                    "size": f["size"],
                },
                "time": f["time"][:-6] + 'Z',
            } for f in fills]
            for f in fills_write:
                f["fields"] = {k: float(v) for k, v in f["fields"].items() if v is not None}
                f["tags"] = {k: str(v) for k, v in f["tags"].items() if v is not None}
            client.write_points(fills_write)


def recorder():
    while True:
        get_account()
        get_balances()
        get_orders()
        get_fills()
        time.sleep(0.5)


if __name__ == "__main__":
    logger.info("Starting account recorder.")
    try:
        recorder()
    except ccxt.BaseError as ee:
        logger.error(f"Main ccxt error {ee}")
        sys.exit(1)
    except Exception as ee:
        logger.error(f"Main error {ee}")
        sys.exit(1)

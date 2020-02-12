import logging

from influxdb import InfluxDBClient
from influxdb.exceptions import InfluxDBClientError

from exchange import Exchange


class Recorder:
    def __init__(self, symbol="XBTUSD", **kwargs):

        self.client = InfluxDBClient(
            host="localhost", port=8086, database=MainConfig["database_name"]
        )

        try:
            self.client.create_database(MainConfig["database_name"])
        except InfluxDBClientError:
            self.client.switch_database(MainConfig["database_name"])

        websocket.enableTrace(True)

        channels = [
            InstrumentChannels.trade,
            SecureChannels.margin,
            SecureInstrumentChannels.position,
            SecureInstrumentChannels.order,
        ]

        super().__init__(symbol=symbol, channels=channels, **kwargs)

    def on_action(self, message):
        t = threading.Thread(target=self._on_action, args=(message,))
        t.start()

    def _on_action(self, message):
        data_list = message["data"]
        try:
            # order
            if message["table"] == "order":
                alog.info('%s' % message)
                if "ordType" in data_list[0]:
                    # limit
                    if data_list[0]["ordType"] == "Limit":
                        data = [
                            {
                                "measurement": "limitorder",
                                "tags": {
                                    "symbol": d["symbol"],
                                    "side": d["side"],
                                    "ordType": d["ordType"],
                                    "ordStatus": d["ordStatus"],
                                },
                                "time": d["timestamp"],
                                "fields": {
                                    "orderQty": d["orderQty"],
                                    "price": float(d["price"]),
                                },
                            }
                            for d in data_list
                        ]
                    # market
                    else:
                        data = [
                            {
                                "measurement": "marketorder",
                                "tags": {
                                    "symbol": d["symbol"],
                                    "side": d["side"],
                                    "ordType": d["ordType"],
                                    "ordStatus": d["ordStatus"],
                                },
                                "time": d["timestamp"],
                                "fields": {"orderQty": d["orderQty"]},
                            }
                            for d in data_list
                        ]
                # updates
                else:
                    if "ordStatus" in data_list[0]:
                        data = [
                            {
                                "measurement": "orderfill",
                                "tags": {
                                    "ordStatus": d["ordStatus"]
                                },
                                "time": d["timestamp"],
                                "fields": {
                                    "cumQty": d["cumQty"],
                                    "avgPx": float(d["avgPx"])
                                },
                            }
                            for d in data_list
                        ]
                    else:
                        return

            # position
            elif message["table"] == "position":
                fields = [
                    "commission",
                    "initMarginReq",
                    "maintMarginReq",
                    "leverage",
                    "rebalancedPnl",
                    "currentQty",
                    "currentComm",
                    "markPrice",
                    "markValue",
                    "posMargin",
                    "realisedPnl",
                    "unrealisedGrossPnl",
                    "avgEntryPrice",
                    "breakEvenPrice",
                    "liquidationPrice",
                    "unrealisedPnl",
                    "lastPrice",
                    "lastValue",
                ]
                data = [
                    {
                        "measurement": "position",
                        "tags": {"symbol": d["symbol"]},
                        "time": d["timestamp"],
                        "fields": {
                            k: float(d[k])
                            for k in fields
                            if k in d and isinstance(d[k], (int, float))
                        },
                    }
                    for d in data_list
                ]
            # trade
            elif message["table"] == "trade":
                data = [
                    {
                        "measurement": "trade",
                        "tags": {
                            "symbol": d["symbol"],
                            "side": d["side"],
                            "tickDirection": d["tickDirection"],
                        },
                        "time": d["timestamp"],
                        "fields": {
                            "size": d["size"],
                            "price": float(d["price"]),
                            "grossValue": d["grossValue"],
                            "homeNotional": float(d["homeNotional"]),
                        },
                    }
                    for d in data_list
                ]
            # margin
            else:
                fields = [
                    "grossMarkValue",
                    "marginBalance",
                    "walletBalance",
                    "marginLeverage",
                    "marginUsedPcnt",
                    "grossLastValue",
                ]
                data = [
                    {
                        "measurement": "margin",
                        "tags": {"currency": d["currency"]},
                        "time": d["timestamp"],
                        "fields": {
                            k: float(d[k])
                            for k in fields
                            if k in d and isinstance(d[k], (int, float))
                        },
                    }
                    for d in data_list
                ]

        except Exception as e:
            alog.error("%s" % e)
            alog.error("%s" % message)
            return

        return self.client.write_points(data, time_precision="ms")


def main():
    emitter = Ticker("XBTUSD", should_auth=True)
    emitter.run_forever()


if __name__ == "__main__":
    alog.set_level(logging.DEBUG)
    while True:
        try:
            main()
        except BitMEXWebsocketConnectionError:
            alog.error("Websocket closed, reopening.")
            continue

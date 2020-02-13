from cryptofeed.backends.influxdb import TradeInflux
from cryptofeed import FeedHandler
from cryptofeed.exchanges import FTX
from cryptofeed.defines import TRADES
import time

from config import *


def main():
    f = FeedHandler()
    trade_influx = TradeInflux(ADDR, org=ORG, bucket=TRADESBUCKET, token=TOKEN, numeric_type=float)
    f.add_feed(FTX(channels=[TRADES], pairs=PAIRS, callbacks={TRADES: trade_influx}), timeout=30)
    f.run()


if __name__ == '__main__':
    while True:
        try:
            main()
        except Exception:
            time.sleep(1)
            continue

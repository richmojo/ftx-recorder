from cryptofeed.backends.influxdb import TradeInflux
from cryptofeed import FeedHandler
from cryptofeed.exchanges import FTX
from cryptofeed.defines import TRADES
import sys

from config import *


def main():
    f = FeedHandler()
    trade_influx = TradeInflux('http://localhost:8086', 'tradesdb', create_db=True, numeric_type=float)
    f.add_feed(FTX(channels=[TRADES], pairs=PAIRS, callbacks={TRADES: trade_influx}), timeout=30)
    f.run()


if __name__ == '__main__':
    try:
        main()
    except Exception:
        sys.exit(1)

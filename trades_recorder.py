from cryptofeed.backends.influxdb import TradeInflux
from cryptofeed import FeedHandler
from cryptofeed.exchanges import FTX
from cryptofeed.defines import TRADES

from config import *

drop_db = False  # if True, deletes existing account database

Exchange = ccxt.ftx(
            {
                "apiKey": MainConfig["Exchange"]["api_key"],
                "secret": MainConfig["Exchange"]["api_secret"],
    			'timeout': 2000,
    			'enableRateLimit': False,
        })

_ = Exchange.load_markets()

PAIRS = Exchange.symbols
PAIRS = [pair for pair in PAIRS if pair.endswith("PERP")]

def main():
    f = FeedHandler()
    trade_influx = TradeInflux('http://localhost:8086', 'tradesdb', create_db=True, numeric_type=float)
    f.add_feed(FTX(channels=[TRADES], pairs=PAIRS, callbacks={TRADES: trade_influx}), timeout=30)
    f.run()


if __name__ == '__main__':
    while True:
        try:
            main()
        except Exception:
            continue

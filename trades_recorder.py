from cryptofeed.backends.influxdb import TradeInflux,  BookInflux, OpenInterestInflux
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
    #orderbook_influx = BookInflux('http://localhost:8086', 'orderbookdb', create_db=True, numeric_type=float)
    oi_influx = OpenInterestInflux('http://localhost:8086', 'oidb', create_db=True, numeric_type=float)
    f.add_feed(FTX(channels=[TRADES], pairs=PAIRS, callbacks={TRADES: trade_influx}), timeout=30)
    f.add_feed(FTX(channels=[OPEN_INTEREST], pairs=PAIRS, callbacks={OPEN_INTEREST: oi_influx}), timeout=30)
    #f.add_feed(FTX(channels=[L2_BOOK], pairs=['BTC-PERP', 'ETH-PERP'], callbacks={L2_BOOK: orderbook_influx}), timeout=30)
    f.run()


if __name__ == '__main__':
    while True:
        try:
            main()
        except Exception:
            continue

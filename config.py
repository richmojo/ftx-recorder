import ccxt


Exchange = ccxt.ftx({
    'apiKey': "",
    'secret': "",
    'timeout': 2000,
    'enableRateLimit': False,
})

_ = Exchange.load_markets()

PAIRS = Exchange.symbols
PAIRS = [pair for pair in PAIRS if pair.endswith("PERP")]

drop_db = False  # if True, deletes any existing account database

import ccxt


# account recorder
Exchange = ccxt.ftx({
    'apiKey': "",
    'secret': "",
    'timeout': 2000,
    'enableRateLimit': True,
})


# trades recorder
ADDR = 'https://localhost:9999'
ORG = 'my-org'
TRADESBUCKET = 'trades-bucket'
ACCOUNTBUCKET = 'account-bucket'
TOKEN = 'token-something-like-end-with-=='

_ = Exchange.load_markets()

PAIRS = Exchange.symbols
PAIRS = [pair for pair in PAIRS if pair.endswith("PERP")]

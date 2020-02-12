import ccxt


Exchange = ccxt.ftx({
    'apiKey': "",
    'secret': "",
    'timeout': 2000,  # milliseconds
    'enableRateLimit': True,
    'rateLimit': 250,  # milliseconds
})

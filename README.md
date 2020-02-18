# ftx-recorder

Records every trade on FTX for pairs that end in PERP, all of your personal trades and fills,
and all your account data to influxdb (mainly to be visualized using grafana).

There are two recorders, one for the trades, one for the account, which are both managed by systemd. 
They are restarted automatically if they fail, and start automatically at boot.

## Install

Meant for an Amazon Linux 2 Image on AWS.

Fetch repo from GitHub.

`sudo yum install git`

`git clone http://www.github.com/evanatyourservice/ftx-recorder`

`cd ftx-recorder`

Check config.py, put in your API key.

`nano config.py`

Simple install using bash, starts automatically after install.

`bash install.sh`

To update:

`bash deploy.sh`

## systemd

Trades and account recorders are run as services through systemd, their names are trades_recorder and 
account_recorder. Starting at boot is default.

Some examples:

to disable start at boot:

`sudo systemctl disable account_recorder`

to stop:

`sudo systemctl stop trades_recorder`

to get status:

`systemctl status account_recorder`

## Databases

The names of the databases in influxdb are accountdb and tradesdb.

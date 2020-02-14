# ftx-recorder

Records every trades for pairs that end in PERP, all of your personal trades and fills,
and all your account data.

There are two recorders, one for the trades, one for the account. They are restarted by systemd
if they fail, and start automatically at boot.

## Install

Start with Amazon Linux 2 Image

Fetch repo from GitHub

`sudo yum install git`

`git clone http://www.github.com/evanatyourservice/ftx-recorder`

Check config.py, put in your API key.

Starts automatically after install

`bash install.sh`

To update:

`bash deploy.sh`

## systemd

recorders are run as services through systemd, their names are trades_recorder and 
account_recorder.

Some examples:

to disable start at boot:

`sudo systemctl disable account_recorder`

to stop:

`sudo systemctl stop trades_recorder`

to get status:

`systemctl status account_recorder`
# ccxt-recorder

Start with Amazon Linux 2 Image

Follow instructions (here)[https://v2.docs.influxdata.com/v2.0/get-started/] to install influxdb 2.0,
create an organization, create two buckets for both the account recorder and the trades recorder, 
and make a security token, then put them in config.py.

Fetch recorder from GitHub

`sudo yum install git`

`git clone http://www.github.com/evanatyourservice/bitmex-influxdb`

Check config.py

Starts automatically after install

`bash install.sh`

To update and restart:

`bash deploy.sh`

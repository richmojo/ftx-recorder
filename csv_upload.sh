# get csv's

influx -database 'BTC_accountdb' -execute 'select * from account' -format 'csv' > btc_account.csv

# move csv's

mv btc_account.csv Dropbox-Uploader/btc_account.csv

# upload csv's

cd Dropbox-Uploader
./dropbox_uploader.sh upload btc_account.csv /dropbox/rltrader
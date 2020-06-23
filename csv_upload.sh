# get csv's
echo "Getting csv's"
influx -database 'BTC_accountdb' -execute 'select * from account' -format 'csv' > btc_account.csv

# move csv's
echo "Moving csv's"
mv btc_account.csv ../Dropbox-Uploader/btc_account.csv

# upload csv's
echo "Uploading csv's"
cd ..
cd Dropbox-Uploader
./dropbox_uploader.sh upload btc_account.csv /dropbox/rltrader
# get csv's
echo "Getting csv's"
influx -database 'BTC_accountdb' -execute 'select * from account' -format 'csv' > BTC_account.csv
influx -database 'BTC_accountdb' -execute 'select * from all_positions' -format 'csv' > BTC_all_positions.csv
influx -database 'BTC_accountdb' -execute 'select * from balances' -format 'csv' > BTC_balances.csv
influx -database 'BTC_accountdb' -execute 'select * from fills' -format 'csv' > BTC_fills.csv
influx -database 'BTC_accountdb' -execute 'select * from orders' -format 'csv' > BTC_orders.csv
influx -database 'BTC_accountdb' -execute 'select * from positions' -format 'csv' > BTC_positions.csv

# move csv's
echo "Moving csv's"
mv BTC_account.csv ../Dropbox-Uploader/BTC_account.csv
mv BTC_all_positions.csv ../Dropbox-Uploader/BTC_all_positions.csv
mv BTC_balances.csv ../Dropbox-Uploader/BTC_balances.csv
mv BTC_fills.csv ../Dropbox-Uploader/BTC_fills.csv
mv BTC_orders.csv ../Dropbox-Uploader/BTC_orders.csv
mv BTC_positions.csv ../Dropbox-Uploader/BTC_positions.csv

# upload csv's
echo "Uploading csv's"
cd ..
cd Dropbox-Uploader
./dropbox_uploader.sh upload BTC_account.csv /rltrader
./dropbox_uploader.sh upload BTC_all_positions.csv /rltrader
./dropbox_uploader.sh upload BTC_balances.csv /rltrader
./dropbox_uploader.sh upload BTC_fills.csv /rltrader
./dropbox_uploader.sh upload BTC_orders.csv /rltrader
./dropbox_uploader.sh upload BTC_positions.csv /rltrader

# delete csv's
rm -f BTC_account.csv
rm -f BTC_all_positions.csv
rm -f BTC_balances.csv
rm -f BTC_fills.csv
rm -f BTC_orders.csv
rm -f BTC_positions.csv
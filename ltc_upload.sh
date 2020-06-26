# get csv's
echo "Getting csv's"
influx -database 'LTC_accountdb' -execute 'select * from account' -format 'csv' > LTC_account.csv
influx -database 'LTC_accountdb' -execute 'select * from all_positions' -format 'csv' > LTC_all_positions.csv
influx -database 'LTC_accountdb' -execute 'select * from balances' -format 'csv' > LTC_balances.csv
influx -database 'LTC_accountdb' -execute 'select * from fills' -format 'csv' > LTC_fills.csv
influx -database 'LTC_accountdb' -execute 'select * from orders' -format 'csv' > LTC_orders.csv
influx -database 'LTC_accountdb' -execute 'select * from positions' -format 'csv' > LTC_positions.csv

# move csv's
echo "Moving csv's"
mv LTC_account.csv ../Dropbox-Uploader/LTC_account.csv
mv LTC_all_positions.csv ../Dropbox-Uploader/LTC_all_positions.csv
mv LTC_balances.csv ../Dropbox-Uploader/LTC_balances.csv
mv LTC_fills.csv ../Dropbox-Uploader/LTC_fills.csv
mv LTC_orders.csv ../Dropbox-Uploader/LTC_orders.csv
mv LTC_positions.csv ../Dropbox-Uploader/LTC_positions.csv

# upload csv's
echo "Uploading csv's"
cd ..
cd Dropbox-Uploader
./dropbox_uploader.sh upload LTC_account.csv /rltrader
./dropbox_uploader.sh upload LTC_all_positions.csv /rltrader
./dropbox_uploader.sh upload LTC_balances.csv /rltrader
./dropbox_uploader.sh upload LTC_fills.csv /rltrader
./dropbox_uploader.sh upload LTC_orders.csv /rltrader
./dropbox_uploader.sh upload LTC_positions.csv /rltrader

# delete csv's
rm -f LTC_account.csv
rm -f LTC_all_positions.csv
rm -f LTC_balances.csv
rm -f LTC_fills.csv
rm -f LTC_orders.csv
rm -f LTC_positions.csv
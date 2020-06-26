# get csv's
echo "Getting csv's"
influx -database 'ALT_accountdb' -execute 'select * from account' -format 'csv' > ALT_account.csv
influx -database 'ALT_accountdb' -execute 'select * from all_positions' -format 'csv' > ALT_all_positions.csv
influx -database 'ALT_accountdb' -execute 'select * from balances' -format 'csv' > ALT_balances.csv
influx -database 'ALT_accountdb' -execute 'select * from fills' -format 'csv' > ALT_fills.csv
influx -database 'ALT_accountdb' -execute 'select * from orders' -format 'csv' > ALT_orders.csv
influx -database 'ALT_accountdb' -execute 'select * from positions' -format 'csv' > ALT_positions.csv

# move csv's
echo "Moving csv's"
mv ALT_account.csv ../Dropbox-Uploader/ALT_account.csv
mv ALT_all_positions.csv ../Dropbox-Uploader/ALT_all_positions.csv
mv ALT_balances.csv ../Dropbox-Uploader/ALT_balances.csv
mv ALT_fills.csv ../Dropbox-Uploader/ALT_fills.csv
mv ALT_orders.csv ../Dropbox-Uploader/ALT_orders.csv
mv ALT_positions.csv ../Dropbox-Uploader/ALT_positions.csv

# upload csv's
echo "Uploading csv's"
cd ..
cd Dropbox-Uploader
./dropbox_uploader.sh upload ALT_account.csv /rltrader
./dropbox_uploader.sh upload ALT_all_positions.csv /rltrader
./dropbox_uploader.sh upload ALT_balances.csv /rltrader
./dropbox_uploader.sh upload ALT_fills.csv /rltrader
./dropbox_uploader.sh upload ALT_orders.csv /rltrader
./dropbox_uploader.sh upload ALT_positions.csv /rltrader

# delete csv's
rm -f ALT_account.csv
rm -f ALT_all_positions.csv
rm -f ALT_balances.csv
rm -f ALT_fills.csv
rm -f ALT_orders.csv
rm -f ALT_positions.csv
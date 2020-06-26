# get csv's
echo "Getting csv's"
influx -database 'BCH_accountdb' -execute 'select * from account' -format 'csv' > BCH_account.csv
influx -database 'BCH_accountdb' -execute 'select * from all_positions' -format 'csv' > BCH_all_positions.csv
influx -database 'BCH_accountdb' -execute 'select * from balances' -format 'csv' > BCH_balances.csv
influx -database 'BCH_accountdb' -execute 'select * from fills' -format 'csv' > BCH_fills.csv
influx -database 'BCH_accountdb' -execute 'select * from orders' -format 'csv' > BCH_orders.csv
influx -database 'BCH_accountdb' -execute 'select * from positions' -format 'csv' > BCH_positions.csv

# move csv's
echo "Moving csv's"
mv BCH_account.csv ../Dropbox-Uploader/BCH_account.csv
mv BCH_all_positions.csv ../Dropbox-Uploader/BCH_all_positions.csv
mv BCH_balances.csv ../Dropbox-Uploader/BCH_balances.csv
mv BCH_fills.csv ../Dropbox-Uploader/BCH_fills.csv
mv BCH_orders.csv ../Dropbox-Uploader/BCH_orders.csv
mv BCH_positions.csv ../Dropbox-Uploader/BCH_positions.csv

# upload csv's
echo "Uploading csv's"
cd ..
cd Dropbox-Uploader
./dropbox_uploader.sh upload BCH_account.csv /rltrader
./dropbox_uploader.sh upload BCH_all_positions.csv /rltrader
./dropbox_uploader.sh upload BCH_balances.csv /rltrader
./dropbox_uploader.sh upload BCH_fills.csv /rltrader
./dropbox_uploader.sh upload BCH_orders.csv /rltrader
./dropbox_uploader.sh upload BCH_positions.csv /rltrader

# delete csv's
rm -f BCH_account.csv
rm -f BCH_all_positions.csv
rm -f BCH_balances.csv
rm -f BCH_fills.csv
rm -f BCH_orders.csv
rm -f BCH_positions.csv
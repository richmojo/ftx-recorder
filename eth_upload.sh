# get csv's
echo "Getting csv's"
influx -database 'ETH_accountdb' -execute 'select * from account' -format 'csv' > ETH_account.csv
influx -database 'ETH_accountdb' -execute 'select * from all_positions' -format 'csv' > ETH_all_positions.csv
influx -database 'ETH_accountdb' -execute 'select * from balances' -format 'csv' > ETH_balances.csv
influx -database 'ETH_accountdb' -execute 'select * from fills' -format 'csv' > ETH_fills.csv
influx -database 'ETH_accountdb' -execute 'select * from orders' -format 'csv' > ETH_orders.csv
influx -database 'ETH_accountdb' -execute 'select * from positions' -format 'csv' > ETH_positions.csv

# move csv's
echo "Moving csv's"
mv ETH_account.csv ../Dropbox-Uploader/ETH_account.csv
mv ETH_all_positions.csv ../Dropbox-Uploader/ETH_all_positions.csv
mv ETH_balances.csv ../Dropbox-Uploader/ETH_balances.csv
mv ETH_fills.csv ../Dropbox-Uploader/ETH_fills.csv
mv ETH_orders.csv ../Dropbox-Uploader/ETH_orders.csv
mv ETH_positions.csv ../Dropbox-Uploader/ETH_positions.csv

# upload csv's
echo "Uploading csv's"
cd ..
cd Dropbox-Uploader
./dropbox_uploader.sh upload ETH_account.csv /rltrader
./dropbox_uploader.sh upload ETH_all_positions.csv /rltrader
./dropbox_uploader.sh upload ETH_balances.csv /rltrader
./dropbox_uploader.sh upload ETH_fills.csv /rltrader
./dropbox_uploader.sh upload ETH_orders.csv /rltrader
./dropbox_uploader.sh upload ETH_positions.csv /rltrader

# delete csv's
rm -f ETH_account.csv
rm -f ETH_all_positions.csv
rm -f ETH_balances.csv
rm -f ETH_fills.csv
rm -f ETH_orders.csv
rm -f ETH_positions.csv
# get csv's
echo "Getting csv's"
influx -database 'ALGO_accountdb' -execute 'select * from account' -format 'csv' > ALGO_account.csv
influx -database 'ALGO_accountdb' -execute 'select * from all_positions' -format 'csv' > ALGO_all_positions.csv
influx -database 'ALGO_accountdb' -execute 'select * from balances' -format 'csv' > ALGO_balances.csv
influx -database 'ALGO_accountdb' -execute 'select * from fills' -format 'csv' > ALGO_fills.csv
influx -database 'ALGO_accountdb' -execute 'select * from orders' -format 'csv' > ALGO_orders.csv
influx -database 'ALGO_accountdb' -execute 'select * from positions' -format 'csv' > ALGO_positions.csv

# move csv's
echo "Moving csv's"
mv ALGO_account.csv ../Dropbox-Uploader/ALGO_account.csv
mv ALGO_all_positions.csv ../Dropbox-Uploader/ALGO_all_positions.csv
mv ALGO_balances.csv ../Dropbox-Uploader/ALGO_balances.csv
mv ALGO_fills.csv ../Dropbox-Uploader/ALGO_fills.csv
mv ALGO_orders.csv ../Dropbox-Uploader/ALGO_orders.csv
mv ALGO_positions.csv ../Dropbox-Uploader/ALGO_positions.csv

# upload csv's
echo "Uploading csv's"
cd ..
cd Dropbox-Uploader
./dropbox_uploader.sh upload ALGO_account.csv /rltrader
./dropbox_uploader.sh upload ALGO_all_positions.csv /rltrader
./dropbox_uploader.sh upload ALGO_balances.csv /rltrader
./dropbox_uploader.sh upload ALGO_fills.csv /rltrader
./dropbox_uploader.sh upload ALGO_orders.csv /rltrader
./dropbox_uploader.sh upload ALGO_positions.csv /rltrader

# delete csv's
rm -f ALGO_account.csv
rm -f ALGO_all_positions.csv
rm -f ALGO_balances.csv
rm -f ALGO_fills.csv
rm -f ALGO_orders.csv
rm -f ALGO_positions.csv
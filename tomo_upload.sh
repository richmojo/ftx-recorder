# get csv's
echo "Getting csv's"
influx -database 'TOMO_accountdb' -execute 'select * from account' -format 'csv' > TOMO_account.csv
influx -database 'TOMO_accountdb' -execute 'select * from all_positions' -format 'csv' > TOMO_all_positions.csv
influx -database 'TOMO_accountdb' -execute 'select * from balances' -format 'csv' > TOMO_balances.csv
influx -database 'TOMO_accountdb' -execute 'select * from fills' -format 'csv' > TOMO_fills.csv
influx -database 'TOMO_accountdb' -execute 'select * from orders' -format 'csv' > TOMO_orders.csv
influx -database 'TOMO_accountdb' -execute 'select * from positions' -format 'csv' > TOMO_positions.csv

# move csv's
echo "Moving csv's"
mv TOMO_account.csv ../Dropbox-Uploader/TOMO_account.csv
mv TOMO_all_positions.csv ../Dropbox-Uploader/TOMO_all_positions.csv
mv TOMO_balances.csv ../Dropbox-Uploader/TOMO_balances.csv
mv TOMO_fills.csv ../Dropbox-Uploader/TOMO_fills.csv
mv TOMO_orders.csv ../Dropbox-Uploader/TOMO_orders.csv
mv TOMO_positions.csv ../Dropbox-Uploader/TOMO_positions.csv

# upload csv's
echo "Uploading csv's"
cd ..
cd Dropbox-Uploader
./dropbox_uploader.sh upload TOMO_account.csv /rltrader
./dropbox_uploader.sh upload TOMO_all_positions.csv /rltrader
./dropbox_uploader.sh upload TOMO_balances.csv /rltrader
./dropbox_uploader.sh upload TOMO_fills.csv /rltrader
./dropbox_uploader.sh upload TOMO_orders.csv /rltrader
./dropbox_uploader.sh upload TOMO_positions.csv /rltrader

# delete csv's
rm -f TOMO_account.csv
rm -f TOMO_all_positions.csv
rm -f TOMO_balances.csv
rm -f TOMO_fills.csv
rm -f TOMO_orders.csv
rm -f TOMO_positions.csv
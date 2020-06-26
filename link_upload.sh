# get csv's
echo "Getting csv's"
influx -database 'LINK_accountdb' -execute 'select * from account' -format 'csv' > LINK_account.csv
influx -database 'LINK_accountdb' -execute 'select * from all_positions' -format 'csv' > LINK_all_positions.csv
influx -database 'LINK_accountdb' -execute 'select * from balances' -format 'csv' > LINK_balances.csv
influx -database 'LINK_accountdb' -execute 'select * from fills' -format 'csv' > LINK_fills.csv
influx -database 'LINK_accountdb' -execute 'select * from orders' -format 'csv' > LINK_orders.csv
influx -database 'LINK_accountdb' -execute 'select * from positions' -format 'csv' > LINK_positions.csv

# move csv's
echo "Moving csv's"
mv LINK_account.csv ../Dropbox-Uploader/LINK_account.csv
mv LINK_all_positions.csv ../Dropbox-Uploader/LINK_all_positions.csv
mv LINK_balances.csv ../Dropbox-Uploader/LINK_balances.csv
mv LINK_fills.csv ../Dropbox-Uploader/LINK_fills.csv
mv LINK_orders.csv ../Dropbox-Uploader/LINK_orders.csv
mv LINK_positions.csv ../Dropbox-Uploader/LINK_positions.csv

# upload csv's
echo "Uploading csv's"
cd ..
cd Dropbox-Uploader
./dropbox_uploader.sh upload LINK_account.csv /rltrader
./dropbox_uploader.sh upload LINK_all_positions.csv /rltrader
./dropbox_uploader.sh upload LINK_balances.csv /rltrader
./dropbox_uploader.sh upload LINK_fills.csv /rltrader
./dropbox_uploader.sh upload LINK_orders.csv /rltrader
./dropbox_uploader.sh upload LINK_positions.csv /rltrader

# delete csv's
rm -f LINK_account.csv
rm -f LINK_all_positions.csv
rm -f LINK_balances.csv
rm -f LINK_fills.csv
rm -f LINK_orders.csv
rm -f LINK_positions.csv
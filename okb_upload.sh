# get csv's
echo "Getting csv's"
influx -database 'OKB_accountdb' -execute 'select * from account' -format 'csv' > OKB_account.csv
influx -database 'OKB_accountdb' -execute 'select * from all_positions' -format 'csv' > OKB_all_positions.csv
influx -database 'OKB_accountdb' -execute 'select * from balances' -format 'csv' > OKB_balances.csv
influx -database 'OKB_accountdb' -execute 'select * from fills' -format 'csv' > OKB_fills.csv
influx -database 'OKB_accountdb' -execute 'select * from orders' -format 'csv' > OKB_orders.csv
influx -database 'OKB_accountdb' -execute 'select * from positions' -format 'csv' > OKB_positions.csv

# move csv's
echo "Moving csv's"
mv OKB_account.csv ../Dropbox-Uploader/OKB_account.csv
mv OKB_all_positions.csv ../Dropbox-Uploader/OKB_all_positions.csv
mv OKB_balances.csv ../Dropbox-Uploader/OKB_balances.csv
mv OKB_fills.csv ../Dropbox-Uploader/OKB_fills.csv
mv OKB_orders.csv ../Dropbox-Uploader/OKB_orders.csv
mv OKB_positions.csv ../Dropbox-Uploader/OKB_positions.csv

# upload csv's
echo "Uploading csv's"
cd ..
cd Dropbox-Uploader
./dropbox_uploader.sh upload OKB_account.csv /rltrader
./dropbox_uploader.sh upload OKB_all_positions.csv /rltrader
./dropbox_uploader.sh upload OKB_balances.csv /rltrader
./dropbox_uploader.sh upload OKB_fills.csv /rltrader
./dropbox_uploader.sh upload OKB_orders.csv /rltrader
./dropbox_uploader.sh upload OKB_positions.csv /rltrader

# delete csv's
rm -f OKB_account.csv
rm -f OKB_all_positions.csv
rm -f OKB_balances.csv
rm -f OKB_fills.csv
rm -f OKB_orders.csv
rm -f OKB_positions.csv
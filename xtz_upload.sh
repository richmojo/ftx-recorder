# get csv's
echo "Getting csv's"
influx -database 'XTZ_accountdb' -execute 'select * from account' -format 'csv' > XTZ_account.csv
influx -database 'XTZ_accountdb' -execute 'select * from all_positions' -format 'csv' > XTZ_all_positions.csv
influx -database 'XTZ_accountdb' -execute 'select * from balances' -format 'csv' > XTZ_balances.csv
influx -database 'XTZ_accountdb' -execute 'select * from fills' -format 'csv' > XTZ_fills.csv
influx -database 'XTZ_accountdb' -execute 'select * from orders' -format 'csv' > XTZ_orders.csv
influx -database 'XTZ_accountdb' -execute 'select * from positions' -format 'csv' > XTZ_positions.csv

# move csv's
echo "Moving csv's"
mv XTZ_account.csv ../Dropbox-Uploader/XTZ_account.csv
mv XTZ_all_positions.csv ../Dropbox-Uploader/XTZ_all_positions.csv
mv XTZ_balances.csv ../Dropbox-Uploader/XTZ_balances.csv
mv XTZ_fills.csv ../Dropbox-Uploader/XTZ_fills.csv
mv XTZ_orders.csv ../Dropbox-Uploader/XTZ_orders.csv
mv XTZ_positions.csv ../Dropbox-Uploader/XTZ_positions.csv

# upload csv's
echo "Uploading csv's"
cd ..
cd Dropbox-Uploader
./dropbox_uploader.sh upload XTZ_account.csv /rltrader
./dropbox_uploader.sh upload XTZ_all_positions.csv /rltrader
./dropbox_uploader.sh upload XTZ_balances.csv /rltrader
./dropbox_uploader.sh upload XTZ_fills.csv /rltrader
./dropbox_uploader.sh upload XTZ_orders.csv /rltrader
./dropbox_uploader.sh upload XTZ_positions.csv /rltrader

# delete csv's
rm -f XTZ_account.csv
rm -f XTZ_all_positions.csv
rm -f XTZ_balances.csv
rm -f XTZ_fills.csv
rm -f XTZ_orders.csv
rm -f XTZ_positions.csv
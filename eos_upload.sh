# get csv's
echo "Getting csv's"
influx -database 'EOS_accountdb' -execute 'select * from account' -format 'csv' > EOS_account.csv
influx -database 'EOS_accountdb' -execute 'select * from all_positions' -format 'csv' > EOS_all_positions.csv
influx -database 'EOS_accountdb' -execute 'select * from balances' -format 'csv' > EOS_balances.csv
influx -database 'EOS_accountdb' -execute 'select * from fills' -format 'csv' > EOS_fills.csv
influx -database 'EOS_accountdb' -execute 'select * from orders' -format 'csv' > EOS_orders.csv
influx -database 'EOS_accountdb' -execute 'select * from positions' -format 'csv' > EOS_positions.csv

# move csv's
echo "Moving csv's"
mv EOS_account.csv ../Dropbox-Uploader/EOS_account.csv
mv EOS_all_positions.csv ../Dropbox-Uploader/EOS_all_positions.csv
mv EOS_balances.csv ../Dropbox-Uploader/EOS_balances.csv
mv EOS_fills.csv ../Dropbox-Uploader/EOS_fills.csv
mv EOS_orders.csv ../Dropbox-Uploader/EOS_orders.csv
mv EOS_positions.csv ../Dropbox-Uploader/EOS_positions.csv

# upload csv's
echo "Uploading csv's"
cd ..
cd Dropbox-Uploader
./dropbox_uploader.sh upload EOS_account.csv /rltrader
./dropbox_uploader.sh upload EOS_all_positions.csv /rltrader
./dropbox_uploader.sh upload EOS_balances.csv /rltrader
./dropbox_uploader.sh upload EOS_fills.csv /rltrader
./dropbox_uploader.sh upload EOS_orders.csv /rltrader
./dropbox_uploader.sh upload EOS_positions.csv /rltrader

# delete csv's
rm -f EOS_account.csv
rm -f EOS_all_positions.csv
rm -f EOS_balances.csv
rm -f EOS_fills.csv
rm -f EOS_orders.csv
rm -f EOS_positions.csv
# get csv's
echo "Getting csv's"
influx -database 'BTC_accountdb' -execute 'select * from account' -format 'csv' > BTC_account.csv
influx -database 'BTC_accountdb' -execute 'select * from all_positions' -format 'csv' > BTC_all_positions.csv
influx -database 'BTC_accountdb' -execute 'select * from balances' -format 'csv' > BTC_balances.csv
influx -database 'BTC_accountdb' -execute 'select * from fills' -format 'csv' > BTC_fills.csv
influx -database 'BTC_accountdb' -execute 'select * from orders' -format 'csv' > BTC_orders.csv
influx -database 'BTC_accountdb' -execute 'select * from positions' -format 'csv' > BTC_positions.csv

influx -database 'ETH_accountdb' -execute 'select * from account' -format 'csv' > ETH_account.csv
influx -database 'ETH_accountdb' -execute 'select * from all_positions' -format 'csv' > ETH_all_positions.csv
influx -database 'ETH_accountdb' -execute 'select * from balances' -format 'csv' > ETH_balances.csv
influx -database 'ETH_accountdb' -execute 'select * from fills' -format 'csv' > ETH_fills.csv
influx -database 'ETH_accountdb' -execute 'select * from orders' -format 'csv' > ETH_orders.csv
influx -database 'ETH_accountdb' -execute 'select * from positions' -format 'csv' > ETH_positions.csv

influx -database 'EOS_accountdb' -execute 'select * from account' -format 'csv' > EOS_account.csv
influx -database 'EOS_accountdb' -execute 'select * from all_positions' -format 'csv' > EOS_all_positions.csv
influx -database 'EOS_accountdb' -execute 'select * from balances' -format 'csv' > EOS_balances.csv
influx -database 'EOS_accountdb' -execute 'select * from fills' -format 'csv' > EOS_fills.csv
influx -database 'EOS_accountdb' -execute 'select * from orders' -format 'csv' > EOS_orders.csv
influx -database 'EOS_accountdb' -execute 'select * from positions' -format 'csv' > EOS_positions.csv

influx -database 'LINK_accountdb' -execute 'select * from account' -format 'csv' > LINK_account.csv
influx -database 'LINK_accountdb' -execute 'select * from all_positions' -format 'csv' > LINK_all_positions.csv
influx -database 'LINK_accountdb' -execute 'select * from balances' -format 'csv' > LINK_balances.csv
influx -database 'LINK_accountdb' -execute 'select * from fills' -format 'csv' > LINK_fills.csv
influx -database 'LINK_accountdb' -execute 'select * from orders' -format 'csv' > LINK_orders.csv
influx -database 'LINK_accountdb' -execute 'select * from positions' -format 'csv' > LINK_positions.csv

influx -database 'XTZ_accountdb' -execute 'select * from account' -format 'csv' > XTZ_account.csv
influx -database 'XTZ_accountdb' -execute 'select * from all_positions' -format 'csv' > XTZ_all_positions.csv
influx -database 'XTZ_accountdb' -execute 'select * from balances' -format 'csv' > XTZ_balances.csv
influx -database 'XTZ_accountdb' -execute 'select * from fills' -format 'csv' > XTZ_fills.csv
influx -database 'XTZ_accountdb' -execute 'select * from orders' -format 'csv' > XTZ_orders.csv
influx -database 'XTZ_accountdb' -execute 'select * from positions' -format 'csv' > XTZ_positions.csv

influx -database 'BCH_accountdb' -execute 'select * from account' -format 'csv' > BCH_account.csv
influx -database 'BCH_accountdb' -execute 'select * from all_positions' -format 'csv' > BCH_all_positions.csv
influx -database 'BCH_accountdb' -execute 'select * from balances' -format 'csv' > BCH_balances.csv
influx -database 'BCH_accountdb' -execute 'select * from fills' -format 'csv' > BCH_fills.csv
influx -database 'BCH_accountdb' -execute 'select * from orders' -format 'csv' > BCH_orders.csv
influx -database 'BCH_accountdb' -execute 'select * from positions' -format 'csv' > BCH_positions.csv

influx -database 'LTC_accountdb' -execute 'select * from account' -format 'csv' > LTC_account.csv
influx -database 'LTC_accountdb' -execute 'select * from all_positions' -format 'csv' > LTC_all_positions.csv
influx -database 'LTC_accountdb' -execute 'select * from balances' -format 'csv' > LTC_balances.csv
influx -database 'LTC_accountdb' -execute 'select * from fills' -format 'csv' > LTC_fills.csv
influx -database 'LTC_accountdb' -execute 'select * from orders' -format 'csv' > LTC_orders.csv
influx -database 'LTC_accountdb' -execute 'select * from positions' -format 'csv' > LTC_positions.csv

influx -database 'ALGO_accountdb' -execute 'select * from account' -format 'csv' > ALGO_account.csv
influx -database 'ALGO_accountdb' -execute 'select * from all_positions' -format 'csv' > ALGO_all_positions.csv
influx -database 'ALGO_accountdb' -execute 'select * from balances' -format 'csv' > ALGO_balances.csv
influx -database 'ALGO_accountdb' -execute 'select * from fills' -format 'csv' > ALGO_fills.csv
influx -database 'ALGO_accountdb' -execute 'select * from orders' -format 'csv' > ALGO_orders.csv
influx -database 'ALGO_accountdb' -execute 'select * from positions' -format 'csv' > ALGO_positions.csv

influx -database 'OKB_accountdb' -execute 'select * from account' -format 'csv' > OKB_account.csv
influx -database 'OKB_accountdb' -execute 'select * from all_positions' -format 'csv' > OKB_all_positions.csv
influx -database 'OKB_accountdb' -execute 'select * from balances' -format 'csv' > OKB_balances.csv
influx -database 'OKB_accountdb' -execute 'select * from fills' -format 'csv' > OKB_fills.csv
influx -database 'OKB_accountdb' -execute 'select * from orders' -format 'csv' > OKB_orders.csv
influx -database 'OKB_accountdb' -execute 'select * from positions' -format 'csv' > OKB_positions.csv

influx -database 'TOMO_accountdb' -execute 'select * from account' -format 'csv' > TOMO_account.csv
influx -database 'TOMO_accountdb' -execute 'select * from all_positions' -format 'csv' > TOMO_all_positions.csv
influx -database 'TOMO_accountdb' -execute 'select * from balances' -format 'csv' > TOMO_balances.csv
influx -database 'TOMO_accountdb' -execute 'select * from fills' -format 'csv' > TOMO_fills.csv
influx -database 'TOMO_accountdb' -execute 'select * from orders' -format 'csv' > TOMO_orders.csv
influx -database 'TOMO_accountdb' -execute 'select * from positions' -format 'csv' > TOMO_positions.csv

influx -database 'rltrader' -execute 'select * from ALGO-PERP' -format 'csv' > rl_algo_old.csv
influx -database 'rltrader' -execute 'select * from ALGO-PERP-ALGO' -format 'csv' > rl_algo.csv
influx -database 'rltrader' -execute 'select * from ALT-PERP' -format 'csv' > rl_alt_old.csv
influx -database 'rltrader' -execute 'select * from ALT-PERP-ALT' -format 'csv' > rl_alt.csv
influx -database 'rltrader' -execute 'select * from BCH-PERP' -format 'csv' > rl_bch.csv
influx -database 'rltrader' -execute 'select * from BTC-PERP' -format 'csv' > rl_btc_old.csv
influx -database 'rltrader' -execute 'select * from BTC-PERP-BTC' -format 'csv' > rl_btc.csv
influx -database 'rltrader' -execute 'select * from EOS-PERP' -format 'csv' > rl_eos_old.csv
influx -database 'rltrader' -execute 'select * from EOS-PERP-EOS' -format 'csv' > rl_eos.csv
influx -database 'rltrader' -execute 'select * from ETH-PERP' -format 'csv' > rl_eth_old.csv
influx -database 'rltrader' -execute 'select * from ETH-PERP-ETH' -format 'csv' > rl_eth.csv
influx -database 'rltrader' -execute 'select * from LINK-PERP' -format 'csv' > rl_link_old.csv
influx -database 'rltrader' -execute 'select * from LINK-PERP-LINK' -format 'csv' > rl_link.csv
influx -database 'rltrader' -execute 'select * from LTC-PERP' -format 'csv' > rl_ltc_old.csv
influx -database 'rltrader' -execute 'select * from LTC-PERP-LTC' -format 'csv' > rl_ltc.csv
influx -database 'rltrader' -execute 'select * from OKB-PERP' -format 'csv' > rl_okb_old.csv
influx -database 'rltrader' -execute 'select * from TOMO-PERP' -format 'csv' > rl_tomo_old.csv
influx -database 'rltrader' -execute 'select * from XTZ-PERP' -format 'csv' > rl_xtz_old.csv
influx -database 'rltrader' -execute 'select * from account' -format 'csv' > rl_account.csv

influx -database 'Tradesdb' -execute 'select * from trades-FTX' -format 'csv' > tradesdb.csv

# move csv's
echo "Moving csv's"
mv BTC_account.csv ../Dropbox-Uploader/BTC_account.csv
mv BTC_all_positions.csv ../Dropbox-Uploader/BTC_all_positions.csv
mv BTC_balances.csv ../Dropbox-Uploader/BTC_balances.csv
mv BTC_fills.csv ../Dropbox-Uploader/BTC_fills.csv
mv BTC_orders.csv ../Dropbox-Uploader/BTC_orders.csv
mv BTC_positions.csv ../Dropbox-Uploader/BTC_positions.csv

mv BCH_account.csv ../Dropbox-Uploader/BCH_account.csv
mv BCH_all_positions.csv ../Dropbox-Uploader/BCH_all_positions.csv
mv BCH_balances.csv ../Dropbox-Uploader/BCH_balances.csv
mv BCH_fills.csv ../Dropbox-Uploader/BCH_fills.csv
mv BCH_orders.csv ../Dropbox-Uploader/BCH_orders.csv
mv BCH_positions.csv ../Dropbox-Uploader/BCH_positions.csv

mv ETH_account.csv ../Dropbox-Uploader/ETH_account.csv
mv ETH_all_positions.csv ../Dropbox-Uploader/ETH_all_positions.csv
mv ETH_balances.csv ../Dropbox-Uploader/ETH_balances.csv
mv ETH_fills.csv ../Dropbox-Uploader/ETH_fills.csv
mv ETH_orders.csv ../Dropbox-Uploader/ETH_orders.csv
mv ETH_positions.csv ../Dropbox-Uploader/ETH_positions.csv

mv EOS_account.csv ../Dropbox-Uploader/EOS_account.csv
mv EOS_all_positions.csv ../Dropbox-Uploader/EOS_all_positions.csv
mv EOS_balances.csv ../Dropbox-Uploader/EOS_balances.csv
mv EOS_fills.csv ../Dropbox-Uploader/EOS_fills.csv
mv EOS_orders.csv ../Dropbox-Uploader/EOS_orders.csv
mv EOS_positions.csv ../Dropbox-Uploader/EOS_positions.csv

mv LTC_account.csv ../Dropbox-Uploader/LTC_account.csv
mv LTC_all_positions.csv ../Dropbox-Uploader/LTC_all_positions.csv
mv LTC_balances.csv ../Dropbox-Uploader/LTC_balances.csv
mv LTC_fills.csv ../Dropbox-Uploader/LTC_fills.csv
mv LTC_orders.csv ../Dropbox-Uploader/LTC_orders.csv
mv LTC_positions.csv ../Dropbox-Uploader/LTC_positions.csv

mv LINK_account.csv ../Dropbox-Uploader/LINK_account.csv
mv LINK_all_positions.csv ../Dropbox-Uploader/LINK_all_positions.csv
mv LINK_balances.csv ../Dropbox-Uploader/LINK_balances.csv
mv LINK_fills.csv ../Dropbox-Uploader/LINK_fills.csv
mv LINK_orders.csv ../Dropbox-Uploader/LINK_orders.csv
mv LINK_positions.csv ../Dropbox-Uploader/LINK_positions.csv

mv XTZ_account.csv ../Dropbox-Uploader/XTZ_account.csv
mv XTZ_all_positions.csv ../Dropbox-Uploader/XTZ_all_positions.csv
mv XTZ_balances.csv ../Dropbox-Uploader/XTZ_balances.csv
mv XTZ_fills.csv ../Dropbox-Uploader/XTZ_fills.csv
mv XTZ_orders.csv ../Dropbox-Uploader/XTZ_orders.csv
mv XTZ_positions.csv ../Dropbox-Uploader/XTZ_positions.csv

mv OKB_account.csv ../Dropbox-Uploader/OKB_account.csv
mv OKB_all_positions.csv ../Dropbox-Uploader/OKB_all_positions.csv
mv OKB_balances.csv ../Dropbox-Uploader/OKB_balances.csv
mv OKB_fills.csv ../Dropbox-Uploader/OKB_fills.csv
mv OKB_orders.csv ../Dropbox-Uploader/OKB_orders.csv
mv OKB_positions.csv ../Dropbox-Uploader/OKB_positions.csv

mv ALGO_account.csv ../Dropbox-Uploader/ALGO_account.csv
mv ALGO_all_positions.csv ../Dropbox-Uploader/ALGO_all_positions.csv
mv ALGO_balances.csv ../Dropbox-Uploader/ALGO_balances.csv
mv ALGO_fills.csv ../Dropbox-Uploader/ALGO_fills.csv
mv ALGO_orders.csv ../Dropbox-Uploader/ALGO_orders.csv
mv ALGO_positions.csv ../Dropbox-Uploader/ALGO_positions.csv

mv TOMO_account.csv ../Dropbox-Uploader/TOMO_account.csv
mv TOMO_all_positions.csv ../Dropbox-Uploader/TOMO_all_positions.csv
mv TOMO_balances.csv ../Dropbox-Uploader/TOMO_balances.csv
mv TOMO_fills.csv ../Dropbox-Uploader/TOMO_fills.csv
mv TOMO_orders.csv ../Dropbox-Uploader/TOMO_orders.csv
mv TOMO_positions.csv ../Dropbox-Uploader/TOMO_positions.csv

mv rl_algo_old.csv ../Dropbox-Uploader/rl_algo_old.csv
mv rl_algo.csv ../Dropbox-Uploader/rl_algo.csv
mv rl_alt_old.csv ../Dropbox-Uploader/rl_alt_old.csv
mv rl_alt.csv ../Dropbox-Uploader/rl_alt.csv
mv rl_bch.csv ../Dropbox-Uploader/rl_bch.csv
mv rl_btc_old.csv ../Dropbox-Uploader/rl_btc_old.csv
mv rl_btc.csv ../Dropbox-Uploader/rl_btc.csv
mv rl_eos_old.csv ../Dropbox-Uploader/rl_eos_old.csv
mv rl_eos.csv ../Dropbox-Uploader/rl_eos.csv
mv rl_eth_old.csv ../Dropbox-Uploader/rl_eth_old.csv
mv rl_eth.csv ../Dropbox-Uploader/rl_eth.csv
mv rl_link_old.csv ../Dropbox-Uploader/rl_link_old.csv
mv rl_link.csv ../Dropbox-Uploader/rl_link.csv
mv rl_ltc_old.csv ../Dropbox-Uploader/rl_ltc_old.csv
mv rl_ltc.csv ../Dropbox-Uploader/rl_ltc.csv
mv rl_okb_old.csv ../Dropbox-Uploader/rl_okb_old.csv
mv rl_tomo_old.csv ../Dropbox-Uploader/rl_tomo_old.csv
mv rl_xtz_old.csv ../Dropbox-Uploader/rl_xtz_old.csv
mv rl_account.csv ../Dropbox-Uploader/rl_account.csv

mv tradesdb.csv ../Dropbox-Uploader/tradesdb.csv

# upload csv's
echo "Uploading csv's"
cd ..
cd Dropbox-Uploader
./dropbox_uploader.sh upload BTC_account.csv /dropbox/rltrader
./dropbox_uploader.sh upload /BTC_all_positions.csv /dropbox/rltrader
./dropbox_uploader.sh upload BTC_balances.csv /dropbox/rltrader
./dropbox_uploader.sh upload BTC_fills.csv /dropbox/rltrader
./dropbox_uploader.sh upload BTC_orders.csv /dropbox/rltrader
./dropbox_uploader.sh upload BTC_positions.csv /dropbox/rltrader

./dropbox_uploader.sh upload BCH_account.csv /dropbox/rltrader
./dropbox_uploader.sh upload BCH_all_positions.csv /dropbox/rltrader
./dropbox_uploader.sh upload BCH_balances.csv /dropbox/rltrader
./dropbox_uploader.sh upload BCH_fills.csv /dropbox/rltrader
./dropbox_uploader.sh upload BCH_orders.csv /dropbox/rltrader
./dropbox_uploader.sh upload BCH_positions.csv /dropbox/rltrader

./dropbox_uploader.sh upload ETH_account.csv /dropbox/rltrader
./dropbox_uploader.sh upload ETH_all_positions.csv /dropbox/rltrader
./dropbox_uploader.sh upload ETH_balances.csv /dropbox/rltrader
./dropbox_uploader.sh upload ETH_fills.csv /dropbox/rltrader
./dropbox_uploader.sh upload ETH_orders.csv /dropbox/rltrader
./dropbox_uploader.sh upload ETH_positions.csv /dropbox/rltrader

./dropbox_uploader.sh upload EOS_account.csv /dropbox/rltrader
./dropbox_uploader.sh upload EOS_all_positions.csv /dropbox/rltrader
./dropbox_uploader.sh upload EOS_balances.csv /dropbox/rltrader
./dropbox_uploader.sh upload EOS_fills.csv /dropbox/rltrader
./dropbox_uploader.sh upload EOS_orders.csv /dropbox/rltrader
./dropbox_uploader.sh upload EOS_positions.csv /dropbox/rltrader

./dropbox_uploader.sh upload LTC_account.csv /dropbox/rltrader
./dropbox_uploader.sh upload LTC_all_positions.csv /dropbox/rltrader
./dropbox_uploader.sh upload LTC_balances.csv /dropbox/rltrader
./dropbox_uploader.sh upload LTC_fills.csv /dropbox/rltrader
./dropbox_uploader.sh upload LTC_orders.csv /dropbox/rltrader
./dropbox_uploader.sh upload LTC_positions.csv /dropbox/rltrader

./dropbox_uploader.sh upload LINK_account.csv /dropbox/rltrader
./dropbox_uploader.sh upload LINK_all_positions.csv /dropbox/rltrader
./dropbox_uploader.sh upload LINK_balances.csv /dropbox/rltrader
./dropbox_uploader.sh upload LINK_fills.csv /dropbox/rltrader
./dropbox_uploader.sh upload LINK_orders.csv /dropbox/rltrader
./dropbox_uploader.sh upload LINK_positions.csv /dropbox/rltrader

./dropbox_uploader.sh upload XTZ_account.csv /dropbox/rltrader
./dropbox_uploader.sh upload XTZ_all_positions.csv /dropbox/rltrader
./dropbox_uploader.sh upload XTZ_balances.csv /dropbox/rltrader
./dropbox_uploader.sh upload XTZ_fills.csv /dropbox/rltrader
./dropbox_uploader.sh upload XTZ_orders.csv /dropbox/rltrader
./dropbox_uploader.sh upload XTZ_positions.csv /dropbox/rltrader

./dropbox_uploader.sh upload OKB_account.csv /dropbox/rltrader
./dropbox_uploader.sh upload OKB_all_positions.csv /dropbox/rltrader
./dropbox_uploader.sh upload OKB_balances.csv /dropbox/rltrader
./dropbox_uploader.sh upload OKB_fills.csv /dropbox/rltrader
./dropbox_uploader.sh upload OKB_orders.csv /dropbox/rltrader
./dropbox_uploader.sh upload OKB_positions.csv /dropbox/rltrader

./dropbox_uploader.sh upload ALGO_account.csv /dropbox/rltrader
./dropbox_uploader.sh upload ALGO_all_positions.csv /dropbox/rltrader
./dropbox_uploader.sh upload ALGO_balances.csv /dropbox/rltrader
./dropbox_uploader.sh upload ALGO_fills.csv /dropbox/rltrader
./dropbox_uploader.sh upload ALGO_orders.csv /dropbox/rltrader
./dropbox_uploader.sh upload ALGO_positions.csv /dropbox/rltrader

./dropbox_uploader.sh upload TOMO_account.csv /dropbox/rltrader
./dropbox_uploader.sh upload TOMO_all_positions.csv /dropbox/rltrader
./dropbox_uploader.sh upload TOMO_balances.csv /dropbox/rltrader
./dropbox_uploader.sh upload TOMO_fills.csv /dropbox/rltrader
./dropbox_uploader.sh upload TOMO_orders.csv /dropbox/rltrader
./dropbox_uploader.sh upload TOMO_positions.csv /dropbox/rltrader

./dropbox_uploader.sh upload rl_algo_old.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_algo.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_alt_old.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_alt.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_bch.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_btc_old.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_btc.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_eos_old.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_eos.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_eth_old.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_eth.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_link_old.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_link.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_ltc_old.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_ltc.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_okb_old.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_tomo_old.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_xtz_old.csv /dropbox/rltrader
./dropbox_uploader.sh upload rl_account.csv /dropbox/rltrader

./dropbox_uploader.sh upload tradesdb.csv /dropbox/rltrader

# delete csv's
rm -f BTC_account.csv
rm -f BTC_all_positions.csv
rm -f BTC_balances.csv
rm -f BTC_fills.csv
rm -f BTC_orders.csv
rm -f BTC_positions.csv

rm -f BCH_account.csv
rm -f BCH_all_positions.csv
rm -f BCH_balances.csv
rm -f BCH_fills.csv
rm -f BCH_orders.csv
rm -f BCH_positions.csv

rm -f ETH_account.csv
rm -f ETH_all_positions.csv
rm -f ETH_balances.csv
rm -f ETH_fills.csv
rm -f ETH_orders.csv
rm -f ETH_positions.csv

rm -f EOS_account.csv
rm -f EOS_all_positions.csv
rm -f EOS_balances.csv
rm -f EOS_fills.csv
rm -f EOS_orders.csv
rm -f EOS_positions.csv

rm -f LTC_account.csv
rm -f LTC_all_positions.csv
rm -f LTC_balances.csv
rm -f LTC_fills.csv
rm -f LTC_orders.csv
rm -f LTC_positions.csv

rm -f LINK_account.csv
rm -f LINK_all_positions.csv
rm -f LINK_balances.csv
rm -f LINK_fills.csv
rm -f LINK_orders.csv
rm -f LINK_positions.csv

rm -f XTZ_account.csv
rm -f XTZ_all_positions.csv
rm -f XTZ_balances.csv
rm -f XTZ_fills.csv
rm -f XTZ_orders.csv
rm -f XTZ_positions.csv

rm -f OKB_account.csv
rm -f OKB_all_positions.csv
rm -f OKB_balances.csv
rm -f OKB_fills.csv
rm -f OKB_orders.csv
rm -f OKB_positions.csv

rm -f ALGO_account.csv
rm -f ALGO_all_positions.csv
rm -f ALGO_balances.csv
rm -f ALGO_fills.csv
rm -f ALGO_orders.csv
rm -f ALGO_positions.csv

rm -f TOMO_account.csv
rm -f TOMO_all_positions.csv
rm -f TOMO_balances.csv
rm -f TOMO_fills.csv
rm -f TOMO_orders.csv
rm -f TOMO_positions.csv

rm -f rl_algo_old.csv
rm -f rl_algo.csv
rm -f rl_alt_old.csv
rm -f rl_alt.csv
rm -f rl_bch.csv
rm -f rl_btc_old.csv
rm -f rl_btc.csv
rm -f rl_eos_old.csv
rm -f rl_eos.csv
rm -f rl_eth_old.csv
rm -f rl_eth.csv
rm -f rl_link_old.csv
rm -f rl_link.csv
rm -f rl_ltc_old.csv
rm -f rl_ltc.csv
rm -f rl_okb_old.csv
rm -f rl_tomo_old.csv
rm -f rl_xtz_old.csv
rm -f rl_account.csv

rm -f tradesdb.csv
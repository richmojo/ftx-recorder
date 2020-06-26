# get csv's
echo "Getting csv's"
influx -database 'rltrader' -execute 'select * from "ALGO-PERP"' -format 'csv' > rl_algo_old.csv
influx -database 'rltrader' -execute 'select * from "ALGO-PERP-ALGO"' -format 'csv' > rl_algo.csv
influx -database 'rltrader' -execute 'select * from "ALT-PERP"' -format 'csv' > rl_alt_old.csv
influx -database 'rltrader' -execute 'select * from "ALT-PERP-ALT"' -format 'csv' > rl_alt.csv
influx -database 'rltrader' -execute 'select * from "BCH-PERP"' -format 'csv' > rl_bch.csv
influx -database 'rltrader' -execute 'select * from "BTC-PERP"' -format 'csv' > rl_btc_old.csv
influx -database 'rltrader' -execute 'select * from "BTC-PERP-BTC"' -format 'csv' > rl_btc.csv
influx -database 'rltrader' -execute 'select * from "EOS-PERP"' -format 'csv' > rl_eos_old.csv
influx -database 'rltrader' -execute 'select * from "EOS-PERP-EOS"' -format 'csv' > rl_eos.csv
influx -database 'rltrader' -execute 'select * from "ETH-PERP"' -format 'csv' > rl_eth_old.csv
influx -database 'rltrader' -execute 'select * from "ETH-PERP-ETH"' -format 'csv' > rl_eth.csv
influx -database 'rltrader' -execute 'select * from "LINK-PERP"' -format 'csv' > rl_link_old.csv
influx -database 'rltrader' -execute 'select * from "LINK-PERP-LINK"' -format 'csv' > rl_link.csv
influx -database 'rltrader' -execute 'select * from "LTC-PER"P' -format 'csv' > rl_ltc_old.csv
influx -database 'rltrader' -execute 'select * from "LTC-PERP-LTC"' -format 'csv' > rl_ltc.csv
influx -database 'rltrader' -execute 'select * from "OKB-PERP"' -format 'csv' > rl_okb_old.csv
influx -database 'rltrader' -execute 'select * from "TOMO-PERP"' -format 'csv' > rl_tomo_old.csv
influx -database 'rltrader' -execute 'select * from "XTZ-PERP"' -format 'csv' > rl_xtz_old.csv
influx -database 'rltrader' -execute 'select * from account' -format 'csv' > rl_account.csv

influx -database 'Tradesdb' -execute 'select * from trades-FTX' -format 'csv' > tradesdb.csv

# move csv's
echo "Moving csv's"
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
./dropbox_uploader.sh upload rl_algo_old.csv /rltrader
./dropbox_uploader.sh upload rl_algo.csv /rltrader
./dropbox_uploader.sh upload rl_alt_old.csv /rltrader
./dropbox_uploader.sh upload rl_alt.csv /rltrader
./dropbox_uploader.sh upload rl_bch.csv /rltrader
./dropbox_uploader.sh upload rl_btc_old.csv /rltrader
./dropbox_uploader.sh upload rl_btc.csv /rltrader
./dropbox_uploader.sh upload rl_eos_old.csv /rltrader
./dropbox_uploader.sh upload rl_eos.csv /rltrader
./dropbox_uploader.sh upload rl_eth_old.csv /rltrader
./dropbox_uploader.sh upload rl_eth.csv /rltrader
./dropbox_uploader.sh upload rl_link_old.csv /rltrader
./dropbox_uploader.sh upload rl_link.csv /rltrader
./dropbox_uploader.sh upload rl_ltc_old.csv /rltrader
./dropbox_uploader.sh upload rl_ltc.csv /rltrader
./dropbox_uploader.sh upload rl_okb_old.csv /rltrader
./dropbox_uploader.sh upload rl_tomo_old.csv /rltrader
./dropbox_uploader.sh upload rl_xtz_old.csv /rltrader
./dropbox_uploader.sh upload rl_account.csv /rltrader

./dropbox_uploader.sh upload tradesdb.csv /dropbox/rltrader

# delete csv's
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
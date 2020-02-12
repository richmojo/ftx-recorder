#!/bin/bash

# influxdb
echo "Installing influxdb"
sudo yum update -y
wget https://dl.influxdata.com/influxdb/releases/influxdb-1.7.9.x86_64.rpm
sudo yum localinstall -y influxdb-1.7.9.x86_64.rpm
sudo systemctl daemon-reload
sudo systemctl start influxdb
echo "influxdb started."

# trades recorder
echo "Installing trades recorder"
sudo yum install -y python3 python3-pip
sudo -H pip3 install -U pip
pip3 install -U --no-cache-dir -r requirements.txt
sudo cp account_recorder.service /etc/systemd/system
sudo chown -R root:root /etc/systemd/system/account_recorder.service
sudo chmod -R 644 /etc/systemd/system/account_recorder.service
sudo systemctl daemon-reload
sudo systemctl enable account_recorder.service

# account recorder
echo "Installing account recorder"
sudo yum install -y python3 python3-pip
sudo -H pip3 install -U pip
pip3 install -U --no-cache-dir -r requirements.txt
sudo cp account_recorder.service /etc/systemd/system
sudo chown -R root:root /etc/systemd/system/account_recorder.service
sudo chmod -R 644 /etc/systemd/system/account_recorder.service
sudo systemctl daemon-reload
sudo systemctl enable account_recorder.service
echo "bitmex recorder enabled"
echo "sudo systemctl start bitmex to start"
echo "sudo systemctl stop bitmex to stop"
echo "sudo systemctl disable bitmex to disable start at boot"

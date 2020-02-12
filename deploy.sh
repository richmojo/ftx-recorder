#!/bin/bash

sudo cp account_recorder.service /etc/systemd/system
sudo chown -R root:root /etc/systemd/system/account_recorder.service
sudo chmod -R 644 /etc/systemd/system/account_recorder.service
sudo systemctl daemon-reload
sudo systemctl restart account_recorder.service

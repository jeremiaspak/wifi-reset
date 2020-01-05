#!/bin/bash
echo "Installing wifi reset service to /opt/wifi-reset."
mkdir -p /opt/wifi-reset
cp -f wifi-reset.sh /opt/wifi-reset/wifi-reset.sh
chmod +x /opt/wifi-reset/wifi-reset.sh
echo "Installing systemd service."
cp -f wifi-reset.service /lib/systemd/system/wifi-reset.service
chmod 644 /lib/systemd/system/wifi-reset.service
echo "Enabling systemd service to run at boot"
systemctl enable wifi-reset.service > /dev/null

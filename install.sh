#!/bin/bash

# Install AWUS036ACH drivers.
apt --yes install realtek-rtl88xxau-dkms

# Install Bettercap.
apt --yes install build-essential libpcap-dev libusb-1.0-0-dev libnetfilter-queue-dev
mkdir -p /opt/bettercap
cd /opt/bettercap
wget https://github.com/bettercap/bettercap/releases/download/v2.22/bettercap_linux_amd64_2.22.zip
unzip bettercap_linux_amd64_2.22.zip

# Install hcxtools.
apt update
kill `lsof /var/lib/dpkg/lock-frontend | tail -1 | awk '{print $2}'`
apt --yes install git libcurl4-openssl-dev libssl-dev zlib1g-dev
cd /opt
git clone https://github.com/ZerBea/hcxdumptool.git
git clone https://github.com/ZerBea/hcxtools.git
cd /opt/hcxdumptool
make
make install
cd /opt/hcxtools
make
make install

# Plugin AWUS036ACH.
read -p "Connect the AWUS036ACH, then press [ENTER]..."
service network-manager stop
killall wpa_supplicant
sleep 2
ip link set wlan1 down
sleep 2
iwconfig wlan1 mode monitor
sleep 2
ip link set wlan1 up

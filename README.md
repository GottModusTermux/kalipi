# kalipi


There's plenty out there about this attack (see resources at bottom), so nothing particularly novel here. As always, you _must_ only execute this workflow on networks where you have permission.

## Setup

1. Laptop
2. [Kali Live USB](https://docs.kali.org/downloading/kali-linux-live-usb-install)
3. [Alfa AC1200 (AWUS036ACH)](https://www.amazon.com/Alfa-Long-Range-Dual-Band-Wireless-External/dp/B00VEEBOPG)

## Installation

1. Boot into Kali.
2. Connect to a network with Internet access to download packages.
3. Execute `install.sh` script.
4. Ensure that the card is connected when prompted.
5. Confirm that card is running in _monitor_ mode with `iwconfig`.

## Capturing Hashes

1. Execute `capture.sh` script.
2. When complete, enter `wifi.show; wifi.recon off; q` in bettercap.
3. When script is finished, it will list all APs where PMKIDs were captured.
4. Hashes will be found in the `*.pmkid.txt` files.
5. Session logs will be found in the `*-session_{TOOL}.log` files.

## Cracking Hashes

1. Use [hashcat](https://hashcat.net/hashcat/) with mode 16800, e.g. `hashcat -m16800 hashes.txt wordlist.txt --show --force`.

# kalipi

Setup

Laptop
Kali Live USB
Alfa AC1200 (AWUS036ACH)


Installation

Boot into Kali.
Connect to a network with Internet access to download packages.
Execute install.sh script.
Ensure that the card is connected when prompted.
Confirm that card is running in monitor mode with iwconfig.
Capturing Hashes
Execute capture.sh script.
When complete, enter wifi.show; wifi.recon off; q in bettercap.
When script is finished, it will list all APs where PMKIDs were captured.
Hashes will be found in the *.pmkid.txt files.
Session logs will be found in the *-session_{TOOL}.log files.
Cracking Hashes
Use hashcat with mode 16800, e.g. hashcat -m16800 hashes.txt wordlist.txt --show --force.

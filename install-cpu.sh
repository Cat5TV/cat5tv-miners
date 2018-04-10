#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "ERROR: This script must be run as root" 2>&1
  exit 1
else

  # Enable hugepages
    # Ubuntu
    sysctl -w vm.nr_hugepages=128
    # Debian
    # SEE https://wiki.debian.org/Hugepages#Enabling_HugeTlbPage
    
  #if [[ -d /usr/local/share/cat5tv-miners ]]; then
    #rm -rf /usr/local/share/cat5tv-miners
  #fi

  # Install Monero CPU Miner
  wget -O /tmp/install-monero-cpu.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-monero-cpu.sh && chmod +x /tmp/install-monero-cpu.sh && sudo /tmp/install-monero-cpu.sh

  # Install Turtlecoin CPU miner
  wget -O /tmp/install-turtlecoin-cpu.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-turtlecoin-cpu.sh && chmod +x /tmp/install-turtlecoin-cpu.sh && sudo /tmp/install-turtlecoin-cpu.sh

  # Install Bitcoin CPU miner
  wget -O /tmp/install-bitcoin-cpu.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-bitcoin-cpu.sh && chmod +x /tmp/install-bitcoin-cpu.sh && sudo /tmp/install-bitcoin-cpu.sh

  wget -O /usr/local/share/cat5tv-miners/automine-cpu.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/automine-cpu.sh && chmod +x /usr/local/share/cat5tv-miners/automine-cpu.sh
  wget -O /usr/local/share/cat5tv-miners/stopmine.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/stopmine.sh && chmod +x /usr/local/share/cat5tv-miners/stopmine.sh

  echo ""
  echo If all went well, you should now run: /usr/local/share/cat5tv-miners/automine-cpu.sh

fi

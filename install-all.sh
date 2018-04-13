#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "ERROR: This script must be run as root" 2>&1
  exit 1
else

 # Just in case apt is already doing stuff in the background, hang tight until it completes
 echo "Please wait for apt tasks to complete..."
 while fuser /var/{lib/{dpkg,apt/lists},cache/apt/archives}/lock >/dev/null 2>&1; do sleep 1; done
 echo "Done."
 
  if [[ -d /usr/local/share/cat5tv-miners ]]; then
    rm -rf /usr/local/share/cat5tv-miners
  fi

  # Install CPU Auto-Miner
  wget -O /tmp/install-cpu.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-cpu.sh && chmod +x /tmp/install-cpu.sh && sudo /tmp/install-cpu.sh

  # Install GPU Auto-Miner
  wget -O /tmp/install-gpu.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-gpu.sh && chmod +x /tmp/install-gpu.sh && sudo /tmp/install-gpu.sh

  echo
  echo If all went well you can now run your cat5tv-miners with the following:
  echo CPU Miner: /usr/local/share/cat5tv-miners/automine-cpu.sh
  echo GPU Miner: /usr/local/share/cat5tv-miners/automine-gpu.sh
  echo
  echo "To stop mining use: /usr/local/share/cat5tv-miners/stopmine.sh [cpu|gpu]"
  echo
  echo Any trouble, just let me know. Thanks for supporting Category5 TV!
  echo

fi

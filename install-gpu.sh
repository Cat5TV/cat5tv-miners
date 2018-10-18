#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "ERROR: This script must be run as root" 2>&1
  exit 1
else

 # Just in case apt is already doing stuff in the background, hang tight until it completes
 echo "Please wait for apt tasks to complete..."
 while fuser /var/{lib/{dpkg,apt/lists},cache/apt/archives}/lock >/dev/null 2>&1; do sleep 1; done
 echo "Done."

  # Install Bitcoin GPU Miners
  # Same miner for AMD and NVIDIA
  wget -O /tmp/install-bitcoin-gpu.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-bitcoin-gpu.sh && chmod +x /tmp/install-bitcoin-gpu.sh && sudo /tmp/install-bitcoin-gpu.sh

  # Install Ethereum GPU Miners
  wget -O /tmp/install-ethereum-gpu-amd.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-ethereum-gpu-amd.sh && chmod +x /tmp/install-ethereum-gpu-amd.sh && sudo /tmp/install-ethereum-gpu-amd.sh
  wget -O /tmp/install-ethereum-gpu-nvidia.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-ethereum-gpu-nvidia.sh && chmod +x /tmp/install-ethereum-gpu-nvidia.sh && sudo /tmp/install-ethereum-gpu-nvidia.sh

  # Install Monero GPU Miners
  wget -O /tmp/install-monero-gpu-nvidia.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-monero-gpu-nvidia.sh && chmod +x /tmp/install-monero-gpu-nvidia.sh && sudo /tmp/install-monero-gpu-nvidia.sh
  wget -O /tmp/install-monero-gpu-amd.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-monero-gpu-amd.sh && chmod +x /tmp/install-monero-gpu-amd.sh && sudo /tmp/install-monero-gpu-amd.sh

  # Install Turtlecoin GPU miners
  wget -O /tmp/install-turtlecoin-gpu-nvidia.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-turtlecoin-gpu-nvidia.sh && chmod +x /tmp/install-turtlecoin-gpu-nvidia.sh && sudo /tmp/install-turtlecoin-gpu-nvidia.sh
  wget -O /tmp/install-turtlecoin-gpu-amd.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-turtlecoin-gpu-amd.sh && chmod +x /tmp/install-turtlecoin-gpu-amd.sh && sudo /tmp/install-turtlecoin-gpu-amd.sh

  # Install Stellite GPU miners
  wget -O /tmp/install-stellite-gpu-nvidia.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-stellite-gpu-nvidia.sh && chmod +x /tmp/install-stellite-gpu-nvidia.sh && sudo /tmp/install-stellite-gpu-nvidia.sh
  wget -O /tmp/install-stellite-gpu-amd.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-stellite-gpu-amd.sh && chmod +x /tmp/install-stellite-gpu-amd.sh && sudo /tmp/install-stellite-gpu-amd.sh

  # Grab the launchers
  wget -O /usr/local/share/cat5tv-miners/automine-gpu-nvidia.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/automine-gpu-nvidia.sh && chmod +x /usr/local/share/cat5tv-miners/automine-gpu-nvidia.sh
  wget -O /usr/local/share/cat5tv-miners/automine-gpu-amd.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/automine-gpu-amd.sh && chmod +x /usr/local/share/cat5tv-miners/automine-gpu-amd.sh
  wget -O /usr/local/share/cat5tv-miners/stopmine.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/stopmine.sh && chmod +x /usr/local/share/cat5tv-miners/stopmine.sh

  echo ""
  echo If all went well, you should now run:
  echo Nvidia Cards: /usr/local/share/cat5tv-miners/automine-gpu-nvidia.sh
  echo AMD Cards: /usr/local/share/cat5tv-miners/automine-gpu-amd.sh

fi

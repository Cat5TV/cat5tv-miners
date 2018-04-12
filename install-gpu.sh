#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "ERROR: This script must be run as root" 2>&1
  exit 1
else

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
  wget -O /usr/local/share/cat5tv-miners/automine-gpu.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/automine-gpu.sh && chmod +x /usr/local/share/cat5tv-miners/automine-gpu.sh
  wget -O /usr/local/share/cat5tv-miners/stopmine.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/stopmine.sh && chmod +x /usr/local/share/cat5tv-miners/stopmine.sh

  echo ""
  echo If all went well, you should now run: /usr/local/share/cat5tv-miners/automine-cpu.sh

fi

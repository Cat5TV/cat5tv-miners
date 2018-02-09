#!/bin/bash
# Mine Monero in support of the Category5 TV Network
# Family-friendly broadcasting from Canada
# See https://category5.tv/

# This script installs Monero CPU mining on a Debian-based Linux system
# This build does not use the GPU and is therefore perfect for older hardware or Raspberry Pi

if [[ $EUID -ne 0 ]]; then
  echo "ERROR: This script must be run as root" 2>&1
  exit 1
else

dest="/usr/local/share/cat5tv-miner/monero" # No trailing slash

# Install dependencies
apt update && apt -y upgrade && apt -y dist-upgrade
apt -y install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git libz-dev git build-essential cmake libuv1-dev libmicrohttpd-dev

# Build XMRIG
mkdir -p $dest && cd $dest && git clone https://github.com/xmrig/xmrig && cd xmrig && mkdir build && cd build && cmake .. && make

# Create the bash script to execute Monero mining to Category5's wallet
wallet="4Ao8jximsZ5hkRLP6tHHfuiBFmd6nzb1VeL1btdeBDZ8N3LpFZVk3LiBiL5T1yoXtaftqHcSKE5YQdQNpizFRyYVFUfMiZ6"
echo "#!/bin/bash" > $dest/monero.sh
echo "$dest/xmrig/build/xmrig -o pool.monero.hashvault.pro:5555 -u $wallet -p x -k -o pool.supportxmr.com:5555 -u $wallet -p x -k --donate-level=1" >> $dest/monero.sh
chmod +x $dest/monero.sh

echo Done. To begin mining Monero type: $dest/monero.sh

fi

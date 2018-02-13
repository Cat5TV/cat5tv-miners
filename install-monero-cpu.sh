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

dest="/usr/local/share/cat5tv-miner" # No trailing slash

name=$(basename $0)
name="${name%.*}"
name="${name#install-}"

# Install dependencies
apt update && apt -y upgrade && apt -y dist-upgrade
apt -y install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git libz-dev git build-essential cmake libuv1-dev libmicrohttpd-dev

# Build XMRIG
mkdir -p $dest/software && cd $dest/software && git clone https://github.com/xmrig/xmrig && mv xmrig $name && cd $name && cmake . && make

# Create the bash script to execute Monero mining to Category5's wallet
wallet="4Ao8jximsZ5hkRLP6tHHfuiBFmd6nzb1VeL1btdeBDZ8N3LpFZVk3LiBiL5T1yoXtaftqHcSKE5YQdQNpizFRyYVFUfMiZ6"
echo "#!/bin/bash" > $dest/$name.sh
echo "cores=\$(nproc --all)" >> $dest/$name.sh
if [[ $cores -ge 12 ]]; then
  echo "let cores=cores-2" >> $dest/$name.sh
fi
echo "$dest/software/$name/xmrig --threads=\$cores -o pool.monero.hashvault.pro:3333 -u $wallet -p cat5tv:x -k --donate-level=1" >> $dest/$name.sh
chmod +x $dest/$name.sh

echo Done. To begin mining Monero type: $dest/$name.sh

fi

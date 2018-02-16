#!/bin/bash
# Mine Monero in support of the Category5 TV Network
# Family-friendly broadcasting from Canada
# See https://category5.tv/

# This script installs Monero GPU mining (AMD) on a Debian-based Linux system

if [[ $EUID -ne 0 ]]; then
  echo "ERROR: This script must be run as root" 2>&1
  exit 1
else

dest="/usr/local/share/cat5tv-miner" # No trailing slash
wallet=$(cat wallets/cat5tv-monero)

name=$(basename $0)
name="${name%.*}"
name=${name#install-}

# Install dependencies
apt update
apt -y install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git libz-dev git build-essential cmake libuv1-dev libmicrohttpd-dev

# Build XMRIG
mkdir -p $dest/software && cd $dest/software && git clone https://github.com/xmrig/xmrig-amd && mv xmrig-amd $name && cd $name && cmake . && make

# Create the bash script to execute Monero mining to Category5's wallet
echo "#!/bin/bash" > $dest/$name.sh
echo "port=3333 # For SBC/Up to 100 H/s" >> $dest/$name.sh
echo "$dest/software/$name/xmrig-amd -o pool.monero.hashvault.pro:\$port -u $wallet -p cat5tv:x -k --donate-level=1" >> $dest/$name.sh
chmod +x $dest/$name.sh

echo Done. To begin mining Monero type: $dest/$name.sh

fi

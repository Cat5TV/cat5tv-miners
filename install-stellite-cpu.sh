#!/bin/bash
# Mine Stellite in support of the Category5 TV Network
# Family-friendly broadcasting from Canada
# See https://category5.tv/

# This script installs Stellite CPU mining on a Debian-based Linux system
# This build does not use the GPU and is therefore perfect for older hardware or Raspberry Pi

if [[ $EUID -ne 0 ]]; then
  echo "ERROR: This script must be run as root" 2>&1
  exit 1
else

dest="/usr/local/share/cat5tv-miners" # No trailing slash
wallet=$(wget -qO- https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/wallets/cat5tv-stellite)

name=$(basename $0)
name="${name%.*}"
name=${name#install-}

# Install dependencies
apt-get update
apt-get -y install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git libz-dev git build-essential cmake libuv1-dev libmicrohttpd-dev

# Build XMRIG
mkdir -p $dest/software && cd $dest/software && git clone https://github.com/xmrig/xmrig && mv xmrig $name && cd $name && cmake . && make

# Create the bash script to execute Monero mining to Category5's wallet
echo "#!/bin/bash" > $dest/$name.sh
echo "port=3333 # For SBC/Up to 100 H/s" >> $dest/$name.sh
echo "cores=\$(nproc --all)" >> $dest/$name.sh
echo "if [ \"\$cores\" -ge \"8\" ]; then
  let cores=cores-1 # Leave 1 core free for GPU mining
fi" >> $dest/$name.sh
echo "if [ \"\$cores\" -ge \"12\" ]; then
  let cores=cores-1 # Leave 2 cores free for GPU mining (yes, -1 because we already -1 above)
  port=5555 # For medium-grade hardware (~200 H/s)
fi" >> $dest/$name.sh
echo "$dest/software/$name/xmrig --algo=cryptonight --variant=1 --threads=\$cores -o communitypool.stellite.cash:\$port -u $wallet -p cat5tv -k --donate-level=1" >> $dest/$name.sh
chmod +x $dest/$name.sh

echo Done. To begin mining Stellite type: $dest/$name.sh

fi

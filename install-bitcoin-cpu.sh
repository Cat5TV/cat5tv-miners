#!/bin/bash
# Mine Bitcoin support of the Category5 TV Network
# Family-friendly broadcasting from Canada
# See https://category5.tv/

# This script installs Bitcoin CPU mining on a Debian-based Linux system
# This build does not use the GPU and is therefore perfect for older hardware or Raspberry Pi

if [[ $EUID -ne 0 ]]; then
  echo "ERROR: This script must be run as root" 2>&1
  exit 1
else

dest="/usr/local/share/cat5tv-miner" # No trailing slash

name=$(basename $0)
name="${name%.*}"
name=${name#install-}

# Install dependencies
apt update
apt -y install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git libz-dev git build-essential cmake libuv1-dev libmicrohttpd-dev

# Build cpuminer
mkdir -p $dest/software && cd $dest/software && git clone https://github.com/pooler/cpuminer && mv cpuminer $name && cd $name && ./autogen.sh && ./configure CFLAGS="-O3" && make

# Create the bash script to execute mining to Category5's wallet
echo "#!/bin/bash" > $dest/$name.sh
echo "cores=$(nproc --all)" >> $dest/$name.sh
echo "let cores=cores-2" >> $dest/$name.sh
echo "$dest/software/$name/minerd --threads=\$cores -a sha256d --url=stratum+tcp://mint.bitminter.com:3333 --userpass=cat5tv_cat5tv:cat5tv" >> $dest/$name.sh
chmod +x $dest/$name.sh

echo Done. To begin mining Bitcoin type: $dest/$name.sh

fi

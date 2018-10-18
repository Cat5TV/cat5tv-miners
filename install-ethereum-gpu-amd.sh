#!/bin/bash
# Mine Ethereum in support of the Category5 TV Network
# Family-friendly broadcasting from Canada
# See https://category5.tv/

# This script installs Ethereum GPU mining on a Debian-based Linux system

if [[ $EUID -ne 0 ]]; then
  echo "ERROR: This script must be run as root" 2>&1
  exit 1
else

dest="/usr/local/share/cat5tv-miners" # No trailing slash
wallet=$(wget -qO- https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/wallets/cat5tv-ethereum)

name=$(basename $0)
name="${name%.*}"
name=${name#install-}

# Load or generate a unique miner ID for this user
if [[ -f /tmp/cat5tv-miners.mid ]]; then
  worker=$(cat /tmp/cat5tv-miners.mid)-GPU
else
  echo CAT5TV-$RANDOM > /tmp/cat5tv-miners.mid
  worker=$(cat /tmp/cat5tv-miners.mid)-GPU
fi

# Install dependencies
apt-get update
apt -y install libdbus-1-dev
apt -y install mesa-common-dev

# Build
mkdir -p $dest/software && cd $dest/software && git clone https://github.com/ethereum-mining/ethminer && mv ethminer $name && cd $name && git submodule update --init --recursive && mkdir build && cd build && cmake .. -DETHASHCUDA=OFF && cmake --build .

# Create the bash script to execute mining to Category5's wallet
echo "#!/bin/bash" > $dest/$name.sh
echo "$dest/software/$name/build/ethminer/ethminer -P stratum1+tcp://$wallet.$worker@eth.2miners.com:2020" >> $dest/$name.sh
chmod +x $dest/$name.sh


echo Done. To begin mining Ethereum type: $dest/$name.sh

fi

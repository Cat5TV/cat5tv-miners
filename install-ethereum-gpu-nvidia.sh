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
mkdir -p $dest/software && cd $dest/software && git clone https://github.com/ethereum-mining/ethminer && mv ethminer $name && cd $name && git submodule update --init --recursive && mkdir build && cd build && cmake .. -DBINKERN=OFF && cmake --build .
exit
# Create the bash script to execute mining to Category5's wallet
echo "#!/bin/bash" > $dest/$name.sh
echo "$dest/software/$name/cgminer -o stratum+tcp://mint.bitminter.com:3333 -u cat5tv_cat5tv -p $worker" >> $dest/$name.sh
chmod +x $dest/$name.sh

# Create pseudo scripts since Ethereum GPU mining is same for AMD and NVIDIA
echo "#!/bin/bash" > $dest/$name-amd.sh
echo $dest/$name.sh >> $dest/$name-amd.sh
chmod +x $dest/$name-amd.sh
echo "#!/bin/bash" > $dest/$name-nvidia.sh
echo $dest/$name.sh >> $dest/$name-nvidia.sh
chmod +x $dest/$name-nvidia.sh


echo Done. To begin mining Bitcoin type: $dest/$name.sh

fi

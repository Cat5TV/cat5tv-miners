#!/bin/bash
# Mine Turtlecoin in support of the Category5 TV Network
# Family-friendly broadcasting from Canada
# See https://category5.tv/

# This script installs Turtlecoin GPU mining (NVIDIA) on a Debian-based Linux system

if [[ $EUID -ne 0 ]]; then
  echo "ERROR: This script must be run as root" 2>&1
  exit 1
else

dest="/usr/local/share/cat5tv-miners" # No trailing slash
wallet=$(wget -qO- https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/wallets/cat5tv-turtlecoin)

name=$(basename $0)
name="${name%.*}"
name=${name#install-}

# Install dependencies
apt-get update
apt-get -y install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git libz-dev git build-essential cmake libuv1-dev libmicrohttpd-dev
apt-get -y install nvidia-cuda-toolkit

# Make GCC 5 available as an alternative in Ubuntu (will cause errors in other distros but that's fine for now) so xmrig-nvidia can compile
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install gcc-5 g++-5
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5

# Build XMRIG
mkdir -p $dest/software && cd $dest/software && git clone https://github.com/xmrig/xmrig-nvidia && mv xmrig-nvidia $name && cd $name && cmake . && make

# Create the bash script to execute Monero mining to Category5's wallet
echo "#!/bin/bash" > $dest/$name.sh
echo "port=3333 # For SBC/Up to 100 H/s" >> $dest/$name.sh
echo "$dest/software/$name/xmrig-nvidia -o turtle.mining.garden:\$port -u $wallet -p cat5tv:x -k --donate-level=1" >> $dest/$name.sh
chmod +x $dest/$name.sh

echo Done. To begin mining Monero type: $dest/$name.sh

fi

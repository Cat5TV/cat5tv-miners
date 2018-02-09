# cat5tv-miners
Mine cryptocurrency in support of the Category5.TV Network

## Currently Available

- monero-cpu.sh - For Raspberry Pi or other GPU poor systems. Requires a Debian-based distro.

## Coming Soon

- Ethereum, Litecoin and Bitcoin miners for Windows and Linux.
- Both CPU and GPU mining options.

## Important Performance Notes

CPU Miners will, by default, use your full CPU power for cryptocurrency mining. Therefore, it's best to run them when you do not need to use the computer for other things. However, if you are using Linux, you can optionally change the priority of the miner very easily. Simply prepend nice -n 9 to your command. So if you are running /usr/local/share/cat5tv-miners/monero/monero-cpu.sh you can instead run nice -n 9 /usr/local/share/cat5tv-miners/monero/monero-cpu.sh

When running the miner in the Linux terminal, you can abort it by simply pressing CTRL-C.

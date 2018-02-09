# cat5tv-miners
Mine cryptocurrency in support of the Category5.TV Network

## Currently Available

**monero-cpu.sh**

For Raspberry Pi or other GPU poor systems. Requires a Debian-based distro.

Installation:

```wget -O /tmp/cat5tv-miners-install.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/monero-cpu.sh && chmod +x /tmp/cat5tv-miners-install.sh && sudo /tmp/cat5tv-miners-install.sh```

### Mining Speed

Want to report your mining speed? Please email me a screenshot or complete a PR.

- **Raspberry Pi 3:** 6.5 Hashes per second
- **Logic Supply CL100:** 18.4 Hashes per second

## Coming Soon

- Ethereum, Litecoin and Bitcoin miners for Windows and Linux.
- Both CPU and GPU mining options.

## Important Performance Notes

CPU Miners will, by default, use a large amount of your CPU power for cryptocurrency mining. Therefore, it's best to run them when you do not need to use the computer for other high-cpu tasks such as gaming or encoding video. A powerful desktop computer can probably handle running mining in the background while you surf the web and do general tasks, but something like a Raspberry Pi will be on its knees begging you to not open any other applications.

On Linux, you can optionally change the priority of the miner very easily. Simply prepend nice -n 9 to your command. So if you are running /usr/local/share/cat5tv-miners/monero/monero-cpu.sh you can instead run nice -n 9 /usr/local/share/cat5tv-miners/monero/monero-cpu.sh

When running the miner in the Linux terminal, you can abort it by simply pressing CTRL-C.

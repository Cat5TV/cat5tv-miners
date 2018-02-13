# cat5tv-miners
Mine cryptocurrency in support of the Category5.TV Network

Whether or not this will be a profitable venture is difficult to know.

This writeup on Litecoin is discouraging: https://www.litecoinpool.org/beginners-guide#should-you-mine

But this is, at the very least, a fun experiment.

Running on a few of my own standard desktop computers plus some Raspberry Pi 3's and a couple other small devices, I'm mining ~$3.50 USD or so per week. So with enough of the community running this, we'll definitely be able to support Cat5.

## Already Mining?

Point your miner to our wallet to support the Category5 TV Network:

    Bitcoin BTC: 195GBesssNtvs7nKAiNAvGXC4FJCDt9nfj

    Ethereum ETH: 0xFc412c637fB89a860209f448173AF1EB285458E9

    Lightcoin LTC: LMPPd9zcdmA6CN8XXmMsJGVbPYdqfPyKh6

    Monero XMR: 4Ao8jximsZ5hkRLP6tHHfuiBFmd6nzb1VeL1btdeBDZ8N3LpFZVk3LiBiL5T1yoXtaftqHcSKE5YQdQNpizFRyYVFUfMiZ6

## Quick Thoughts

### How much Internet bandwidth will this use?

Barely any. Mining uses your GPU and/or CPU to find hashes, which are sent to the pool. The amount of data being trnasmitted and received is minimal. We are not at all concerned about running this on our mobile connection.

### Can I continue using my computer while mining for you?

It is quite possible! A super low-powered system (such as a Raspberry Pi 3) would be pretty unusable, but my desktop computers (which are nothing fancy) are entirely usable for general low-CPU tasks (eg., surfing the web, watching YouTube videos, checking email) and the performance is not noticable. The only time you may need to turn off the miner is if you want to play video games or watch 4K video. I also setup the CPU miners to leave a couple CPU cores free on more powerful systems (8+ cores). This'll allow you to do other things with less performance impact, or allow you to add GPU mining.

## Currently Available Miners

All you have to do is install one of these miners to support the Category5 TV Network! Each miner is pre-configured to mine cryptocurrency into the appropriate Category5 wallet.

### Monero CPU Mining

#### Recommended

This miner uses the system's CPU instead of the GPU, making it ideal for systems that lack a powerful GPU. Requires a Debian-based distro.

Monero is quite viable for CPU mining and should turn a profit over time.

**Currency:** Monero

**Mining Pool:** Hash Vault

**Running Process Name:** xmrig

**Installation:**

```
wget -O /tmp/install-monero-cpu.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-monero-cpu.sh && chmod +x /tmp/install-monero-cpu.sh && sudo /tmp/install-monero-cpu.sh
```

**Execution:**

/usr/local/share/cat5tv-miners/monero-cpu.sh

**Run Overnight:**

An example of how you might run your miner from 11pm to 6am every day:

```
0 23 * * * /usr/local/share/cat5tv-miner/monero-cpu.sh
0 6 * * * kill -HUP `pidof xmrig`
```

**Mining Speed:**

Want to report your mining speed? Please email me a screenshot or complete a PR.

- **Raspberry Pi 3:** 6.5 Hashes per second
- **Logic Supply CL100:** 18.4 Hashes per second
- **ODROID XU4Q:** 22.7 Hashes per second

**Revenue:**

- Week 1 (Feb 9-15, 2018): 318 H/s Generating 0.002 XMR per day (about $3.50 USD / week)

### Bitcoin CPU Mining

#### Not Recommended

This miner uses the system's CPU instead of the GPU, making it ideal for systems that lack a powerful GPU. Requires a Debian-based distro.

Bitcoin mining is extremely competetive, and unless you have an ASIC, it will likely be unprofitable.

**Currency:** Bitcoin

**Mining Pool:** Bitminter

**Running Process Name:** cpuminer

**Installation:**

```
wget -O /tmp/install-bitcoin-cpu.sh https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/install-bitcoin-cpu.sh && chmod +x /tmp/install-monero-cpu.sh && sudo /tmp/install-monero-cpu.sh
```
**Execution:**

/usr/local/share/cat5tv-miners/bitcoin-cpu.sh

**Run Overnight:**

An example of how you might run your miner from 11pm to 6am every day:

```
0 23 * * * /usr/local/share/cat5tv-miner/bitcoin-cpu.sh
0 6 * * * kill -HUP `pidof cpuminer`
```

## Coming Soon

- Ethereum and Litecoin miners.
- Both CPU and GPU mining options for all currencies.

## Important Performance Notes

You may run one CPU miner and one GPU miner at a time, but cannot run two of the same type simultaneously. Running more than one of the same type should not be done. But combining GPU + CPU mining (if your system can handle it) will improve your hash rate. cat5tv-miners will automatically leave 1-2 CPU cores free for GPU mining on systems with 8 CPU cores or more.

CPU Miners will, by default, use a large amount of your CPU power for cryptocurrency mining. Therefore, it's best to run them when you do not need to use the computer for other high-cpu tasks such as gaming or encoding video. A powerful desktop computer can probably handle running mining in the background while you surf the web and do general tasks, but something like a Raspberry Pi will be on its knees begging you to not open any other applications.

On Linux, you can optionally change the priority of the miner very easily. Simply prepend nice -n 9 to your command. So if you are running /usr/local/share/cat5tv-miners/monero-cpu.sh you can instead run nice -n 9 /usr/local/share/cat5tv-miners/monero-cpu.sh

When running the miner in the Linux terminal, you can abort it by simply pressing CTRL-C.

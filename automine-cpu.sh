#!/bin/bash

currencies="monero,turtlecoin,stellite,bitcoin" # CSV

# Choose a random currency to begin with...
random=( ${currencies//,/ } )
num=$(( ${#random[@]} -1 ))
newseq=$( shuf -i 0-$num )
options=()
for i in $newseq; do
     options+=("${random[$i]}")
done

while :
do
  for option in "${options[@]}"
  do
    # setup timers
    timer=60 # a default value
    if [[ $option = 'monero' ]]; then
      timer=60; # how many minutes before cycling currencies
    fi
    if [[ $option = 'turtlecoin' ]]; then
      timer=30; # how many minutes before cycling currencies
    fi
    if [[ $option = 'stellite' ]]; then
      timer=15; # how many minutes before cycling currencies
    fi
    if [[ $option = 'bitcoin' ]]; then
      timer=60; # how many minutes before cycling currencies
    fi
    
    let time=timer*60
    executable=/usr/local/share/cat5tv-miners/$option-cpu.sh
    if [[ ! -f $executable ]]; then
      echo You are missing the miner for $option. Please run: sudo ./install-$option-cpu.sh
      sleep 3600
    fi
    $executable& sleep $time; kill $!
    kill -HUP `pidof xmrig`

  done
done

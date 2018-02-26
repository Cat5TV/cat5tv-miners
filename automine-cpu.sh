#!/bin/bash
timer=24; # how many hours before query and restart

while :
do
  let time=timer*3600
  conf=$(wget -qO- https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/automine.conf)
  executable=/usr/local/share/cat5tv-miners/$conf-cpu.sh
  if [[ ! -f $executable ]]; then
    echo You are missing the miner for $conf. Please run: sudo ./install-$conf-cpu.sh
    sleep 3600
  fi
  $executable& sleep $time; kill $!

done

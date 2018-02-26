#!/bin/bash
timer=12; # how many hours before query

while :
do
  let time=timer*3600
  conf=$(wget -qO- https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/automine.conf)
  wallet=$(wget -qO- https://raw.githubusercontent.com/Cat5TV/cat5tv-miners/master/wallets/cat5tv-$conf)
echo $wallet
  timeout $time echo hi

done

#!/bin/bash

if [[ $1 = '' ]]; then
  echo Usage: $0 cpu[or]gpu
  echo ""
  exit
fi

if [[ $1 = 'cpu' ]]; then

  if pgrep -x "xmrig" > /dev/null
  then
    kill -HUP `pidof xmrig`
    echo Stopped process "xmrig"
  fi

  if pgrep -x "minerd" > /dev/null
  then
    kill -HUP `pidof minerd`
    echo Stopped process "minerd"
  fi

  if pgrep -x "automine-cpu.sh" > /dev/null
  then
    killall -9 automine-cpu.sh
    echo Stopped process "automine-cpu.sh"
  fi

fi

if [[ $1 = 'gpu' ]]; then

  if pgrep -x "cgminer" > /dev/null
  then
    kill -HUP `pidof cgminer`
    echo Stopped process "cgminer"
  fi

  if pgrep -x "xmrig-nvidia" > /dev/null
  then
    kill -HUP `pidof xmrig-nvidia`
    echo Stopped process "xmrig-nvidia"
  fi

  if pgrep -x "xmrig-amd" > /dev/null
  then
    kill -HUP `pidof xmrig-amd`
    echo Stopped process "xmrig-amd"
  fi

  pidnvidia=`/bin/ps -fu $USER| grep "automine-gpu-nvidia.sh" | grep -v "grep" | awk '{print $2}'`
  if [[ ! -z $pidnvidia ]]
  then
    kill $pidnvidia
    echo Stopped process "automine-gpu-nvidia.sh"
  fi

  pidamd=`/bin/ps -fu $USER| grep "automine-gpu-amd.sh" | grep -v "grep" | awk '{print $2}'`
  if [[ ! -z $pidamd ]]
  then
    kill $pidamd
    echo Stopped process "automine-gpu-amd.sh"
  fi

fi

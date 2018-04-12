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

  if pgrep -x "automine-gpu-nvidia.sh" > /dev/null
  then
    killall -9 automine-gpu-nvidia.sh
    echo Stopped process "automine-gpu-nvidia.sh"
  fi
  
  if pgrep -x "automine-gpu-amd.sh" > /dev/null
  then
    killall -9 automine-gpu-amd.sh
    echo Stopped process "automine-gpu-amd.sh"
  fi

fi

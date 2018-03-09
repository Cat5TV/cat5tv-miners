@echo off

echo.
echo cat5tv-miners for Windows - AUTO MINER for CPU
echo.
echo Close this window or press CTRL-C to stop the loop.

echo Within the windows that open, you can also press CTRL-C to close them safely.
echo Press any key within this window to abort the current countdown and switch to the next currency.

echo.
timeout /t 5 /nobreak > NUL



:loop


  set config=monero.conf
  start xmrig.exe --config=%config%
  timeout /t 3600
  taskkill /im xmrig.exe /f


  set config=turtlecoin.conf
  start xmrig.exe --config=%config%
  timeout /t 3600
  taskkill /im xmrig.exe /f


goto loop


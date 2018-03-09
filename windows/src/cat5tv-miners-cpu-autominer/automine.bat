@echo off

echo Press CTRL-C two or three times to close.

echo Press any key to switch to the next currency.

echo ""

timeout /t 5 /nobreak > NUL



:loop


  set config=monero.cfg

  start xmrig.exe %config%
  timeout /t 10

  taskkill /im xmrig.exe /f


  set config=turtlecoin.cfg

  start xmrig.exe %config%
  timeout /t 10

  taskkill /im xmrig.exe /f


goto loop


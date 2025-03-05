@echo off

set /a count=0
:loop
REM tasklist ile çalışan adb.exe işlemini kontrol et
tasklist | findstr "adb.exe" >nul
if %errorlevel%==0 (
    REM adb.exe çalışıyorsa kapat
    taskkill /f /im adb.exe
    echo adb.exe durduruldu.
) else (
    echo adb.exe çalışmıyor.
)

REM 100ms bekle
ping 127.0.0.1 -n 1 -w 500 >nul

REM Sayaç artır
set /a count+=1

REM Eğer sayaç 100'den küçükse döngüye devam et
if %count% lss 3 goto loop

echo 50 deneme tamamlandı.
pause

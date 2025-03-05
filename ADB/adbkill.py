import os
import subprocess
import time
import keyboard

def terminate_adb():
    try:
        output = subprocess.check_output('tasklist',shell=True,universal_newlines=True)
        if 'adb.exe' in output:
            os.system('taskkill /f /im adb.exe')
            print('ADB kapatıldı')
        else:
            print('ADB henüz çalışmıyor')
    except subprocess.CalledProcessError as e:
        print(f"Bir hata oluştu {e}")

if __name__ == "__main__":
    a=1
    while True:
        terminate_adb()
        time.sleep(0.1)
        a +=1
        if a==100:
            break
    
    
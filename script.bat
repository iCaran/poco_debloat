@echo off
setlocal enabledelayedexpansion
goto :main

:main
setlocal

set base=adb shell pm disable-user --user 0

cls
color 03
:: 0a 03 0e 0b 0e 08

echo DEBLOATER
echo.
echo USAGE - This script runs through a text file, provided by the user or using the basic list available at where you got this script file. The file should be in the same directory as the this script.
echo. 
echo REQUIREMENTS - This script uses ADB (Android Debugging Tools) to disable/uninstall bloatware from your Android device. Hence, this file (and the package list text file) should either be in your Android Platoform Tools directory, or the aforementioned directory should be included in your system/user path variables.
echo.
echo LIST FILE - The above mentioned text file should, as you can see in the basic list file provided along with this script, should contain all the packages to be disabled - one in each line.
echo.
echo EXAMPLE: This would be the contents of the list file.
echo com.app.my
echo is.my.app
echo disable.it.now
echo.
echo You can, and are advised to thoroughly research each pacakge installed on your device, a list of which you can generate by using the command - "adb shell pm list packages". Select the non-essential ones and put it in a list, and supply it below.
echo.
echo MODIFICATIONS - I advise against it, unless you're completely sure of what you're doing... but you can uninstall packages instead of simply disabling, to do that, edit this script file thusly -
echo On the eighth line, where it says "set base=adb shell pm disable-user --user 0", replace it with the following: 
echo set base=adb shell pm uninstall
echo.
echo Connect your Android device to your computer with a USB cable, and make sure you have USB Debugging enabled on your phone.
echo Enter the name of your list file (it should be a text file in the format described above, and present in the same directory). If you're using the default list provided, then type "list.txt" without the quotes and click enter: 
echo.

set /p file= 

echo.
echo.

adb devices -l | find "device product:" >nul
if errorlevel 1 (
    echo No connected devices
    goto :eof
)

echo ---BEGINNING OPERATION---

echo.
echo.

set failed[0]=Pacages Not Found - 
set /a index=1

set passed[0]=Packages Disabled - 
set /a idx=1

for /f %%g in (%file%) do (
	%base% %%g >nul 2>nul && (
		set passed[!idx!]=%%g
		set /A idx+=1
	) || (
		set failed[!index!]=%%g
		set /A index+=1
	)
) 

for /L %%a in (0,1,%idx%) do (
	echo !passed[%%a]!
)

echo.
echo.

for /L %%a in (0,1,%index%) do (
	echo !failed[%%a]!
)

echo.
echo.
echo ---OPERATION FINISHED---

color 07
endlocal

# Debloat
A script and a list to debloat (cheap?) POCO/MIUI (and other) phone(s). 

## Background
Phones in general these days are extremely bloated with what is essentially just spyware, even the 'feature/dumb phones' come with some Facebook/Google unnecessities installed.
I recently bought a cheap POCO device (C31) and was annoyed at the sheer level of what is essentially trash that came with it which I simply don't need. At first, I simply tried to uninstall everything willy-nilly and ended up with an annoying boot loop.
This led me to find out that OEM ROMs will simply refuse to work if you try to go absolute 'tinfoil' on them, so I extracted the list of all the packages on my device
``` adb shell pm list packages ```, and searched every single one to find the limit of what can and cannot be removed or deactivated. The result of that is the ***lists*** folder in this repo.
For advanced users who want to go beyond the 'safe method' (see below), I advise them to read through the lists or make one of their own, put it in a txt file and run the ***script.bat***.
If you choose to do so, see ***sources.txt*** in the lists folder for some useful resources for finding out info on most packages easily.

## Precaution
Included in the lists provided are packages which are of day-to-day use, but they are OEM-spyware replacements of the native AOSP apps, so it's good to remove them for a better alternative. 
Get F-droid and install at least a Dialer, a Contacts app, a Camera, and an Internet Browser before running this tool, as you'll be left with none after disabling the default ones.

## Usage
The 'safe method', as I call it, would be to use the lists provided in this repo - 'mi.txt', if your phone runs MIUI, and 'android.txt' if it's any other ROM or even stock. There's also detailed info in the script itself, so read it thoroughly upon running.
1. Enable Developer Settings on your Android Device
2. Enable USB Debugging
3. Install ADB Tools on your computer, and preferably add it to system PATH variables
4. Connect your Android Device to your pc
5. Download the script.bat file and the list file of your choosing - mi.txt/android.txt, and place them in the same directory
6. Open a terminal and run the script.bat file, and when prompted, provide the name of the list file you downloaded.
The script will give a detailed output of the packages disabled and not disabled, or of any error, if one arises.
---
The 'advanced method' would be to make your own list. Each phone will have a different set of packages, and OEM ROMs are never consistent over time and hardware. The only way to be sure about the things on your device is to list them all and try to dig up some info on them. It's a manual process that will take time, and effort as well as trial and error. But it's really the only way to be 100% certain.

And of course, try to avoid using OEM ROMs if you can.
--

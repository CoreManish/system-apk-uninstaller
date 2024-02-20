# system-apk-uninstaller
Uninstall any system app

# Running `run.sh` Script - Step-by-Step Guide

This guide provides step-by-step instructions on how to run the `run.sh` script.
## chapter 1 : Mobile phone
* Enable developer options ( eg In MIUI, click 7 times on MIUI version)
* Enable USB debugging
* Connect phone to Linux computer via USB
* Select use USB for - File transfer

## Chapter 2 : Linux computer
* download platform tools https://developer.android.com/tools/releases/platform-tools
* Unzip or extract
* download this run.sh file and put inside unzip folder
* make `run.sh` executable
  * open terminal and type `chmod u+x run.sh`
* Now in the same terminal run `run.sh`. type `./run.sh`
* This will list all installed packages
   ![image](https://github.com/CoreManish/system-apk-uninstaller/assets/72579593/927caab9-cdd7-4f14-b53f-b2f9867a3815)
* Enter serial number of package you want to uninstall (Disclaimer : pick and uninstall wisely at your own risk)
* success
  ![image](https://github.com/CoreManish/system-apk-uninstaller/assets/72579593/2765dbe3-bae8-4a4a-8136-c0d67549ab2c)


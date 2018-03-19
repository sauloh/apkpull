#!/bin/bash


display_usage(){
    echo "Usage: ./apkpull <apk_name> <destination>"
}

if [ $# -le 1 ]
then
    display_usage
    exit
fi

# Get args
app_name=$1
destination=$2

# Find the package name 
package_name=$(adb shell pm list packages | grep $app_name | cut -d ':' -f2)

# Finds the path of the package
apk_path=$(adb shell pm path $package_name | cut -d ':' -f2)

# Pulls the apk from the android device
adb pull $apk_path $destination/$app_name.apk

#!/bin/bash

# Dependent on `brew install switchaudio-osx`. My Corsair Headset often cuts out
# on MacBook Pro, until I switch back and forth with another device. So this
# automates that:
# Providing full path to `SwitchAudioSource` so the script can be trigger by
# AppleScript (this lets be create an icon in the dock for running it).
# This script is run by an AppleScript "app", if the file name changes, the
# the AppleScript app needs to be updated.

PATH="/usr/local/Cellar/switchaudio-osx/1.1.0/SwitchAudioSource"

echo "Current speaker is set to '$($PATH -t output -c)' and the microphone is set to '$($PATH -t input -c)'"
echo "Cycling..."
echo "---"
$PATH -t output -s "ALOGIC DX3 Audio"
$PATH -t output -s "Corsair VOID Wireless Gaming Dongle"
echo "---"
$PATH -t input -s "Corsair VOID Wireless Gaming Dongle"
echo "---"
echo "Current speaker is now set to '$($PATH -t output -c)' and the microphone is set to '$($PATH -t input -c)'"

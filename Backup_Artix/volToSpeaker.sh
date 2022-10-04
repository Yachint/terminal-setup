#!/bin/sh

speaker_id=$(pacmd list-sinks | awk '/index/ || /name:/' | awk '/index/{u=$0}/pci/{print u}' | grep -oP ":\s+\K\w+") 

# list all apps in playback tab (ex: cmus, mplayer, vlc)
inputs=($(pacmd list-sink-inputs | awk '/index/ {print $2}'))

# set the default output device
pacmd set-default-sink $speaker_id &> /dev/null
	
# apply the changes to all running apps to use the new output device
for i in ${inputs[*]}; do pacmd move-sink-input $i $speaker_id &> /dev/null; done

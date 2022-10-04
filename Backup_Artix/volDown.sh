#!/bin/sh

input=$(pacmd list-sinks | awk '$1 == "*" { print $3 }') 
pactl set-sink-volume $input -10%


#!/bin/bash

update_volume(){
	vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
}

while true;
do
	xsetroot -name "$vol"
done

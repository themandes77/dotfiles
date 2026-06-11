#!/bin/bash
swayidle -w \
    timeout 300 'swaylock -f' \
    timeout 600 'niri msg output * dpms off' \
    resume 'niri msg output * dpms on' \
    before-sleep 'swaylock -f'

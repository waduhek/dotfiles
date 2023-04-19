#!/bin/sh

# Script taken and modified from https://code.krister.ee/lock-screen-in-sway/

# Times the suspend and puts it to background
swayidle timeout 3 'systemctl suspend' &
# Locks the screen immediately
swaylock
# Kills last background task so idle timer doesn't keep running
kill %%

#!/bin/bash

current_layout=$(setxkbmap -print | grep xkb_symbols | awk '{print $4}')

if [ "$current_layout" == "\"pc+us+inet(evdev)\"" ]
then
    setxkbmap dvorak
else
    setxkbmap us
fi;

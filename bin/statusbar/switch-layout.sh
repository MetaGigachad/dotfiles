#!/usr/bin/env zsh

mkdir .cache/status

if [ `setxkbmap -print | grep xkb_symbols | awk '{print $4}' | awk -F"+" '{print $2}'` = us ] ;then 
  echo "RU" > ~/.cache/status/layout.txt; 
  setxkbmap ru ; 
else 
  echo "US" > ~/.cache/status/layout.txt; 
  setxkbmap us ; 
fi

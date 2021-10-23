#!/usr/bin/env bash

CURRENT=$(bspc query -M -m 'focused')

while read m; do
    bspc desktop -f "$m:^$1"
done <<< $(bspc query -M)        

bspc monitor -f $CURRENT

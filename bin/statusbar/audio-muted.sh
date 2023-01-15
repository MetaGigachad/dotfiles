#!/bin/bash

sinks_data="$(pacmd list-sinks | awk '/name:|muted:/ {print $2}')"
sinks_count=$(( $(echo \"$sinks_data\" | wc -l) / 2 ))

icon_set="00"
icons=""
while IFS="\n" read -r line; do
    if [ "${line::1}" = "<" ]; then
        [ "$line" = "<alsa_output.pci-0000_03_00.6.analog-stereo>" ] && icon_set="ﱝ墳"
        [ "$line" = "<bluez_sink.98_DD_60_E6_ED_52.a2dp_sink>" ] && icon_set="ﳌ"
    else
        [ "$line" = "no" ] && icons="${icons}${icon_set:1:2}" || icons="$icons${icon_set::1}"
    fi
done <<< "$sinks_data"

echo "$(echo $icons | sed 's/./& /g')"

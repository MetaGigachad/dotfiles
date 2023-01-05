#!/bin/bash

PERCENTAGE=$(pamixer --get-volume)
IS_MUTED=$(pacmd list-sinks | awk '/muted/ { print $2 }')

if [[ "$IS_MUTED" == "yes" ]]; then
  # ﱝ
  STATUS_ICON="[M]"
else
  # 
  STATUS_ICON=" M "
fi

echo "$STATUS_ICON $PERCENTAGE%"

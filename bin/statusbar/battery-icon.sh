#!/bin/bash

STATUS=$(acpi -b | cut -d',' -f1 | cut -d':' -f2 | xargs)

if [[ "$STATUS" == "Charging" || "$STATUS" == "Full" ]]; then
  STATUS_ICON=""
fi
if [[ "$STATUS" == "Not charging" ]]; then
  STATUS_ICON=""
fi
if [[ "$STATUS" == "Discharging" ]]; then
  STATUS_ICON=""
fi

echo "$STATUS_ICON"

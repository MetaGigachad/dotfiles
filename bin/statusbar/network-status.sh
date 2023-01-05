#!/bin/bash

INTERFACE="wlp1s0"

awk '{
  if (rx) {
    printf (" %.0f KiB/s   %.0f KiB/s", ($2-rx)/1024, ($10-tx)/1024)
  } else {
    rx=$2; tx=$10;
  }
}' \
    <(grep $INTERFACE /proc/net/dev) \
    <(sleep 1; grep $INTERFACE /proc/net/dev)

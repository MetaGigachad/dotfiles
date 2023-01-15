#!/bin/bash

echo "$(acpi -b | cut -d',' -f2 | xargs)"

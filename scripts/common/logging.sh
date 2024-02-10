#!/usr/bin/env bash

fg_w='\u001b[37m'
fg_y='\u001b[33m'
fg_c='\u001b[36m'
fg_g='\u001b[32m'

info() {
    echo -e "${fg_c}Info:${fg_w} $1"
}

warn() {
    echo -e "${fg_y}Warning:${fg_w} $1"
}

print_success() {
    echo -e "${fg_g}$1${fg_w}"
}


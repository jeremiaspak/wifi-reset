#!/bin/bash
# Bring all wifi interfaces down.
# Identify wifi interfaces as rows from standard output of iwconfig (NOT standard
# error, those are non-wifi interfaces) which start without whitespace.
# https://raspberrypi.stackexchange.com/a/73524
sleep 30
iwconfig 2> /dev/null | grep -o '^[[:alnum:]]\+' | while read x; do ip link set $x down; done
# Bring all wifi interfaces up.
sleep 30
iwconfig 2> /dev/null | grep -o '^[[:alnum:]]\+' | while read x; do ip link set $x up; done

#!/bin/bash
# ip link: https://raspberrypi.stackexchange.com/a/73524

# Identify wifi interfaces as rows from standard output of iwconfig (NOT standard
# error, those are non-wifi interfaces) which start without whitespace.
sleep 30
echo "Bring all wifi interfaces down."
iwconfig 2> /dev/null | grep -o '^[[:alnum:]]\+' | while read x; do ip link set $x down; done

sleep 30
echo "Bring all wifi interfaces up."
iwconfig 2> /dev/null | grep -o '^[[:alnum:]]\+' | while read x; do ip link set $x up; done
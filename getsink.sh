#!/bin/sh

pactl list sinks short | grep "RUNNING" | cut -f 2 | awk -F'[.]' '{print $3;}'

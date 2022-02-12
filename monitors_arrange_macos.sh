#!/bin/bash
# *****************************************************************************
# Fix MacOS monitor placement.
# *****************************************************************************

# Set screens to correct arrangement:
/usr/local/Cellar/displayplacer/1.2.0/bin/displayplacer "id:4F41AB1B-2107-66E6-B5DB-77EECAF93639 res:1920x1080 hz:60 color_depth:8 scaling:off origin:(0,0) degree:0" "id:000010AC-0000-A0A2-3036-474C00000000 res:1920x1080 hz:60 color_depth:4 scaling:off origin:(-1920,0) degree:0" "id:000010AC-0000-A0A2-3036-464C00000000 res:1920x1080 hz:60 color_depth:4 scaling:off origin:(1920,0) degree:0"


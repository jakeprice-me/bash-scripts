#!/bin/bash
# *****************************************************************************
# Arrange monitors when laptop lid is closed
# *****************************************************************************

# Screen names:
LAPTOP="eDP-1"
LEFT="DP-2-8"
MIDDLE="DP-2-1-8"
RIGHT="DP-2-1-1-8"

# Set primary:
xrandr --output $MIDDLE --primary

# TODO only run _if_ other monitors detected, otherwise laptop screen goes off when your only using the laptop!
# Set screen arrangement:
xrandr --output $LAPTOP --off
xrandr --output $LEFT --left-of $MIDDLE
xrandr --output $MIDDLE --right-of $LEFT
xrandr --output $RIGHT --right-of $MIDDLE


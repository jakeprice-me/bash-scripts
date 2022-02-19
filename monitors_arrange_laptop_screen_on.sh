#!/bin/bash
# *****************************************************************************
# Arrange monitors with laptop screen on.
# *****************************************************************************

# Screen names:
LAPTOP="eDP-1"
LEFT="DP-2-8"
MIDDLE="DP-2-1-8"
RIGHT="DP-2-1-1-8"

# Set primary:
xrandr --output $MIDDLE --primary

# Set screen arrangement:
xrandr --output $LAPTOP --auto --below $LEFT
xrandr --output $MIDDLE --right-of $LEFT
xrandr --output $RIGHT --right-of $MIDDLE


#!/bin/bash
# *****************************************************************************
# Arrange monitors when laptop lid is open
# *****************************************************************************

echo "Enter the number of the port the monitors are connected to:"
read PORT

# Screen names:
LAPTOP="eDP-1"
LEFT="DP-$PORT-8"
MIDDLE="DP-$PORT-1-8"
RIGHT="DP-$PORT-1-1-8"

# Set primary:
xrandr --output $MIDDLE --primary

# Set screen arrangement:
xrandr --output $LAPTOP --auto --below $LEFT
xrandr --output $MIDDLE --right-of $LEFT
xrandr --output $RIGHT --right-of $MIDDLE


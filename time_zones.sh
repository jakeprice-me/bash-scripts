#!/bin/bash
# Print the current time in each of the specified cities.

# Text formatting.
bold="\e[1m"
red="\e[91m"
blue="\e[94m"
green="\e[92m"

# Print Script output title.
echo ""
echo -e "${bold}Current Time in Major Cities:\e[0m"
echo ""
echo "================================================================================="
echo ""

# Associate timezones with shortcode.
PST="America/Los_Angeles"
EST="America/New_York"
GMT="Europe/London"
CET="Europe/Warsaw"
ICT="Asia/Bangkok"
HKT="Asia/Hong_Kong"
JST="Asia/Tokyo"
AEDT="Australia/Sydney"

# Get the current time in the specified timezone, and store in a variable.
PST_time=$(TZ=$PST date +\%H\:\%M\:\%S\ \(\%:z\))
EST_time=$(TZ=$EST date +\%H\:\%M\:\%S\ \(\%:z\))
GMT_time=$(TZ=$GMT date +\%H\:\%M\:\%S\ \(\%:z\))
CET_time=$(TZ=$CET date +\%H\:\%M\:\%S\ \(\%:z\))
ICT_time=$(TZ=$ICT date +\%H\:\%M\:\%S\ \(\%:z\))
HKT_time=$(TZ=$HKT date +\%H\:\%M\:\%S\ \(\%:z\))
JST_time=$(TZ=$JST date +\%H\:\%M\:\%S\ \(\%:z\))
AEDT_time=$(TZ=$AEDT date +\%H\:\%M\:\%S\ \(\%:z\))

# Print time and additional information for each timezone.
echo -e "$red$PST_time\e[0m - Los Angeles  PST (Pacific Standard Time)"
echo -e "$red$EST_time\e[0m - New York     EST (Eastern Standard Time)"
echo -e "$blue$GMT_time\e[0m - London       GMT (Greenwich Mean Time)"
echo -e "$green$CET_time\e[0m - Warsaw       CET (Central European Time)"
echo -e "$green$ICT_time\e[0m - Bangkok      ICT (Indochina Time)"
echo -e "$green$HKT_time\e[0m - Hong Kong    HKT (Hong Kong Time)"
echo -e "$green$JST_time\e[0m - Tokyo        JST (Japan Standard Time)"
echo -e "$green$AEDT_time\e[0m - Melbourne    AEDT (Australian Eastern Daylight Savings Time)"

# Spacing before next bash prompt.
echo ""
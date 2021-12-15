#!/bin/bash

qrencode \
    --type=PNG \
    --size=6 \
    --foreground="1a237e" \
    --background="FFFFFF" \
    --output qrcode.png \
    "Message should go here, single line or multiline (with 3 double quotes)"


#!/bin/bash
# *****************************************************************************
# Display Home Cameras in Mosaic
# *****************************************************************************

# ==== Mosaic Order Guide =====================================================
# Cameras are displayed on the screen in the following order:
# 1st Row Left
# 2nd Row Left
# 3rd Row Left
# 1st Row Middle
# 2nd Row Middle
# 3rd Row Middle
# 1st Row Right
# 2nd Row Right
# 3rd Row Right

# ==== Variables ==============================================================

# Source $USERNAME, $PASSWORD & $SUBNET:
source "$HOME"/.cctv

# ==== Functionality ==========================================================

# Create mosaic:
ffmpeg \
    -i rtsp://"$USERNAME":"$PASSWORD"@"$SUBNET".215/stream2 \
    -i rtsp://"$USERNAME":"$PASSWORD"@"$SUBNET".212/stream2 \
    -i rtsp://"$USERNAME":"$PASSWORD"@"$SUBNET".216/stream2 \
    -i rtsp://"$USERNAME":"$PASSWORD"@"$SUBNET".210/stream2 \
    -i rtsp://"$USERNAME":"$PASSWORD"@"$SUBNET".214/stream2 \
    -i rtsp://"$USERNAME":"$PASSWORD"@"$SUBNET".217/stream2 \
    -i rtsp://"$USERNAME":"$PASSWORD"@"$SUBNET".211/stream2 \
    -i rtsp://"$USERNAME":"$PASSWORD"@"$SUBNET".213/stream2 \
    -i rtsp://"$USERNAME":"$PASSWORD"@"$SUBNET".218/stream2 \
    -filter_complex "
        [0:v][1:v][2:v][3:v][4:v][5:v][6:v][7:v][8:v]xstack=inputs=9:layout=0_0|0_h0|0_h0+h1|w0_0|w0_h0|w0_h0+h1|w0+w3_0|w0+w3_h0|w0+w3_h0+h1:fill=black[v]
	" \
    -map "[v]" \
	-c:v libx264 -preset superfast -crf 18 -f matroska - | ffplay -


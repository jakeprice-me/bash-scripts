#!/bin/bash
# *****************************************************************************
# Rename Photos to Exif DateTimeOriginal
# -----------------------------------------------------------------------------
# DESCRIPTION:
# This script uses ImageMagick's `identify` command to get the
# `exif:DateTimeOriginal` value of a photo, and rename the photo file to match
# the date. You'll need to install ImageMagick, and you can then run the script
# in a directory of photos you want to rename.
# -----------------------------------------------------------------------------
# PREREQUISITES:
# - ImageMagick
# -----------------------------------------------------------------------------
# USAGE:
# Set `FILE_TYPE` variable to photo file ending you want the script to run
# against.
# cd <path-to-photos> && bash <path-to-script> 
# *****************************************************************************

# Set file type to operate on:
FILE_TYPE=jpg

# Loop through all photos in file:
for photo in *."$FILE_TYPE"; do

    # Get current file in loop:
    CURRENT_FILENAME=$(basename "$photo" .$FILE_TYPE)

    # Rename if DateTimeOriginal found:
    if identify -verbose "$photo" | grep "exif:DateTimeOriginal"; then
        OLD_FILENAME=$(basename "$photo" .$FILE_TYPE)
        NEW_FILENAME=$(identify -verbose "$file" | grep "exif:DateTimeOriginal" \
            | sed "s/    //; s/exif:DateTimeOriginal: //g; s/ /_/g; s/://g;")

        mv "$OLD_FILENAME.$FILE_TYPE" "$NEW_FILENAME.$FILE_TYPE"
        echo -e "$OLD_FILENAME.$FILE_TYPE > $NEW_FILENAME.$FILE_TYPE" 

    else

        # Warn but continue:
        echo -e "\e[31m$CURRENT_FILENAME.$FILE_TYPE has no 'exif:DateTimeOriginal' data\e[0m"

    fi
 
done

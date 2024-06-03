#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 -i INPUT_FOLDER -o OUTPUT_FOLDER -p PATTERN"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 6 ]; then
    usage
fi

# Parse the command line arguments
while getopts ":i:o:p:" opt; do
    case $opt in
        i) INPUT_FOLDER="$OPTARG"
        ;;
        o) OUTPUT_FOLDER="$OPTARG"
        ;;
        p) PATTERN="$OPTARG"
        ;;
        *) usage
        ;;
    esac
done

# Check if input folder exists
if [ ! -d "$INPUT_FOLDER" ]; then
    echo "Input folder does not exist!"
    exit 1
fi

# Check if output folder exists, if not create it
if [ ! -d "$OUTPUT_FOLDER" ]; then
    mkdir -p "$OUTPUT_FOLDER"
fi

# Flag to check if any files were found
files_found=false

# Copy files matching the pattern from input folder to output folder
for file in "$INPUT_FOLDER"/$PATTERN; do
    if [ -e "$file" ]; then
        echo "Found file: $file"
        cp "$file" "$OUTPUT_FOLDER"
        files_found=true
    fi
done

if [ "$files_found" = true ]; then
    echo "Files matching pattern '$PATTERN' have been copied from '$INPUT_FOLDER' to '$OUTPUT_FOLDER'."
else
    echo "No files matching pattern '$PATTERN' found in '$INPUT_FOLDER'."
fi

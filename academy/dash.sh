#!/bin/bash

# --- Default Variables ---
INPUT_FILE="data.json"
OUTPUT_FILE="dash.json"
NEW_VALUE=""

# --- Function to show usage ---
usage() {
    echo "Usage: $0 -v [replacement_value]"
    echo "Example: $0 -v 'my_custom_string'"
    exit 1
}

# --- Flag Parsing ---
# 'v:' means the 'v' flag requires an argument
while getopts "v:" opt; do
  case $opt in
    v) NEW_VALUE="$OPTARG" ;;
    *) usage ;;
  esac
done

# --- Validation ---
# Ensure the user actually provided a value
if [[ -z "$NEW_VALUE" ]]; then
    echo "Error: You must provide a replacement value using the -v flag."
    usage
fi

# Ensure the input file exists
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: File '$INPUT_FILE' not found."
    exit 1
fi

# --- Logic ---
# Perform the replacement using sed
sed "s/GKO1/$NEW_VALUE/g" "$INPUT_FILE" > "$OUTPUT_FILE"

echo "Success! Replaced 'GKO1' with '$NEW_VALUE' in $OUTPUT_FILE."
#!/bin/bash
set -euo pipefail

INPUT_FILE=""
OUTPUT_FILE=""
NEW_VALUE=""

usage() {
  echo "Usage: $0 -v <replacement_value> [-i input.json] [-o output.json]"
  echo "Examples:"
  echo "  curl -s <data.json_url> | bash <(curl -s <dash.sh_url>) -v 'raph' > dash.json"
  echo "  ./dash.sh -v 'raph' -i data.json -o dash.json"
  exit 1
}

while getopts "v:i:o:" opt; do
  case "$opt" in
    v) NEW_VALUE="$OPTARG" ;;
    i) INPUT_FILE="$OPTARG" ;;
    o) OUTPUT_FILE="$OPTARG" ;;
    *) usage ;;
  esac
done

if [[ -z "${NEW_VALUE}" ]]; then
  echo "Error: You must provide a replacement value using -v."
  usage
fi

# Read input from file if provided, else stdin
if [[ -n "${INPUT_FILE}" ]]; then
  [[ -f "${INPUT_FILE}" ]] || { echo "Error: File '${INPUT_FILE}' not found."; exit 1; }
  IN_CMD=(cat "${INPUT_FILE}")
else
  IN_CMD=(cat)
fi

# Write output to file if provided, else stdout
if [[ -n "${OUTPUT_FILE}" ]]; then
  "${IN_CMD[@]}" | sed "s/GKO1/${NEW_VALUE}/g" > "${OUTPUT_FILE}"
else
  "${IN_CMD[@]}" | sed "s/GKO1/${NEW_VALUE}/g"
fi

#!/usr/bin/env bash
set -euo pipefail

# Configuration
OWNER="eeeeelizzzzz"
REPO="SCALES-UAS-Data-Community"
PLATFORMS_DIR="./platforms"

# 1. Get the list of platforms (ignoring templates)
PLATFORM_IDS=()
shopt -s nullglob
for d in "$PLATFORMS_DIR"/*/; do
  base="$(basename "$d")"
  [[ "$base" == "_template_platform_" ]] && continue
  PLATFORM_IDS+=("$base")
done
shopt -u nullglob

echo "Creating labels for ${#PLATFORM_IDS[@]} platforms..."

# 2. Create the labels
for ID in "${PLATFORM_IDS[@]}"; do
  LABEL_NAME="platform:${ID}"
  
  # Check if label exists first to avoid errors
  if gh label list --repo "$OWNER/$REPO" --search "$LABEL_NAME" | grep -q "$LABEL_NAME"; then
    echo "Skipping: $LABEL_NAME already exists."
  else
    echo "Creating: $LABEL_NAME"
    # Using a professional "SCALES Blue" (0052cc)
    gh label create "$LABEL_NAME" \
      --repo "$OWNER/$REPO" \
      --color "0052cc" \
      --description "All issues and discussions for platform ${ID}"
  fi
done

echo "Label generation complete."
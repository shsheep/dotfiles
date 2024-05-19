#!/bin/bash
ALACRITTY_CONFIG=/Users/shsheep/Workspace/dotfiles/alacritty.yml

declare -i BEFORE_SIZE
declare -i AFTER_SIZE
UPDATED=""
BEFORE_SIZE=$(grep -E "size: \d+" $ALACRITTY_CONFIG | awk '{print $2}')
if [[ $1 = "-i" ]]; then
    AFTER_SIZE=$((BEFORE_SIZE + 1))
    UPDATED="increased"
else
    AFTER_SIZE=$((BEFORE_SIZE - 1))
    UPDATED="decreased"
fi

sed -i '' -e  "s/  size: $BEFORE_SIZE/  size: $AFTER_SIZE/g" $ALACRITTY_CONFIG
echo "Alacritty font size $UPDATED from $BEFORE_SIZE to $AFTER_SIZE"

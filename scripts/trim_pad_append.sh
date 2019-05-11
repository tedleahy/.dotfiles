#!/bin/sh

[[ -z $2 ]] && echo "Usage: $0 <path_to_first_img> <path_to_second_img>" && exit 1

# Trim and pad all images (./trim_and_pad.sh)
for img in "${@:1}"; do
  ~/config_files/Scripts/trim_and_pad.sh $img
done

# Append all images in order
convert -gravity center +append "$@" appended.png

# Remove all original images
rm "$@"

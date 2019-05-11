#!/bin/sh

[[ -z $1 ]] && echo "Usage: $0 <path_to_image>" && exit 1

#convert -trim $1 $1
convert $1 -bordercolor "#FFFFFF" -border 20x20 $1

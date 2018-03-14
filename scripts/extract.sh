#!/bin/bash
if [ "$1" == '' ] || [ "$2" == '' ] || [ "$3" == '' ]; then
    echo "Usage: $0 <input folder> <output folder> <file extension>";
    exit;
fi

counter=10
for file in "$1"/*."$3"; do
    destination="$2";
    echo $counter
    mkdir -p "$destination";
    ffmpeg -i "$file" -vf "select=not(mod(n\,10))" -vsync vfr -q:v 2 "$destination/figure-$counter-%d.jpg";
    counter=$(expr $counter + 1)
done

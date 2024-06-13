#!/bin/bash

url="https://en.wikipedia.org/wiki/Heart_Nebula" #will change with bag of multiple url
out_file="heart_nebula.html" #for demonst.
wget -q -O "out_file" "$url"

title=$(grep -o '<title>[^<]*' "$out_file" | sed 's/<title>//')

keywords=("Heart Nebula" "IC 1805" "science" "logic" "aritificial intelligence" "cognitive" "astronomy")

matched=false

for keywords in "${keywords[@]}"; do
  if [[ "$title" == *"$keywords"* ]]; then
    matched=true
    break

  fi
done

if [ "$matched" = true ]; then
  echo "title matched: $title"
  #python3 process_pp.py "$out_file"
else
  echo "title is not matched!"
fi

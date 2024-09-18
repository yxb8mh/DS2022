#!/bin/bash

# change directories
cd ../../people

target_file="README.md"

for dir in $(find . -type d); do
  if [ -f "$dir/$target_file" ]; then
    echo $dir
    name=`head -n1 $dir/$target_file`
    echo $name
    echo "-----"
  fi
done

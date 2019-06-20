#!/bin/bash

filename=$1

# Remove the first 10 lines of non csv data
sed -i '' '1,10d' $filename

# Remove Total Fertility Rate (3rd column)
cat $filename | awk -F, '{print $1 "," $2}' > temp && mv $filename

# Remove the decimal point (convert to thousands)
sed -i '' 's/\.//g' $filename

# Add a heading
sed -i '' '1s/^/"year","live_births"\n/' $filename

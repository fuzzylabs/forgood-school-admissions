#!/bin/bash

filename=$1

#Some of the integer fields contain a 'x' rather than a blank.
sed -i '' 's/,x/,/g' $filename

#!/bin/bash

FILENAME=$(basename $1 .tar.bz2)

sed "s|%%IMGBUILDURL%%|$1|" Dockerfile.in > Dockerfile
sed -i '' "s|%%IMGBUILDFN%%|$FILENAME|" Dockerfile

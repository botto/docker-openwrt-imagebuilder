#!/bin/bash

sed "s|%%IMGBUILDFILE%%|$1|" Dockerfile.in > Dockerfile

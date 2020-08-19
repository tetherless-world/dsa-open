#!/bin/bash

# local output dir
mkdir /output

# container dirs
docker exec hygiene mkdir /input
docker exec hygiene mkdir /output

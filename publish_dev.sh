#!/bin/bash

./build.sh

balena login --token $LOCAL_BALENA_TOKEN

# RPI4
cd ./architectures/rpi4
balena push chris88/mobiusflow-connector-rpi4
cd ../../

# RPI5
cd ./architectures/rpi5
balena push chris88/mobiusflow-connector-rpi5
cd ../../
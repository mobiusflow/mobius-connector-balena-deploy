#!/bin/bash

./build.sh

balena login --token $LOCAL_BALENA_TOKEN

# Our RPI4s
cd ./architectures/rpi4
balena push chris88/mobiusflow_connectors_rpi4
cd ../../

# Our RPI5s
cd ./architectures/rpi5
balena push chris88/mobiusflow_connectors_rpi5
cd ../../

# RPI4
cd ./architectures/rpi4
balena push chris88/mobiusflow-connector-rpi4
cd ../../

# RPI5
cd ./architectures/rpi5
balena push chris88/mobiusflow-connector-rpi5
cd ../../
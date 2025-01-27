#!/bin/bash

./build.sh

# Get versions
buildver=$(grep version versions.json | sed -n 's/^.*"\([0-9][^"]*\)".*$/\1/p')
connectorver=$(grep connector versions.json | sed -n 's/^.*"\([0-9][^"]*\)".*$/\1/p')

balena login --token $LOCAL_BALENA_TOKEN

# RPI4
rm mf_connectors_rpi4_preload_*
cp ./preload/rpi4.img ./preload/mf_connectors_rpi4_preload_${buildver}_${connectorver}.img
balena preload ./preload/mf_connectors_rpi4_preload_${buildver}_${connectorver}.img --fleet chris88/mobiusflow-connector-rpi4
echo 'Outfile: ./preload/mf_connectors_rpi4_preload_'${buildver}'_'${connectorver}'.img'

# RPI5
# rm mf_connectors_rpi5_preload_*
# cp ./preload/rpi5.img ./preload/mf_connectors_rpi5_preload_${buildver}_${connectorver}.img
# balena preload  ./preload/mf_connectors_rpi5_preload_${buildver}_${connectorver}.img --fleet chris88/mobiusflow-connector-rpi5
# echo 'Outfile: ./preload/mf_connectors_rpi5_preload_'${buildver}'_'${connectorver}'.img'

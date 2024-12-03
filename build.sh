#!/bin/bash

buildver=$(grep version versions.json | sed -n 's/^.*"\([0-9][^"]*\)".*$/\1/p')
connectorver=$(grep connector versions.json | sed -n 's/^.*"\([0-9][^"]*\)".*$/\1/p')

echo "Build Version: "${buildver}
echo "Connector Version: "${connectorver}

# Set versions in balena.yml files
sed -i -e 's/version: .*/version: \"'$buildver'\"/g' ./architectures/rpi4/balena.yml
sed -i -e 's/version: .*/version: \"'$buildver'\"/g' ./architectures/rpi5/balena.yml

rm -f ./architectures/rpi4/balena.yml-e
rm -f ./architectures/rpi5/balena.yml-e

# Set versions in docker-compose.yml files
sed -i -e 's/balena_rpi4_connector.*/balena_rpi4_connector:'$buildver\\_$connectorver'/g' ./architectures/rpi4/docker-compose.yml
sed -i -e 's/balena_rpi5_connector.*/balena_rpi5_connector:'$buildver\\_$connectorver'/g' ./architectures/rpi5/docker-compose.yml

rm -f ./architectures/rpi4/docker-compose.yml-e
rm -f ./architectures/rpi5/docker-compose.yml-e
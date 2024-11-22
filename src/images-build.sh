#!/bin/bash

# Loop through all directories except 'cartservice'
for service in */; do
    # Skip 'cartservice'
    if [[ "$service" == "cartservice/" ]]; then
        continue
    fi
    echo "Building image for $service"
    cd "$service"
    docker build -t default-route-openshift-image-registry.apps.sandbox-m2.ll9k.p1.openshiftapps.com/lili2024-dev/${service%/}:latest .
    cd ..
done

#!/bin/bash

# Directory and file for the manifests
MANIFEST_FILE="release/kubernetes-manifests.yaml"

# OpenShift registry base URL
REGISTRY_URL="default-route-openshift-image-registry.apps.sandbox-m2.ll9k.p1.openshiftapps.com/lili2024-dev"

# Services and their corresponding image tags
declare -A SERVICES_IMAGES
SERVICES_IMAGES=(
    ["adservice"]="adservice:latest"
    ["cartservice"]="cartservice:latest"
    ["checkoutservice"]="checkoutservice:latest"
    ["currencyservice"]="currencyservice:latest"
    ["emailservice"]="emailservice:latest"
    ["frontend"]="frontend:latest"
    ["loadgenerator"]="loadgenerator:latest"
    ["paymentservice"]="paymentservice:latest"
    ["productcatalogservice"]="productcatalogservice:latest"
    ["recommendationservice"]="recommendationservice:latest"
    ["shippingservice"]="shippingservice:latest"
)

# Update the image for each service
for SERVICE in "${!SERVICES_IMAGES[@]}"; do
    NEW_IMAGE="$REGISTRY_URL/${SERVICES_IMAGES[$SERVICE]}"
    echo "Updating $SERVICE image to $NEW_IMAGE"
    sed -i "/name: $SERVICE/,/image:/s|image:.*|image: $NEW_IMAGE|" "$MANIFEST_FILE"
done

echo "Image updates completed in $MANIFEST_FILE."


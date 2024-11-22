for service in src/*; do
    service_name=$(basename "$service")
    echo "Creating deployment for $service_name..."
    oc new-app default-route-openshift-image-registry.apps.sandbox-m2.ll9k.p1.openshiftapps.com/lili2024-dev/$service_name:latest --name=$service_name
done


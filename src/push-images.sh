for service in */; do
    docker push default-route-openshift-image-registry.apps.sandbox-m2.ll9k.p1.openshiftapps.com/lili2024-dev/${service%/}:latest
done

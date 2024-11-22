for service in src/*; do
    service_name=$(basename "$service")
    echo "Deploying $service_name..."
    oc new-app https://github.com/lily4499/microservices-demo.git --context-dir=src/$service_name --name=$service_name
done


curl -sfL https://get.k3s.io | sh -

# Step 1: Namespace
kubectl apply -f k8s/namespace.yaml

# Step 2: PVC
kubectl apply -f k8s/pvc.yaml

# Step 3: Deployment
sudo kubectl apply -f deployment.yaml

# Step 4: Service
kubectl apply -f k8s/service.yaml

# Step 5: Ingress
kubectl apply -f k8s/ingress.yaml


kubectl get all -n proliga
kubectl get pvc -n proliga
kubectl describe ingress proliga-ingress -n proliga


kubectl scale deployment proliga-frontend --replicas=5 -n proliga
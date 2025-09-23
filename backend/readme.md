helm repo add cnpg https://cloudnative-pg.github.io/charts
helm repo update
helm upgrade --install cnpg cnpg/cloudnative-pg \
  --namespace cnpg-system --create-namespace
 || kubectl apply -f https://github.com/cloudnative-pg/cloudnative-pg/releases/latest/download/cnpg.yaml



# 0. install CNPG operator (helm) — see earlier
# 1. create namespace
sudo  apply -f 00-namespace.yaml

# 2. create secrets
sudo kubectl apply -f 01-secrets.yaml

# 3. create Postgres cluster
kubectl apply -f 02-cnpg-cluster.yaml

# 4. wait for pods to be ready (can take several minutes)
sudo kubectl get pods -n proliga -l cnpg.io/cluster=proliga-postgres
# or:
sudo kubectl wait --for=condition=Ready pods -l cnpg.io/cluster=proliga-postgres -n proliga --timeout=15m

# 5. create Database & extensions
sudo kubectl apply -f 03-database.yaml

# 6. create Poolers (PgBouncer)
sudo kubectl apply -f 04-pooler-rw.yaml

# 7. create PostgREST
sudo kubectl apply -f 05-postgrest-deployment.yaml
sudo kubectl apply -f 06-postgrest-service.yaml

# 8. check services
sudo kubectl get svc -n proliga
sudo kubectl get pooler -n proliga
sudo kubectl get clusters -n proliga
 
sudo kubectl apply -f 07-pooler-nodeport.yaml



# find pooler service name:
sudo kubectl get svc -n proliga

# port-forward pooler to localhost (example)
sudo kubectl port-forward svc/proliga-pooler-rw -n proliga 5432:5432 &
psql "postgres://proliga_user:<APP_DB_PASSWORD>@localhost:5432/proliga"



sudo kubectl get pods -n proliga -l cnpg.io/cluster=proliga-postgres -o wide
# The primary typically ends with -0 or use cnpg plugin to inspect
sudo kubectl delete pod <primary-pod-name> -n proliga
sudo kubectl get pods -n proliga -l cnpg.io/cluster=proliga-postgres -w

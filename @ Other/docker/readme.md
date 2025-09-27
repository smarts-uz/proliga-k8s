kubectl apply -f \
  https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.17/releases/cnpg-1.17.5.yaml

pg list users
\du

sudo k3s kubectl exec -it -n postgres cnpg-cluster-1 -- psql 127.0.0.1 -U postgres -d postgres 

ALTER USER postgres WITH PASSWORD 'komolteam';

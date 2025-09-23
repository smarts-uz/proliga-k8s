### ### ### ###

sudo kubectl apply -f 01-namespace.yaml

sudo kubectl apply -f 02-secrets.yaml

sudo kubectl apply -f 03-configmap.yaml

sudo kubectl apply -f 04-postgres-cluster.yaml

sudo kubectl apply -f 05-postgrest.yaml

sudo kubectl apply -f 06-postgrest-service.yaml

sudo kubectl apply -f 07-postgrest-ingress

sudo kubectl apply -f 08-pooler-nodeport

kubectl port-forward svc/proliga-db-pooler-rw 6432:6432 -n proliga
kubectl apply -f https://github.com/cloudnative-pg/cloudnative-pg/releases/latest/download/cnpg-operator.yaml


ramz@ramz-server:~/proliga-db$ sudo kubectl apply --server-side -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.27/releases/cnpg-1.27.0.yaml

ramz@ramz-server:~/proliga-db$ sudo kubectl get crd | grep postgresql.cnpg.io
sudo kubectl get pods -n cnpg-system
backups.postgresql.cnpg.io                  2025-09-15T10:07:57Z
clusterimagecatalogs.postgresql.cnpg.io     2025-09-15T10:07:57Z
clusters.postgresql.cnpg.io                 2025-09-15T10:07:57Z
databases.postgresql.cnpg.io                2025-09-15T10:07:57Z
failoverquorums.postgresql.cnpg.io          2025-09-15T10:07:57Z
imagecatalogs.postgresql.cnpg.io            2025-09-15T10:07:57Z
poolers.postgresql.cnpg.io                  2025-09-15T10:07:57Z
publications.postgresql.cnpg.io             2025-09-15T10:07:57Z
scheduledbackups.postgresql.cnpg.io         2025-09-15T10:07:57Z
subscriptions.postgresql.cnpg.io            2025-09-15T10:07:57Z
NAME                                       READY   STATUS    RESTARTS   AGE
cnpg-controller-manager-5c94bc644d-pnd9h   1/1     Running   0          46s
ramz@ramz-server:~/proliga-db$ 
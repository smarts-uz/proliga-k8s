kubectl exec -it ha-db-1 -n cnpg-system -- bash

==================================================================================

psql -U postgres

==================================================================================

ALTER USER postgres WITH PASSWORD 'Gx7!dYp@92#fLm$Q';

ALTER USER app WITH SUPERUSER;

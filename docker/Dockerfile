FROM ghcr.io/cloudnative-pg/postgresql:17.5

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-17-cron \
    postgresql-17-pgaudit \
    postgresql-contrib \
    postgresql-server-dev-17 \
    build-essential \
    libcurl4-openssl-dev \
    git \
    && git clone https://github.com/pramsey/pgsql-http.git \
    && cd pgsql-http \
    && make && make install \
    && cd .. && rm -rf pgsql-http \
    && apt-get remove -y --purge build-essential git \
    && rm -rf /var/lib/apt/lists/*

USER postgres

CMD ["postgres", \
    "-c", "shared_preload_libraries=pg_cron,pgaudit,http", \
    "-c", "cron.database_name=app"]

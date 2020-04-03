#!/bin/bash

# ---------------------------------------------------------
CONF_FILE="$PGDATA"/postgresql.conf

# ---------------------------------------------------------
# Local database setup
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL

-- 1) sharing dev user (allowed to create databases; otherwise make it look like Heroku)
CREATE ROLE sharing_dev;
ALTER ROLE sharing_dev WITH LOGIN PASSWORD 'sonny_came_home!' SUPERUSER CREATEDB CREATEROLE;

-- 3) sharing dev database
CREATE DATABASE sharing_dev OWNER sharing_dev;
REVOKE ALL ON DATABASE sharing_dev FROM PUBLIC;
GRANT CONNECT ON DATABASE sharing_dev TO sharing_dev;
GRANT ALL ON DATABASE sharing_dev TO sharing_dev;
\c sharing_dev;
ALTER SCHEMA public OWNER TO sharing_dev;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

EOSQL

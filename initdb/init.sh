#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username postgres --dbname postgres <<-EOSQL
        CREATE DATABASE greenlight;
        \c greenlight;
        CREATE ROLE greenlight WITH LOGIN PASSWORD 'pa55word';
        CREATE EXTENSION IF NOT EXISTS citext;
EOSQL

psql -v ON_ERROR_STOP=1 --username postgres --dbname postgres<<-EOSQL
    ALTER DATABASE greenlight OWNER TO greenlight;
    GRANT CREATE ON DATABASE greenlight TO greenlight;
EOSQL
# neurosync
A terminal-based, spaced-repetition learning system with a cyberpunk theme. 


## Local DB 

docker network create postgres-dev-net
docker run --network postgres-dev-net --name postgres-dev -p 5430:5432 -e POSTGRES_PASSWORD=devpass -d postgres:latest

docker run -it --rm --network postgres-dev-net postgres psql -h postgres-dev -U postgres

CREATE DATABASE dev;

switch to dev! 

CREATE SCHEMA neurosync;
CREATE USER neurosync_user WITH PASSWORD 'secret_pass';
GRANT CONNECT ON DATABASE dev TO neurosync_user;

GRANT USAGE, CREATE ON SCHEMA neurosync TO neurosync_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA neurosync GRANT ALL PRIVILEGES ON TABLES TO neurosync_user;
ALTER USER neurosync_user SET search_path = neurosync, public;




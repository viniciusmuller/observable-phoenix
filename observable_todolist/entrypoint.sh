#!/bin/bash
# Docker entrypoint script.

set -e

export PGDATABASE=${PGDATABASE:-poster}
export PGPORT=${PGPORT:-5432}
export PGHOST=${PGHOST:-127.0.0.1}
export PGUSER=${PGUSER:-postgres}
export PGPASSWORD=${PGPASSWORD:-postgres}

# Wait until Postgres is ready.
while ! pg_isready -q -h $PGHOST -p $PGPORT -U $PGUSER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

# Create database if it doesn't exist.
if [[ -z `psql -Atqc "\\list $PGDATABASE"` ]]; then
  echo "Database $PGDATABASE does not exist. Creating..."
    createdb -E UTF8 $PGDATABASE -l en_US.UTF-8 -T template0
  echo "Database $PGDATABASE created."
fi

/app/bin/migrate
exec /app/bin/server

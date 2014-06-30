#!/bin/bash


psql -c "CREATE USER ${1} WITH PASSWORD '${1}';"
psql -c "ALTER USER ${1} CREATEDB" 

postfixes=("_development" "_test" "_production")

for postfix in "${postfixes[@]}"
do
	psql -c "CREATE DATABASE ${1}${postfix};"
	psql -c "GRANT ALL PRIVILEGES ON DATABASE ${1}${postfix} to ${1};"
	psql -c "ALTER DATABASE ${1}${postfix} OWNER TO ${1};"
done


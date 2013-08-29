#!/bin/bash

sudo -u postgres whoami

sudo -u postgres psql -c "CREATE USER ${1} WITH PASSWORD '${1}';"
sudo -u postgres psql -c "ALTER USER ${1} CREATEDB" 

postfixes=("_development" "_test" "_production")

for postfix in "${postfixes[@]}"
do
	sudo -u postgres psql -c "CREATE DATABASE ${1}${postfix};"
	sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE ${1}${postfix} to ${1};"
	sudo -u postgres psql -c "ALTER DATABASE ${1}${postfix} OWNER TO ${1};"
done


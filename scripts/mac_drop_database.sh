#!/bin/bash

postfixes=("_development" "_test" "_production")
for postfix in "${postfixes[@]}"
do
    psql -c "DROP DATABASE IF EXISTS ${1}${postfix};"
done

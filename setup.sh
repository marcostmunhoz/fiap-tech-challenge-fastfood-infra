#!/bin/bash

set -e

source .env

helm install fastfood \
    --set monolith.db.host=$DB_HOST \
    --set monolith.db.username=$DB_USERNAME \
    --set monolith.db.password=$DB_PASSWORD \
    --set monolith.db.database=$DB_DATABASE \
    --set monolith.jwt.secret=$JWT_SECRET \
    $CHART_PATH
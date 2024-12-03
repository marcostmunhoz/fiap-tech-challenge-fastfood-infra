#!/bin/bash

set -e

source .env

helm install fastfood \
    --set kitchen.db.host=$KITCHEN_DB_HOST \
    --set kitchen.db.username=$KITCHEN_DB_USERNAME \
    --set kitchen.db.password=$KITCHEN_DB_PASSWORD \
    --set kitchen.db.database=$KITCHEN_DB_DATABASE \
    --set kitchen.jwt.secret=$JWT_SECRET \
    --set order.db.host=$ORDER_DB_HOST \
    --set order.db.username=$ORDER_DB_USERNAME \
    --set order.db.password=$ORDER_DB_PASSWORD \
    --set order.db.database=$ORDER_DB_DATABASE \
    --set order.jwt.secret=$JWT_SECRET \
    --set payment.db.host=$PAYMENT_DB_HOST \
    --set payment.db.username=$PAYMENT_DB_USERNAME \
    --set payment.db.password=$PAYMENT_DB_PASSWORD \
    --set payment.db.database=$PAYMENT_DB_DATABASE \
    --set payment.jwt.secret=$JWT_SECRET \
    $CHART_PATH
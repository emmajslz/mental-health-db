#!/bin/sh

DB_USER="group32"
DB_PASS="P3anutButt3rAndJ3lly32"
DB_IP="35.230.1.180"
DB_NAME="mental_health_hub"

CONNECTION_STRING="postgresql+psycopg2://$DB_USER:$DB_PASS@$DB_IP:5432/$DB_NAME"

echo $CONNECTION_STRING
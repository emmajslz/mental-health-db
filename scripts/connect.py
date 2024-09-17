import os
from sqlalchemy import create_engine, text
import pandas as pd

# Connection URL format:
username = "group32"
password = "P3anutButt3rAndJ3lly32"
instance = "35.230.1.180"
database_name = "mental_health_hub"
conn_str_gcp = f"postgresql+psycopg2://{username}:{password}@{instance}/{database_name}"

#DATABASE_URL = os.getenv('conn_str_gcp')

# Create an SQLAlchemy engine
engine = create_engine(conn_str_gcp)


## Test connection
try:
    with engine.connect() as connection:
        # Wrap raw SQL query with text()
        result = connection.execute(text("SELECT version();"))
        version = result.fetchone()
        print(f"Connected to: {version[0]}")

except Exception as error:
     print(f"Error connecting to the database: {error}")
'''
# Load CSV file into a pandas DataFrame: change the file name below
csv_file_path = 'your_file_path.csv'
df = pd.read_csv(csv_file_path)

# Table name to be created in PostgreSQL: change the table name below
table_name = 'destination_table_name'

# Create a new table and insert data into PostgreSQL
try:
    # Use the DataFrame's built-in function to_sql to create the table and insert the data
    df.to_sql(table_name, engine, if_exists='replace', index=False)

    print(f"Table '{table_name}' created successfully and data inserted.")

except Exception as error:
    print(f"Error creating the table: {error}")'''
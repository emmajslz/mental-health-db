import os
from sqlalchemy import create_engine, text

# Connection URL format:
##  conn_str_gcp = "postgresql+psycopg2://your-username:your-password@your-instance-public-ip:5432/your-database-name"

DATABASE_URL = os.getenv('CONNECTION_STRING')

# Create an SQLAlchemy engine
engine = create_engine(DATABASE_URL)


## Test connection
try:
    with engine.connect() as connection:
        # Wrap raw SQL query with text()
        result = connection.execute(text("SELECT version();"))
        version = result.fetchone()
        print(f"Connected to: {version[0]}")

except Exception as error:
    print(f"Error connecting to the database: {error}")

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
    print(f"Error creating the table: {error}")
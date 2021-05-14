# Using SQL data within Python

Once the size of your datasets grows beyond a certain point you'll need to start
using a database of one sort or another. If you're using spatial data and want to
use an open-source database, `PostgreSQL` with the `PostGIS` extension is the ideal choice. This topic is explored in greater detail within the [SQL](../SQL/README.md) section of this repo.

## Libraries that connect SQL & Python

There are two primary methods for connecting your Python code to a PostgreSQL database:

- `psycopg2`
- `sqlalchemy`

## Reading Data

### With `psycopg2`

The example below uses `psycopg2` to connect to the database, run a query, and
get all rows returned within the `result` object:

```python
import psycopg2

uri = "postgresql://postgres:password@localhost:5432/name_of_db"

query = "SELECT * FROM my_table"

try:
    # Connect to database & make a cursor
    connection = psycopg2.connect(uri)
    cursor = connection.cursor()

    # Run the query & fetch all resulting rows
    cursor.execute(query)
    result = cursor.fetchall()

finally:
    # Close out the cursor & connection
    cursor.close()
    connection.close()

# ... now do something with the results ...
for row in result:
    print(row)
```

### With `sqlalchemy` and `pandas` / `geopandas`

If you want the result of your query returned as a dataframe or geodataframe, you'll
want to use `pandas` or `geopandas`, respectively. These two libraries both require
a SQL database connection that is created with `sqlalchemy`.

Here's an example showing the extraction of non-spatial SQL data with `pandas`:

```python
import pandas
import sqlalchemy

uri = "postgresql://postgres:password@localhost:5432/name_of_db"

query = "SELECT * FROM my_table"

try:
    # Connect to database with sqlalchemy
    engine = sqlalchemy.create_engine(uri)

    # Use pandas to get a dataframe from the query
    df = pandas.read_sql(query, engine)

finally:
    # Close out the connection
    engine.dispose()
```

To get the output of a spatial `PostGIS` query, the process with `geopandas` is very similar:

```python
import geopandas
import sqlalchemy

uri = "postgresql://postgres:password@localhost:5432/name_of_db"

query = "SELECT st_buffer(geom, 150) as geom FROM my_table"

try:
    # Connect to database with sqlalchemy
    engine = sqlalchemy.create_engine(uri)

    # Use geopandas to get a geodataframe from the query
    gdf = geopandas.read_postgis(query, engine)

finally:
    # Close out the connection
    engine.dispose()
```

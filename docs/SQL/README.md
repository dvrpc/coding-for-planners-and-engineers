# SQL

"`SQL`" stands for "S"tructured "Q"uery "L"anguage. Variations of SQL are used in most databases.

We're going to focus on `PostgreSQL`, which is an open-source database that comes with a spatial extension called `PostGIS` that allows you to store and analyze GIS datasets.

## Installation

On a Windows computer, the easiest way to install PostgreSQL is through the ["EDB" installers](https://www.postgresql.org/download/windows/). After installing PostgreSQL, follow the wizard to install PostGIS as well.

## IDE options

PostgreSQL comes bundled with ["PgAdmin" v4](https://www.pgadmin.org/). This gets the job done but is not without its quirks. A recommended alternative is ["DBeaver"](https://dbeaver.io/).

## Loading spatial data

GIS data can be loaded into postgres in a few ways:

- via the "PostGIS Shapefile Import/Export Manager" GUI, which can be found in the Start Menu
- via the command-line tool "`shp2pgsql`"
- via Python code (using `geopandas` & `geoalchemy2`)
- via QGIS and the "Database Manager" extension

## Loading non-spatial data

Tabular data can be loaded into postgres by:

- running SQL statements that define the table schema and then copy the file into the empty table
- using Python to read the file into memory and write to postgres with `pandas`

## Running queries

Use your IDE to craft SQL queries, run them, and check the results. You can save your work by writing the SQL code to a text file that ends in `.sql` and manually rerunning it at a later date. You can also paste the SQL code into a Python script that automates the database connection and query execution, which is helpful when your analysis requires a series of steps in SQL (and/or Python processes interspersed with the querying).

## Visualizing spatial data

Desktop GIS software allows you to connect to your postgres database:

- QGIS allows reading and writing
- ArcMap is read-only

## Conventions

Spatial data is stored in a special column with a datatype of `geometry`, defined by `PostGIS`. Within this datatype the shapes allowed are `Point`, `Polygon`, and `LineString`, along with a `Multi`- variant for each. Typically this column is given the name "`geom`", although the ESRI-specific implementation of PostgreSQL uses the name "`shape`" for this column.

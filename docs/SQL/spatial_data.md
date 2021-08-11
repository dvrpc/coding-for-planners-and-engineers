# Spatial data

## Loading spatial data

GIS data can be loaded into postgres in a few ways:

- via the "PostGIS Shapefile Import/Export Manager" GUI, which can be found in the Start Menu
- via the command-line tool `shp2pgsql`
- via Python code (using `geopandas` & `geoalchemy2`)
- via QGIS and the "Database Manager" extension

## Running queries

Use your IDE to craft SQL queries, run them, and check the results. You can save your work by writing the SQL code to a text file that ends in `.sql` and manually rerunning it at a later date. You can also paste the SQL code into a Python script that automates the database connection and query execution, which is helpful when your analysis requires a series of steps in SQL (and/or Python processes interspersed with the querying).

## Visualizing spatial data

Desktop GIS software allows you to connect to your postgres database:

- QGIS allows reading and writing
- ArcMap/Pro is read-only if you setup your db as mentioned in the [intro section](intro.md).  If an edit environment is needed using ArcMap/Pro, the GIS department is willing to help assist you with the geodatabase setup.

## Conventions

Spatial data is stored in a special column with a datatype of `geometry`, defined by `PostGIS`. Within this datatype the shapes allowed are `Point`, `Polygon`, and `LineString`, along with a `Multi`- variant for each. Typically this column is given the name "`geom`", although the ESRI-specific implementation of PostgreSQL uses the name "`shape`" for this column.

## Using DVRPC GIS data
To access and query DVRPC gis data that's maintained by the GIS team you can use the following connection parameters.  The GIS db is a PostgreSQL/PostGIS db.  Features are commonly stored as SRID 26918 (UTM Zone 18, meters) and 4326 (WGS 1984, lat/long).

```
host - gis-db
db - gis
user - dvrpc_viewer
password - viewer
```

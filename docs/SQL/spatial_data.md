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

# Accessing DVRPC GIS data
## GIS Database
To access and query DVRPC gis data that's maintained by the GIS team you can use the following connection parameters.  The GIS db is a PostgreSQL/PostGIS db.  Features are commonly stored as SRID 26918 (UTM Zone 18, meters) and 4326 (WGS 1984, lat/long).

```
host - gis-db
db - gis
port - 5432
user - dvrpc_viewer
password - viewer
```
## ArcGIS Rest Services
All DVRPC GIS services can be found on our ArcGIS server https://arcgis.dvrpc.org/portal

Browsing through the directories you'll find map services and feature services.  You can query either of these endpoints to return information from each.

### Sample query
To return all county boundaries in the DVRPC region as a geojson start with the county boundary feature service

https://arcgis.dvrpc.org/portal/rest/services/Boundaries/CountyBoundaries/FeatureServer/0

Since we only want to show DVRPC counties and the data includes county boundaries outside of the DVRPC region, we need to use the field ```dvrpc_reg``` and set it's value to 'Yes'

Add ```/query?where=dvrpc_reg='Yes'``` to the service url like so ```https://arcgis.dvrpc.org/portal/rest/services/Boundaries/CountyBoundaries/FeatureServer/0/query?where=dvrpc_reg='Yes'```

Next we need to specify which fields we want to include in the output.  Since we want all fields to show we'll add ```outfields=*```  Adding more parameters to our API request URL requires ```&``` symbol like this ```https://arcgis.dvrpc.org/portal/rest/services/Boundaries/CountyBoundaries/FeatureServer/0/query?where=dvrpc_reg='Yes'&outfields=*```

Finally we'll add our projection we want the output to be in and the format.  Here we'll use ```outsr=4326``` for WGS84 - World Geodetic System 1984 and ```f=geojson``` for our output type.

https://arcgis.dvrpc.org/portal/rest/services/Boundaries/CountyBoundaries/FeatureServer/0/query?where=dvrpc_reg='Yes'&outfields=*&outsr=4326&f=geojson

### ESRI documentation
For more details about the capabilities and spec of using ESRI rest api check out https://developers.arcgis.com/rest/services-reference/enterprise/get-started-with-the-services-directory.htm

# SQL

"`SQL`" stands for "S"tructured "Q"uery "L"anguage. Variations of SQL are used in most databases.

We're going to focus on `PostgreSQL`, which is an open-source database that comes with a spatial extension called `PostGIS` that allows you to store and analyze GIS datasets.

## Installation

On a Windows computer, the easiest way to install PostgreSQL is through the ["EDB" installers](https://www.postgresql.org/download/windows/). After installing PostgreSQL, follow the wizard to install PostGIS as well.

If you want other DVRPC staff to connect to you local PostgreSQL cluster, you will need to adjust* the `pg_hba.conf` file located in the PostgreSQL installation directory usually at `C:\Program Files\Postgresql\x\data` (with x being your PostgreSQL version number).  Comment out all entries in the file at the bottom using `x` and add
```
host            all             all             0.0.0.0/0            md5
```
*This may require IT assistance

## IDE options

PostgreSQL comes bundled with ["PgAdmin" v4](https://www.pgadmin.org/). This gets the job done but is not without its quirks. A recommended alternative is ["DBeaver"](https://dbeaver.io/).

## Loading non-spatial data

Tabular data can be loaded into postgres by:

- running SQL statements that define the table schema and then copy the file into the empty table
- using Python to read the file into memory and write to postgres with `pandas`
- using an IDE (no coding required)

## [Loading spatial data](spatial_data.md#loading_spatial_data)
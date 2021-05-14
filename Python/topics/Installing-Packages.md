# Installing one package

The ecosystem of open-source 3rd-party libraries are a major
component of why Python has become one of the most commonly-used
programming languages.

## `pip`

In the early days of Python, the only way to install a package published by a
3rd-party was by running the command below. We'll use `pandas` for this example:

```bash
pip install pandas
```

This command searches the [Python Package Index (aka "PyPI")](https://pypi.org) for a package named `pandas`. If it finds a match, it will install it into whatever
environment the command was executed from, so make sure that the appropriate environment has been activated before executing this command.

`pip` is still widely used, but comes with some major limitations for Windows
users hoping to install open-source GIS packages (like `geopandas`)

## `conda`

Most (but not all) packages are also published on [conda-forge](https://conda-forge.org). The major difference between the two is that `conda` is installing binaries while `pip` is installing and building from source code. Another benefit is that packages are audited for safety/security before being included on conda-forge. One downside to this safety feature is that sometimes a library's package on `conda` might be a version behind what's available on `pip`. As long as you don't need a bleeding-edge library, this is a net benefit.

To install `pandas` from the channel `conda-forge`, run:

```bash
conda install -c conda-forge pandas
```

# Installing many pakcages at once

If you have a project with a long list of dependencies, you aren't going to want
to install them one-by-one. The approach to installing all dependencies at once
depends on whether you're using `pip` or `conda`.

## `environment.yml` with `conda`

You can define a full `conda` environment using a `yml` file that by convention
is often named `environment.yml`. This file contains the following components:

- `name` of the environment
- `channels` to pull libraries from
- `dependencies` as a tabbed-in list with a dash prefix

```yml
name: my-environment-name
channels:
  - conda-forge
dependencies:
  - python=3.8*
  - geopandas
  - psycopg2
  - jupyterlab
```

You can also include libraries that aren't available on `conda` by using `pip`, although mixing `conda` and `pip` is not ideal and should only be done when installing packages that aren't yet available on `conda-forge`.

In the example below, a Python package from GitHub is installed with `pip` after
`conda` creates the environment and installs the other packages first:

```yml
name: my-environment-name
channels:
  - conda-forge
dependencies:
  - python=3.8*
  - geopandas
  - pip
  - pip:
      - git+https://github.com/username/repo-name.git
```

## `requirements.txt` with `pip`

A standard file found across most Python projects is `requirements.txt`. This is
typically formatted like this:

```text
flask
sqlalchemy
geopandas
psycopg2
```

You can also specify a specific version if needed. This is especially helpful for
production deployments but is less important for desktop-oriented programming.

```text
flask < 2
sqlalchemy >= 1.1.1
geopandas == 0.25.7
psycopg2 >= 1.0, <= 2.0
```

Assuming you have a `requirements.txt` file in your active directory and have your
virtual environment activated, you can install all packages together with:

```bash
pip install -r requirements.txt
```

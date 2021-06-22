# Python Packages

As you write more and more code, you'll eventually hit a point where your file becomes so large it's unwieldy to work with.

At this point you'll want to spend some time refactoring your work into a multi-file structure. You have a few options here:

- store a handful of Python files in a single folder. Import a class from `script_two.py` into `script_one.py` like so:

```python
from script_two import SomeClass

# ... etc ...
```

- define a formal Python "module" by adding an empty file named "`__init__.py`" into the folder. Assuming the name of the folder is "`my_project`" you can then access the code within `script_two.py` like so:

```python

from my_project.script_two import SomeClass

# ... etc ...
```

## Command-Line-Interface (CLI)

Although not required, it's helpful to define a CLI for your package to run frequently-used scripts. There are a number of Python packages that help build CLIs, with [`click`](https://click.palletsprojects.com/en/8.0.x/) being a widely-used option.

Instead of invoking your code like this:

```bash
python my_project/script_one.py
```

You could define whatever terms are most meaningful to you. As an example:

```bash
bikeshare scrape-data
```

## Documentation

As your codebase grows, so too does the need to document it. At a minimum your functions should all have docstrings, as should script files. Type hint annotations for function arguments and return values are good to add.

Your documentation can be as simple or complex as warranted. A solution could range from a single README file, to a folder full of markdown files, all the way to a documentation website packaged by `mkdocs` or `sphinx` and hosted on GitHub Pages.

## Publishing / Sharing Your Code with Others

Including a `setup.py` file at the root level of your repo allows it to be installed by `pip`. This is useful for local development as you can run the command below, which installs your module into the Python environment.

```bash
pip install --editable .
```

This also allows you (and others) to install this into other projects environments directly from GitHub via:

```bash
pip install git+https://github.com/account-name/repo-name.git
```

You can also publish the package to the Python Package Index, aka "PyPI". [`poetry`](https://python-poetry.org) is a relatively new tool that facilitates the building, packaging, and publishing of a codebase to PyPI.

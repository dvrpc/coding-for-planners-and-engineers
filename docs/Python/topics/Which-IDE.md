# Integrated Development Environment (IDE)

An "IDE" is essentially a souped-up text editor that typically provides:

- a convenient way to "run" your code
- integration with virtual environments
- inline documentation via type-hints and docstring tooltips
- refactoring functions (e.g. rename a variable across all files that reference it)
- integration with version control (i.e. Git + GitHub)
- a debugger

Many IDEs also provide:

- custom colors / styles
- community plugins
- bells
- whistles

## Which IDE is best for me?

Just like the "best" way to install Python, the "best" IDE for you depends on
what you're working on as well as the features you want to use.

The two primary IDEs for Python are:

- VSCode
- PyCharm

Other options include:

- Spyder
- Jupyter Lab (**not a true IDE!**)
- Terminal + any old text editor (**not a true IDE!**)

### VS Code

Visual Studio Code is an open-source lightweight, extendable IDE published by
Microsoft that works for many languages, not just Python.

To use VSCode for Python, you'll need to install the Python plugin published by
Microsoft. Once you've installed this plugin the Python features within VSCode will
be activated.

### PyCharm

PyCharm is published by JetBrains and comes in "community" and "pro" versions (free
and paid, respectively). Unlike many "free" versions of paid software, PyCharm's
Community software has pretty much everything you'd need.

Unlike VSCode (which can be used for all languages), PyCharm is geared specifically
towards writing code in Python. As a result, many of the features you'd need a plugin
for in VSCode are bundled into PyCharm by default. The cost of this is that the
software is more "bloated" with features you might not need, and as a result
PyCharm consumes more RAM than VSCode does.

## What about notebooks?

Despite both being valid Python code, "notebooks" are different from "scripts":

- A script is a file that ends in `.py` and when you run the script, all of the code
  gets executed immediately.
- Notebooks, on the other hand, are files that end in `.ipynb` and allow you to
  group your code chunks into "cells". You can then execute each cell one at a time,
  stopping to inspect / explore the variables your code has created or updated.

While notebooks are VERY helpful in exploring a new concept or library, they are
not the ideal final resting place for your code for a number of reasons. For example,
notebooks aren't saved in a true text-based format, making it impossible to see a readable
diff between two versions of the same file. The also encourage/facilitate messy code
since you're able to execute cells out of order.

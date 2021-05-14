# Setting Up Your IDE

## VSCode

To [configure VSCode for Python work](https://code.visualstudio.com/docs/languages/python), install the "Python" extension through the "Extensions" button in the sidebar. This only needs to be completed once.

Whenever you work on a new project, you'll need to configure VSCode to point to
the Python interpreter within the virtual environment you created for your project. This can be done in two ways:

1. by clicking the "Python" text at the bottom-left of the screen and selecting your virtual environment from the dropdown that appears
2. by opening the "Command Palette" (`Ctrl-Shift-P` on Windows and `Command-Shift-P` on Mac) and typing "Python: Select Interpreter"

## PyCharm

Setup of PyCharm is a bit more straightforward. No plugins are necessary, and the only
thing you need to do is [select your virtual environment](https://www.jetbrains.com/help/pycharm/creating-virtual-environment.html) whenever you work on a project
for the first time.

# Other considerations

## Formatting

IDEs provide a slew of customization options, including the ability to [run a code
formatter like `black` on your files every time you save a change](https://code.visualstudio.com/docs/python/editing#_formatting). There are a number of formatter options out there, each with their own opinions.

## Linting

Similarly, IDEs will "lint" your code by default, notifying you if you've made errors
in your code, written code that can't be accessed, etc. By default VSCode ships with `pylint` but `flake8` is another good option for a Python linter.

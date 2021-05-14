# Python installation

The "best" way to install Python depends on a number of factors,
including your operating system and the types of 3rd-party libraries
you intend to install.

## Windows

If you're using a Windows computer and intend to install open-source
GIS packages (i.e. those that build on top of `GDAL`), you're going to
have the easiest time using [`miniconda3`](https://docs.conda.io/en/latest/miniconda.html).

A major benefit of the `conda` ecosystem is that packages are distributed as
binaries that don't need to be built on your local machine. In contrast, the
typical approach to installing packages with `pip` requires that your machine
have the appropriate compilers.

Windows users who want to use any of the
other options listed below will need to install a [C++ compiler](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2019) from Microsoft's Build Tools for Visual Studio 2019.

## Mac / Linux

There's fewer constraints when installing Python on \*nix machines since they typically
include the necessary compilers by default. You can still use `miniconda3` on these machines,
but you can also install through other methods, including the [Python.org](https://www.python.org/downloads/) installer.

## WSL

Another option on Windows computers is to install Windows Subsystem for Linux (WSL),
which provides a terminal-based interface to Ubuntu(/Linux). This is a great option
for advanced users but is not recommended for new coders who are learning Python for
the first time.

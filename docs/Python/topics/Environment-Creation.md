# Virtual Environments

Now that you've installed Python on your system, you're going to want to create
a new "virtual environment" for each distinct project you work on. This helps
keep your dependencies for each project from clashing (e.g. Project A needs version 2
of `somelibrary` whereas Project B needs version 3 of the same library).

## Create an environment

Use `conda` to create a new environment named `my-environment-name` with Python version 3.8:

```bash
conda create --name my-environment-name python=3.8
```

## Activate the environment

Once the environment has been created, you'll need to activate it anytime you begin a session:

```bash
conda activate my-environment-name
```

## Configure the environment

With your environment active, run the following two commands to ensure that
the `conda-forge` channel is given priority when determining which packages to build from:

```bash
conda config --env --add channels conda-forge
conda config --env --set channel_priority strict
```

## Install miniwdl

### Requirements:

- Linux or macOS (limited support)
- Python 3.6 or higher
- Docker Engine 17 or higher
- Unix user must have permission to control Docker
- graphviz (optional) for workflow visualizaiton

### Installation options:

- via PyPI: `pip3 install miniwdl`
- via conda: `conda install --channel conda-forge miniwdl`
- see the miniwdl [GitHub repo](https://github.com/chanzuckerberg/miniwdl/) README to install from source

### Setup Verification

- open a command prompt and run...
- `miniwdl run_self_test`
- …30 second test of the installation with a built-in workflow
- should print numerous log messages, and conclude with... 
- `miniwdl run_self_test OK` 
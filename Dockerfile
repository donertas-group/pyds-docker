FROM nvcr.io/nvidia/pytorch:23.12-py3

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Berlin

RUN apt-get update \
    && apt-get install -y sudo \
    && apt-get install -y --no-install-recommends \
    # Git-LFS for files larger than 100 MB
    git-lfs \
    # .NET SDK for devcontainers
    aspnetcore-runtime-8.0 \
    # HDF5
    hdf5-tools \
    # Fish shell
    fish

# Silence pip's warnings
ENV PIP_ROOT_USER_ACTION=ignore \
    PIP_DISABLE_PIP_VERSION_CHECK=true

# Install main Python packages
RUN python3 -m pip install \
    # The version constraints come from torch's cudf dependency
    'pandas<1.6' \
    'numpy<=1.24' \
    'scipy' \
    'scikit-learn' \
    'matplotlib' \
    'altair' \
    'vega_datasets'

# Install bioinformatics Python tools 
RUN python3 -m pip install \
    'scikit-bio' \
    'anndata' \
    'biopython' \
    'scanpy' \
    'gemelli' 

# Install dev packages (optional)
RUN python3 -m pip install \
    'ipykernel' \ 
    'ipython' \
    'mypy' \
    'pandas-stubs' \
    'matplotlib-stubs'

# ---------------------------------------------------------------------------- #
# Autoreload in Python
RUN echo "c.InteractiveShellApp.exec_lines = ['%load_ext autoreload', \
    '%autoreload 2']" > "$(ipython locate)/profile_default/ipython_config.py"

ENV DEBIAN_FRONTEND=dialog

# Setup fish shell 🐟
RUN chsh -s $(which fish)

CMD ["bash"]
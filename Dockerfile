FROM nvcr.io/nvidia/pytorch:23.12-py3

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Berlin

RUN apt-get update \
    && apt-get install -y sudo \
    && apt-get install -y --no-install-recommends \
    # Git-LFS for files larger than 100 MB
    git-lfs \
    # .NET SDK for devcontainers
    aspnetcore-runtime-8.0

# Silence pip's warnings
ENV PIP_ROOT_USER_ACTION=ignore \
    PIP_DISABLE_PIP_VERSION_CHECK=true

# Install main Python packages
RUN pip install \
    'pandas<1.6' \
    numpy \
    scipy \
    scikit-learn \
    matplotlib \
    plotnine

# Install bioinformatics Python tools 
RUN pip install \
    scikit-bio \
    anndata \
    biopython \
    gemelli 

# Install dev packages (optional)
RUN pip install \
    ipykernel \ 
    ipython

# ---------------------------------------------------------------------------- #

ENV DEBIAN_FRONTEND=dialog
CMD ["bash"]
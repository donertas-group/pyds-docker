FROM nvcr.io/nvidia/pytorch:23.12-py3

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Berlin

RUN apt-get update \
    && apt-get install -y sudo \
    && apt-get install -y --no-install-recommends git-lfs

# Silence pip's warnings
ENV PIP_ROOT_USER_ACTION=ignore \
    PIP_DISABLE_PIP_VERSION_CHECK=true

# Install Python packages
RUN pip install \
    numpy \
    scipy \
    'pandas<1.6' \ 
    scikit-learn \
    matplotlib \
    plotnine \ 
    ipykernel \ 
    ipython

# ---------------------------------------------------------------------------- #

ENV DEBIAN_FRONTEND=dialog
CMD ["bash"]
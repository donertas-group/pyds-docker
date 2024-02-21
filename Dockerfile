FROM nvcr.io/nvidia/pytorch:23.12-py3

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Berlin

RUN apt-get update \
    && apt-get install -y sudo \
    && apt-get install -y --no-install-recommends git-lfs

# Install Python packages
RUN apt-get install -y --no-install-recommends \
    python3-numpy \
    python3-scipy \
    python3-pandas \
    python3-sklearn \
    python3-matplotlib \
    python3-ipykernel \
    python3-ipython 

# Silence pip new version warnings
RUN pip config set global.disable-pip-version-check true

# ---------------------------------------------------------------------------- #

ENV DEBIAN_FRONTEND=dialog
CMD ["bash"]
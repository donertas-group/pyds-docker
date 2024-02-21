FROM nvcr.io/nvidia/pytorch:23.12-py3

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Berlin

RUN apt-get update

# Install software
RUN apt-get install -y --no-install-recommends git-lfs

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

# -------------------- Add non-root user for devcontainers ------------------- #
ARG USERNAME=user
ARG USER_UID=3131
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Set the default user.
USER $USERNAME

# ---------------------------------------------------------------------------- #

ENV DEBIAN_FRONTEND=dialog
CMD ["bash"]
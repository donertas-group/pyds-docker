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

# Install Python packages from PyPi
RUN pip install \
    plotnine 

ENV DEBIAN_FRONTEND=dialog

# Store bash history
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && echo $SNIPPET >> ~/.bashrc
# Pretty prompt
RUN echo 'export PS1="🐳 \[\033[1;36m\][\u@docker] \[\033[1;34m\]\W\[\033[0;35m\] # \[\033[0m\]"' >> ~/.bashrc

CMD ["bash"]
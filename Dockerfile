FROM ubuntu:24.10

RUN apt-get update && apt-get install -y \
    vim \
    vim-airline \
    build-essential \
    python3 \
    python3-venv \
    python3-pip \
    python-is-python3 \
    tmux \
    bash \
    bash-completion \
    command-not-found \
    sudo \
    silversearcher-ag \
    curl \
    procps \
    file \
    git \
    di \
    lua5.4 \
    clang \
    ninja-build \
    cmake \
    && rm -rf /var/lib/apt/lists/*

# Add user
ARG USERNAME
ARG PASSWORD
RUN useradd -m -s /bin/bash -G sudo $USERNAME && \
    echo "$USERNAME:$PASSWORD" | chpasswd

# Install Homebrew
RUN useradd -m -s /bin/zsh linuxbrew && \
    usermod -aG sudo linuxbrew &&  \
    mkdir -p /home/linuxbrew/.linuxbrew && \
    chown -R linuxbrew: /home/linuxbrew/.linuxbrew
USER linuxbrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

USER root
RUN chown -R $USERNAME: /home/linuxbrew/
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"
RUN git config --global --add safe.directory /home/linuxbrew/.linuxbrew/Homebrew

USER $USERNAME

RUN brew update
RUN brew doctor

# Install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Define entry point
CMD ["tmux"]

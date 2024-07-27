FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
  bash \
  build-essential \
  clang \
  clang-format \
  clang-tidy \
  cmake \
  ninja-build \
  valgrind \
  sudo \
  vim \
  vim-airline \
  silversearcher-ag \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get clean

RUN useradd -m -s /bin/bash -u 1000 user && \
    echo "user:user" | chpasswd && \
    usermod -aG sudo user && \
    echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER user
WORKDIR /home/user

CMD ["/bin/bash"]

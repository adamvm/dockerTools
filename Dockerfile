FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
  build-essential \
  clang \
  clang-format \
  clang-tidy \
  cmake \
  ninja-build \
  valgrind
RUN apt-get clean

ENTRYPOINT ["date"]

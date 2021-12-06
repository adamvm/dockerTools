FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
  clang \
  clang-format \
  clang-tidy \
  cmake \
  valgrind
RUN apt-get clean

ENTRYPOINT ["date"]

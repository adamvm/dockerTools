FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
  clang \
  clang-format \
  clang-tidy
RUN apt-get clean

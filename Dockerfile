FROM ubuntu

# Prevent dialogs during build
ENV DEBIAN_FRONTEND noninteractive

#GeneralDependencies
RUN apt update && apt-get install -y \
g++-multilib \
gcc-multilib \
build-essential \
cpio \
curl \
git \
iputils-ping \
lsb \
python3-dev \
python3-numpy \
python3-pip \
python3-scipy \
python3-setuptools \
python3-tk \
rsync \
sudo \
zsh \
time \
vim

#pythonlibs
RUN pip install --upgrade pip numpy matplotlib pandas enum34
RUN pip3 install --upgrade pip numpy matplotlib pandas enum34

#parallel libraries
RUN apt update && apt-get install -y \
g++-10 \
gcc-10 \
clang-13 \
libomp-dev \
libopenmpi-dev \
libpthread-stubs0-dev

#Arm dependencies
RUN apt-get install -y \
g++-aarch64-linux-gnu \
g++-arm-linux-gnueabi \
gcc-aarch64-linux-gnu \
gcc-arm-linux-gnueabi \
gcc-arm-none-eabi \
gfortran-aarch64-linux-gnu \
gfortran-arm-linux-gnueabi

# This must be in a different command otherwise it breaks the build
RUN apt-get install -y gcc-arm-linux-gnueabihf

RUN mkdir -p /usr/tmp
WORKDIR /root

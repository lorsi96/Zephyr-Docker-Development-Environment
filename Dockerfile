# Author: lorsi@itba.edu.ar
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG ZSDKV=0.13.1
ENV PATH=/usr/local/bin:$PATH

# Linux Dependencies installation.
RUN apt update -y && apt upgrade -y
RUN apt install --no-install-recommends -y \ 
    git cmake ninja-build gperf ccache dfu-util device-tree-compiler wget \
    python3-dev python3-pip python3-setuptools python3-tk python3-wheel \ 
    xz-utils file make gcc gcc-multilib g++-multilib libsdl2-dev

# West installation.
RUN pip3 install -U west

# CMake installation. Easiest way to install updated CMake version is using pip.
RUN apt remove cmake -y && \
    pip3 install cmake --upgrade && \
	ln /usr/local/bin/cmake /usr/bin/cmake


# Zephyr SDK installation. 
RUN wget --quiet https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v$ZSDKV/zephyr-sdk-$ZSDKV-linux-x86_64-setup.run
RUN chmod +x zephyr-sdk-$ZSDKV-linux-x86_64-setup.run \
	&& /zephyr-sdk-$ZSDKV-linux-x86_64-setup.run --quiet -- -d /opt/zephyr-sdk-$ZSDKV \
	&& rm -f /zephyr-sdk-$ZSDKV-linux-x86_64-setup.run

# Zephyr Workspace initialisation.
RUN west init /zephyrproject \
	&& cd /zephyrproject \
	&& west update \
	&& west zephyr-export \
	&& pip3 install -r zephyr/scripts/requirements.txt

# Zephyr Workspace.
WORKDIR /workspace

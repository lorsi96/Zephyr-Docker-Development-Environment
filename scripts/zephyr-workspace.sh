#!/bin/bash
readonly IMAGE_LABEL=lorsi/zephyr-workspace:latest

docker run -it \
    -v $(pwd):/workspace  \
    -v /dev:/dev \
    --privileged \
    --name zephyr-docker \
    --rm \
    -w /zephyrproject \
    ${IMAGE_LABEL} \
    /bin/bash

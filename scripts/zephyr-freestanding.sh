#!/bin/bash
docker run -it \
    -v $(pwd):/workspace  \
    -v /dev:/dev \
    --privileged \
    --name zephyr-docker \
    --rm \
    lorsi/zephyr-workspace:latest \
    /bin/bash

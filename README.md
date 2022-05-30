# Zephyr Development Environment

## Summary
Dockerized environment to build and flash Zephyr applications.

## Instructions

### Build Image
```sh
docker build -t lorsi/zephyr-workspace
```

### Run Console with Zephyr/West installed
#### Inside a `Zephyrproject` folder (Workspace Structure)
```sh
./scripts/zephyr-workspace.sh
```
#### Mounting `$pwd` in a separate workspace folder (Freestanding Structure)
```sh
./scripts/zephyr-freestanding.sh
```

### Running Blinky Example
```sh
./zephyr-workspace.sh
west build -p auto --board nrf52840dk_nrf52840 ./zephyr/samples/basic/blinky
west flash 
```



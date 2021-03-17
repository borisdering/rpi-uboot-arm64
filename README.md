# Docker Image UBoot Amd64 For Raspberrry Pi 3b Plus

## Build Docker Image
```
$ docker build . -t u-boot
```

## Run Container
```
$ docker run -it --name u-boot --rm  u-boot bash
```

## Compile UBoot
```
$ cd $HOME/u-boot
$ make rpi_3_b_plus_defconfig 
$ make
```

# sieve-connect-docker

![Docker Build](https://github.com/sylvainmetayer/sieve-connect-docker/workflows/Docker%20Build/badge.svg?branch=main)
![Docker pulls](https://img.shields.io/docker/pulls/sylvainmetayer/sieve-connect.svg)

Docker image of [Sieve connect](https://github.com/philpennock/sieve-connect)

## Usage

`docker run --rm -it sylvainmetayer/sieve-connect sieve-connect.sh -u USER -s SIEVE_SERVER`

If you want to download / push elements to your SIEVE server, use the following 

`docker run --rm -it -v $(pwd):/opt/data -e LOCAL_USER_ID=$(id -u) sylvainmetayer/sieve-connect sieve-connect.sh -u USER -s SIEVE_SERVER`

Remember to adjust `$(pwd)` to fit your needs (current folder or replace it with a folder of your choice)


# sieve-connect-docker


Docker image of [Sieve connect](https://github.com/philpennock/sieve-connect)

## Usage

`docker run --rm -it sylvainmetayer/sieve-connect bash sieve-connect.sh -u USER -s SIEVE_SERVER`

If you want to download / push elements to your SIEVE server, use the following 

`docker run --rm -it -v $(pwd):/opt/data sieve-connect bash sieve-connect.sh -u USER -s SIEVE_SERVER`

Remember to adjust `$(pwd)` to fit your needs (current folder or replace it with a folder of your choice)


FROM perl:5-buster

LABEL maintainer="contact@sylvainmetayer.fr"

COPY sieve-connect.sh /opt/sieve-connect.sh

ENV PATH="/opt/:${PATH}"
ENV SIEVE_CONNECT_VERSION 0.90
ENV PERL_MM_USE_DEFAULT 1

WORKDIR /opt

RUN wget -O sieve-connect.tar.gz https://github.com/philpennock/sieve-connect/archive/v$SIEVE_CONNECT_VERSION.tar.gz \
    && tar -xzf sieve-connect.tar.gz \
    && rm sieve-connect.tar.gz \
    && mv /opt/sieve-connect-* /opt/sieve-connect

RUN cpan -i Authen::SASL \
    && cpan -i inc::latest \
    && cpan -i CPAN::DistnameInfo \
    && cpan -i Socket6 \
    # No tests for this one, fail to build otherwise
    && cpanm IO::Socket::INET6 -n \
    && cpan -i IO::Socket::SSL \
    && cpan -i Mozilla::PublicSuffix \
    && cpan -i Net::DNS \
    && cpan -i Pod::Usage \
    && cpan -i Term::ReadKey \
    && cpan -i Term::ReadLine

WORKDIR /opt/data
VOLUME [ "/opt/data" ]

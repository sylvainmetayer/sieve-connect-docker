FROM perl:5-buster
ENV SIEVE_CONNECT_VERSION 0.90
ENV PERL_MM_USE_DEFAULT 1
WORKDIR /opt
RUN wget -O sieve-connect.tar.gz https://github.com/philpennock/sieve-connect/archive/v$SIEVE_CONNECT_VERSION.tar.gz \
 && tar -xzf sieve-connect.tar.gz \
 && rm sieve-connect.tar.gz \
 && mv /opt/sieve-connect-* /opt/sieve-connect
RUN cpan -i Authen::SASL 
RUN cpan -i inc::latest
RUN cpan -i CPAN::DistnameInfo
RUN cpan -i Socket6
# No tests
RUN cpanm IO::Socket::INET6 -n
RUN cpan -i IO::Socket::SSL
RUN cpan -i Mozilla::PublicSuffix 
RUN cpan -i Net::DNS 
RUN cpan -i Pod::Usage 
RUN cpan -i Term::ReadKey 
RUN cpan -i Term::ReadLine # Term::ReadLine::Gnu

WORKDIR /opt/data
RUN echo '/usr/local/bin/perl /opt/sieve-connect/sieve-connect.pre.pl $@' > /opt/sieve-connect.sh \
 && chmod +x /opt/sieve-connect.sh
ENV PATH="/opt/:${PATH}"

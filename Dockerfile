FROM  ubuntu:16.04 AS build0
WORKDIR /opt/

RUN apt-get update && apt-get install -y binutils gcc

ADD wrapper.c /opt/

RUN gcc -shared  -ldl -fPIC -o wrapper.so wrapper.c

FROM mcr.microsoft.com/mssql/server:2019-GA-ubuntu-16.04
COPY --from=build0 /opt/wrapper.so /opt/wrapper.so

CMD chmod a+r /opt/wrapper.so

USER root

ENV  LD_PRELOAD=/opt/wrapper.so
		
CMD  /opt/mssql/bin/sqlservr

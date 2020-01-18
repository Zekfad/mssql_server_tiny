FROM mcr.microsoft.com/mssql/rhel/server:2019-CU1-rhel-8 AS build0
WORKDIR /opc

RUN apt-get update && apt-get install -y binutils gcc

ADD wrapper.c /opc/

RUN gcc -shared  -ldl -fPIC -o wrapper.so wrapper.c


FROM mcr.microsoft.com/mssql/server:2019-GA-ubuntu-16.04
COPY --from=build0 /root/wrapper.so /opt/wrapper.so

CMD chmod a+r /opt/wrapper.so

ENV  LD_PRELOAD=/opt/wrapper.so
		
CMD  /opt/mssql/bin/sqlservr

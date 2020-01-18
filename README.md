# Microsoft SQL Server 2019

## 简介

这是一个在物理内存小于2G的机器（VPS）上也能运行的Microsoft SQL Server 2019镜像。

- 通过LD_PRELOAD修改sysinfo变量实现物理内存小于2G的机器能够运行Microsoft SQL Server 2019的目的

- modified to allow execution on a machine with less than 2 GiB of physical memory




## 使用方法

D:\database\mssql替换为宿主机的数据库目录，[Pass_word]替换为SA密码

    docker run  -e "ACCEPT_EULA=Y" -v D:\database\mssql:/var/opt/mssql/data/  -e "SA_PASSWORD=[Pass_word]"  -p 1433:1433 --name sql2 -d holmesian/mssql_server_2019_tiny


---

- `https://hub.docker.com/r/justin2004/mssql_server_tiny`




#!/bin/bash 


sysbench ./src/lua/oltp_read_only_v2.lua help

OPTIONS="--mysql-host=127.0.0.1 --mysql-port=3306 --mysql-user=app_onebox --mysql-password= --mysql-db=db_onebox --skip_trx=on --auto_inc=off --create_secondary=off --table_size=100 --db-ps-mode=disable "
sysbench ./src/lua/oltp_read_only_v2.lua prepare $(echo $OPTIONS)

sysbench ./src/lua/oltp_read_only_v2.lua run $(echo $OPTIONS)



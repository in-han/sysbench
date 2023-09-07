#!/bin/bash 


SYSBENCH=./src/sysbench
SYSBENCH=sysbench
SYSBENCH=src/sysbench.debug_test_1

sysbench ./src/lua/oltp_read_only_v2.lua help


OPTIONS="--mysql-host=127.0.0.1 --mysql-port=3306 --mysql-user=app_onebox --mysql-password= --mysql-db=db_onebox --skip_trx=on --auto_inc=off --create_secondary=off --table_size=100 --db-ps-mode=disable "

OPTIONS="--mysql-host=127.0.0.1 --mysql-port=3306 --mysql-user=app_onebox --mysql-password= --mysql-db=db_onebox --skip_trx=on --auto_inc=off --create_secondary=off --table_size=100 --threads=1 --tables=8 --validate=on"
$SYSBENCH ./src/lua/oltp_read_only_v2.lua prepare $(echo $OPTIONS)

$SYSBENCH ./src/lua/oltp_read_only_v2.lua run $(echo $OPTIONS) --threads=8

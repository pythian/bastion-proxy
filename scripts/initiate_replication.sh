#!/bin/bash

master_host=$1
replica_host=$2

# Initialize replication

mysql -h$master_host -uroot -ppassword -e"create user repl@'%' identified by 'repl'; grant replication slave on *.* to repl@'%'"
mysql -h$replica_host -uroot -ppassword -e"change master to master_host='$master_host',master_user='repl',master_password='repl'; start slave;"


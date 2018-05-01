#!/bin/bash

# Create proxysql monitor user
mysql -hmysqlprimary -uroot -ppassword -e"create user monitor@'%' identified by 'monitor';"
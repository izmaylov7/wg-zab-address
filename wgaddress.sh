#!/bin/bash
NAME=$1
cat "/usr/share/zabbix/$NAME" | grep 'Address'
izmaylov@vpn:~$ 
#!/bin/bash
echo -n '{"data":['
awk -F: '{ printf "%s{\"{#CLIENT}\":\"%s\"}", separator, $1; separator=","}' /home/log/wgclient.log
echo ']}'
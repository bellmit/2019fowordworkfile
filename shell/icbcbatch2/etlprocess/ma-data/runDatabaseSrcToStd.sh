#!/usr/bin/expect

spawn ssh -o StrictHostKeyChecking=no oracle@82.211.13.98

expect "*Password*"

send "qwert123\r"
expect "#"
cmd= "sh /dw-data/startEtlSrcToStd.sh $1 \r"
echo cmd
send cmd

expect eof
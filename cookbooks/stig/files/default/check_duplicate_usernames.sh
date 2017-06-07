#!/bin/bash

# Check for Duplicate User Names

echo "The Output for the Audit of Control 9.2.16 - Check for Duplicate User Names is"
cat /etc/passwd | cut -f1 -d":" | /bin/sort -n | /usr/bin/uniq -c |\
    while read x ; do
    [ -z "${x}" ] && break
    set - $x
    if [ $1 -gt 1 ]; then
        uids=`/bin/gawk -F: '($1 == n) { print $3 }' n=$2  /etc/passwd | xargs`
        echo "Duplicate User Name ($2): ${uids}"
    fi
done
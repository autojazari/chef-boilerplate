#!/bin/bash

# Check That Users Are Assigned Valid Home Directories

cat /etc/passwd | awk -F: '{ print $1 " " $3 " " $6 }' | while read user uid dir; do
	if [ $uid -ge 500 -a ! -d "$dir" -a $user != "nfsnobody" ]; then
		echo "The home directory ($dir) of user $user does not exist."
	fi
done
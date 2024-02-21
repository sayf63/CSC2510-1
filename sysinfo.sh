#!/bin/bash
cd system_info
echo "System information has been gathered. Here's the summary: " >> system_info.txt
date "+%D %T %Z" >> system_info.txt
echo "Current user: " >> system_info.txt
whoami >> system_info.txt
echo "Current Directory: " >> system_info.txt
pwd >> system_info.txt
echo "System Usage: " >> system_info.txt
top -n 1 >> system_info.txt
#Could not get top to get work with windows based system. I do not have it preinstalled with my computer and could not find solution.
echo "Disk usage: " >> system_info.txt
df -h --human-readable >> system_info.txt


 #!/bin/bash

#First question for utils.sh
find -L /usr/bin -name "c*"
#Second question for utils.sh
find -L /usr/bin -type f -name "*.sh"
#Third question for utils.sh
find -L /usr | head
#Fourth question for utils.sh
grep 'model name' /proc/cpuinfo
#Fifth question for utils.sh
grep -v 'sudo' /etc/group
#Sixth question for utils.sh
grep -n 'sudo' /etc/group

#I wasn't sure if you wanted us to do the sort commands in the utils.sh as it was never specificed where we should do them.
#So just incase I will simply outline the commands I used for sort in the shell script just incase.

#Seventh question for utils.sh
sort food
#Eitghth question for utils.sh
sort -r food
#Ninth question for utils.sh


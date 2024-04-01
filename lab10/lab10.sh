#!/bin/bash

HI='\033[0;32m'
NORMAL='\033[0m'


lab10 (){
#First question for lab10.sh
echo -e "${HI}Problem 1: Starts or ends with Jose.$NORMAL"
grep -E --color=always '^John|Jose$' "$1"

#Second question for lab10.sh
echo -e "${HI}Problem 2: Contain a sequence of at least 27 upper or lower-case alphabetic characters.$NORMAL"
grep -E --color=always '[A-Za-z]{27}' "$1"

#Third question for lab10.sh
echo -e "${HI}Problem 3: Consists of more than 18 characters. The characters can be anything, including alphabetic and numeric.$NORMAL"
grep -E --color=always '.{19,}' "$1"

#Fourth question for lab10.sh
echo -e "${HI}Problem 4: Contains exactly 10 characters.  The characters can be anything, including alphabetic and numeric.$NORMAL"
grep -E --color=always '.{10,10}' "$1"

#Fifth question for lab10.sh
echo -e "$(HI)Problem 5: $NORMAL"
grep -E --color=always '^[A-Za-z]{6,8}\s' "$1"

#Sixth question for lab10.sh
echo -e "${HI}Problem 6: Local Phone Number$NORMAL"
grep -E --color=always '^[^A-Za-z0-9-]' "$1"

#Seventh question for lab10.sh
echo -e "${HI}Problem 7: URL Link$NORMAL"
grep -E --color=always '^(http|HTTP)://[a-zA-Z]+\.[a-zA-Z]+\.(com|edu)' "$1"
}

if (("$#" == 1)); then
	lab10 "$1"
else
	lab10 phonebook.dat
fi

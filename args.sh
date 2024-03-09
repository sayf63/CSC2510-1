#!/bin/bash


function myfunct () {
	echo "Calling Program: $0"
	echo "Number of positional arguments: $#"
	echo "The positional arguments: $@"
}

myfunct "$0" "$1" "$2" "$3" "$4"

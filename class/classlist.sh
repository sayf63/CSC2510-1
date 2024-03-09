#!/bin/sh


foundfile=0
linematch=""

function classlist () {
	#Initial conditiondal with num of positional arguments seems to be off and won't work, please provide feedback on issue.
	if [[ "$#" == 2 ]]; then
		if [[ -f "$1" ]]; then
			foundfile=$(grep -c "$2" "$1")
			if [[ "$foundfile" -ge "1" ]]; then
				linematch=$(grep -n "$2" "$1")
				echo "$2 does exist"
				echo "The following line is $linematch"
			else
				read -p "Name could not be found, would you like to try and find add it to class.txt? answer n or y: " usrresponse
				echo
				while [[ "$usrresponse" != "n" && "$usrresponse" != "y" ]]
				do
					read -p "Please give a proper answer n or y: " ussresponse
					echo
				done
				if [[ "$usrresponse" == "y" ]]; then
					read -p "Would like to alphabetize the text after adding the new username? answer n or y: " usrresponse2
					while [[ "$usrresponse2" != "n" && "$usrresponse2" != "y" ]]
					do
						read -p "Please give a proper answer n or y: " usrresponse2
					done
					if [[ "$usrreponse2" -eq "y" ]]; then
						echo -e "$2" >> "$1"
						sort -c "$1"
						echo "We've added $2 to the file and alphabetized it!"
						exit 1
					else
						echo -e "$2" >> "$1"
						echo "We've added $2 to the file!"
						exit 1
					fi
				else
					echo "End of script!"
					exit 0
				fi
			fi
		else
			echo "Argument file does not exist!"
			exit 1
		fi
	else
		echo "Argument pattern incorrect!"
		exit 1
	fi
}

classlist "$1" "$2"

#!/bin/bash
readonly red_color='\033[0;31m'
readonly no_color='\033[0m'
FILE_NAME=""

function main {
	while true; do
	read -p "Enter file name or path: " FILE_NAME
	FILE_NAME=$(basename ${FILE_NAME})
	echo "Reading from ${FILE_NAME}"
	if [ -f ${FILE_NAME} ]; then
		if [ ! -e ${FILE_NAME} ]; then
			echo "File: ${FILE_NAME} is not readable. "i
			exit 1
		fi
	break
	else
		echo "File: ${FILE_NAME} does not exists."
		exit 1
	fi
	done

	while read -r LINE;
	do
		read -r f1 f2 <<< ${LINE}
		echo -e "\n"
		echo -e "${red_color}Current date: ${no_color}$(date +"%Y_%m_%d")"
		echo -e "${red_color}Address: ${no_color}${f1}, ${red_color}Port: ${no_color}${f2}"
		timeout 5 telnet ${f1} ${f2}
		trap 

	done < ${FILE_NAME}
}

main
echo "Papa"
exit 0

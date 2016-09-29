#!/bin/bash

IFS=$'\r\n' GLOBIGNORE='*' command eval  'line=($(cat ./word.ini))'

maxLine=$(cat word.ini | wc -l);
# echo $maxLine;
# echo "${line[0]}"

for (( i = 0; i < $maxLine; i++ )); do
	# echo ${line[$i]:0:1};
	# echo ${line[$i]: -1};

	firstC=${line[$i]:0:1};
	lastC=${line[$i]: -1};

	if [ "$firstC" == "[" ] && [ "$lastC" == "]" ]; then
		echo " " | tee -a output.md
		echo ${line[$i]} | tee -a output.md

	else
		content=${line[$i]}
		echo ${content##*=} | tee -a output.md
	fi

done

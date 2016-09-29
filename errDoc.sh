#!/bin/bash

IFS=$'\r\n' GLOBIGNORE='*' command eval  'line=($(cat ./word.ini))'

exportFile="errCode_doc.md"
rm errCode_doc.md

maxLine=$(cat word.ini | wc -l);
# echo $maxLine;
# echo "${line[0]}"

for (( i = 0; i < $maxLine; i++ )); do
	# echo ${line[$i]:0:1};
	# echo ${line[$i]: -1};

	firstC=${line[$i]:0:1};
	lastC=${line[$i]: -1};

	if [ "$firstC" == "[" ] && [ "$lastC" == "]" ]; then
		echo " " | tee -a $exportFile
		echo ${line[$i]} | tee -a $exportFile

	else
		content=${line[$i]}
		echo ${content##*=} | tee -a $exportFile
	fi

done

echo "============"
echo "Export file name is : "$exportFile

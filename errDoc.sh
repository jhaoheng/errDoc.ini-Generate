#!/bin/bash

ini_file_path="./word.ini"

exportFile="errCode_doc.md"
exportPath="./"
output=$exportPath$exportFile

echo "input file : "$ini_file_path
echo "output file : "$output
echo ""
echo "============"

IFS=$'\r\n' GLOBIGNORE='*' command eval  'line=($(cat $ini_file_path))'

exportFile="errCode_doc.md"
rm errCode_doc.md

maxLine=$(cat $ini_file_path | wc -l);
# echo $maxLine;
# echo "${line[0]}"

for (( i = 0; i < $maxLine; i++ )); do
	# echo ${line[$i]:0:1};
	# echo ${line[$i]: -1};

	firstC=${line[$i]:0:1};
	lastC=${line[$i]: -1};

	if [ "$firstC" == "[" ] && [ "$lastC" == "]" ]; then
		echo " " | tee -a $output
		echo ${line[$i]} | tee -a $output

	else
		content=${line[$i]}
		echo ${content##*=} | tee -a $output
	fi

done

echo "============"
echo "Export file name is : "$output

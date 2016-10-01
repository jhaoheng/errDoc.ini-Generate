#!/bin/bash

jqversion=$(jq --version)
jq=${jqversion:0:2}

if [ "$jq" == "jq" ]; then
	echo ""
	echo "Dependent : "$jqversion
else
	echo ""
	echo "\033[41;37m""Please install 'jq' to use this script""\033[0m"
	echo "\033[41;37m""http://xmodulo.com/how-to-parse-json-string-via-command-line-on-linux.html""\033[0m"
	exit
fi

echo "\033[1;32m"
echo "Please input [.ini] file, ex: word.ini"
echo "\033[0m"

default_file=$(cat config.json | jq -r '.input.defaultFile')
inputPath=$(pwd)"/"$(cat config.json | jq -r '.input.path')
echo "default : "$inputPath$default_file

read -p "file : " _input

# input
if [ "$_input" ==  '' ]; then
	_input=$default_file
fi
inputName="${_input%%.*}"
inputExt=".${_input##*.}"
input=$inputPath$inputName$inputExt

# output
outputPath=$(pwd)"/"$(cat config.json | jq -r '.output.path')
outputName=$(cat config.json | jq -r '.output.name'); if [[ "$outputName" == "" ]]; then outputName=$inputName; fi
outputExt=$(cat config.json | jq -r '.output.ext'); if [[ "$outputExt" == "" ]]; then outputExt=".md"; fi
output=$outputPath$outputName$outputExt

echo ""
echo "input : "$input
echo "output : "$output
echo ""
echo "============"

IFS=$'\r\n' GLOBIGNORE='*' command eval  'line=($(cat $input))'

exportFile="errCode_doc.md"
rm errCode_doc.md

maxLine=$(cat $input | wc -l);
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

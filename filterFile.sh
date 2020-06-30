#!/bin/bash

inFilename=""
outFilename=""
filterString=""
while [[ $# -gt 0 ]]
do
    key="$1"

    case $key in
        -i|--input)
            inFilename="$2"
            shift # past argument
            shift # past value
            ;;
        -o|--output)
            outFilename="$2"
            shift # past argument
            shift # past value
            ;;
        -f|--filter)
            filterString="$2"
            shift # past argument
            shift # past value
            ;;
        -h|--help)
            echo "You can use:"
            echo "-i or --input to specify the input filename"
            echo "-o or --output to specify the output filename"
            echo "-f or --filter to specify the string to be used as filter"
        shift # past argument
        ;;
        *)
        shift # past argument
    esac
done

if [ -z "$inFilename" ] || [ -z "$outFilename" ] || [ -z "$filterString" ] 
then
    if [ -z "$inFilename" ]
    then
        echo "No input filename specified as parameter"
    fi
    if [ -z "$outFilename" ]
    then
        echo "No output filename specified as parameter"
    fi
    if [ -z "$filterString" ]
    then
        echo "No filter string specified as parameter"
    fi
    echo "You can use:"
    echo "-i or --input to specify the input filename"
    echo "-o or --output to specify the output filename"
    echo "-f or --filter to specify the string to be used as filter"
else
    echo "Processing: $inFilename - saving in $outFilename - filter: $filterString" 
    while IFS= read -r line
    do
        if [[ $line == *"$filterString"* ]];
        then
            echo "$line" >> $outFilename
        fi
    done < $inFilename
fi

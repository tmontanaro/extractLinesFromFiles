# Extract lines from a file

This bash script allows to use a string as filter to extract only lines that contains that string from an input file.
The resulting lines are saved in an output file specified through command line parameters

### How to use it:
`./filterFile.sh -i inputFile.txt -o outputFile.txt -f "filter string"`

### Available parameters:
* -i or --input to specify the input filename
* -o or --output to specify the output filename
* -f or --filter to specify the string to be used as filter

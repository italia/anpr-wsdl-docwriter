#!/bin/bash

pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd -P`
popd > /dev/null


function helptxt {
    echo "Ciao"
}
input=''
outputFolder=''


if [ -z "$1" ]; then
    helptxt
else
    while [ $1 ]; do
        case $1 in
            --input)
                shift
                input=$1
                ;;
            --outputFolder)
                shift
                outputFolder=$1
                ;;
            --help)
                helptxt
                ;;
            *)
                echo -e "\n${bold}$1 is not a valid parameter.${normal}\n" >&2
                exit 1
                ;;
        esac
        shift
    done
fi

node "$SCRIPTPATH/WSDL.js" --wsdl $input -o $outputFolder
for fin in "$outputFolder/*.yaml"; do
    echo $fin
    filename=`basename $fin`
    filename=${filename%%.*}
    echo $filename
    java -jar "$SCRIPTPATH/swagger-codegen-cli.jar" generate -l html2 -i $fin -o $outputFolder
    mv $outputFolder/index.html $outputFolder/${filename}.html
done
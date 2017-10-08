#!/bin/bash

DIR=$(pwd)
NAME="*.wsdl"
TMP_FILE="/tmp/wsdl_tmp"

# for d in ../wsdl/*; do
for d in wsdl/*; do
	FILE=$DIR/$d/$NAME

    # echo $DIR/$d
    # if [ -d "$DIR/$d" ]; then
    # 	exit 1
    # fi

    if [ ${FILE: -4} == ".xsd" ]; then 
        cp $DIR/bin/wsdl-viewer/wsdl-viewer.xsl $DIR/$d
        sed 's/<?xml version="1.0" encoding="UTF-8"?>//g' $FILE > $TMP_FILE
        sed -i '1s/^/<?xml version="1.0" encoding="UTF-8"?> <?xml-stylesheet type="text\/\xsl" href="wsdl-viewer.xsl"?> /' $TMP_FILE
        mv $TMP_FILE $FILE
    fi 
	#sed 's/.\{38\}/&<?xml-stylesheet type="text\/\xsl" href="wsdl-viewer.xsl"?>/' $FILE > $TMP_FILE
	#sed 's/.*<?xml version="1.0" encoding="UTF-8"?>.*/&\n<?xml-stylesheet type="text\/\xsl" href="wsdl-viewer.xsl"?>/' $FILE > $TMP_FILE
done

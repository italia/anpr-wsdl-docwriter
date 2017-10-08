#!/bin/bash

DIR=$(pwd)
NAME="*.wsdl"
TMP_FILE="/tmp/wsdl_tmp"

for d in wsdl/*; do
	FILE=$DIR/$d/$NAME

    # Check if file is wsdl and if true add html render (italia-wsdl-viewer.xsl)
    if [ ${FILE: -5} == ".wsdl" ]; then 
        cp $DIR/bin/wsdl-viewer/italia-wsdl-viewer.xsl $DIR/$d
        sed 's/<?xml version="1.0" encoding="UTF-8"?>//g' $FILE > $TMP_FILE
        sed -i '1s/^/<?xml version="1.0" encoding="UTF-8"?> <?xml-stylesheet type="text\/\xsl" href="italia-wsdl-viewer.xsl"?> /' $TMP_FILE
        mv $TMP_FILE '$FILE.xml'
    fi 
	# sed 's/.\{38\}/&<?xml-stylesheet type="text\/\xsl" href="wsdl-viewer.xsl"?>/' $FILE > $TMP_FILE
	# sed 's/.*<?xml version="1.0" encoding="UTF-8"?>.*/&\n<?xml-stylesheet type="text\/\xsl" href="wsdl-viewer.xsl"?>/' $FILE > $TMP_FILE
done

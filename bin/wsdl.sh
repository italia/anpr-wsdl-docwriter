#!/bin/sh

DIR=$(pwd)
NAME="*.wsdl"
TMP_FILE="/tmp/wsdl_tmp"

for d in ../wsdl/*; do
	FILE=$(ls $DIR/$d/$NAME)
	if [ $? -ne 0 ]; then
		exit 1
	fi
	cp $DIR/wsdl-viewer/wsdl-viewer.xsl $DIR/$d
	sed 's/<?xml version="1.0" encoding="UTF-8"?>//g' $FILE > $TMP_FILE
	sed -i '1s/^/<?xml version="1.0" encoding="UTF-8"?> <?xml-stylesheet type="text\/\xsl" href="wsdl-viewer.xsl"?> /' $TMP_FILE
	#sed 's/.\{38\}/&<?xml-stylesheet type="text\/\xsl" href="wsdl-viewer.xsl"?>/' $FILE > $TMP_FILE
	#sed 's/.*<?xml version="1.0" encoding="UTF-8"?>.*/&\n<?xml-stylesheet type="text\/\xsl" href="wsdl-viewer.xsl"?>/' $FILE > $TMP_FILE
	mv $TMP_FILE $FILE
done

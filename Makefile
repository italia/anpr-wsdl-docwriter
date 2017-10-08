.PHONY: help wsdl html

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "wsdl	to set WSDL files for making HTML"
	@echo "html	to make standalone HTML files"

wsdl:
	./bin/wsdl.sh


html:
	./bin/html.sh


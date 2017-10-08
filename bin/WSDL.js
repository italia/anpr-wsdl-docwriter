var apiconnWsdl = require("apiconnect-wsdl");
var yaml 	    = require("js-yaml");
var fs          = require("fs");

var argv = require('yargs')
    .usage('Usage: $0 -wsdl [path to WSDL file] -o [Output folder]')
		.describe('wsdl', 'Path to WSDL file')
		.describe('o', 'Output folder')
    .demandOption(['wsdl','o'])
    .argv;

var promise = apiconnWsdl.getJsonForWSDL(argv.wsdl);

promise.then(function(wsdls){

	// Get Services from all parsed WSDLs
	var serviceData = apiconnWsdl.getWSDLServices(wsdls);

	// Loop through all services and genereate yaml file
	for (var  item in serviceData.services) {
		var serviceName = serviceData.services[item].service;
		var wsdlId = serviceData.services[item].filename;
		var wsdlEntry = apiconnWsdl.findWSDLForServiceName(wsdls, serviceName);
		var swagger = apiconnWsdl.getSwaggerForService(wsdlEntry, serviceName, wsdlId);
		fs.writeFile(argv.o+"/"+serviceName+".yaml", yaml.safeDump(swagger))
	}
}, function (error) {
	console.log(error.message)
});

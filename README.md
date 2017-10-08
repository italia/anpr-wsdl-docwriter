# anpr-wsdl-docwriter

A generator of HTML documentation from WSDL files.

# Description

A generator of HTML documentation from WSDL files. It uses available open source projects to convert _.wsdl_ files into _Swagger .yaml_ files that then can be converted to many documents, by automatic model-to-text (M2T) transformations.

The solution is simple and easily extensible, since it based on strong and well supported open source projects: the Swagger Codegenerator are open and easy to customize by Mustache templates. Moreover, stubs and skeleton in any programming languages, based on Swagger codegen, are available.

### Prerequisites

You need to execute the Bash script in an environment where are available:
    1. NodeJS
    2. Java SE

### Running

To run the script just execute

```
    wsdl2html.sh --input /absolutePathTo/myWSDLFile.wsdl --outputFolder /absoluteOutputFolder
```

## Built With

* [Swagger](https://swagger.io/) - The world's most popular API Tooling

## Authors

**Ermanno Battista** (ermanno.battista@gmail.com) and **Fabio Scippacercola** (f.scippacercola@gmail.com) - Software Engineers and PhDs. Working in [IVM Tech](http://ivmtech.it/) and starting  [Fervento.systems](http://fervento.systems).

## Acknowledgments

* This code was developed in the 28-hour of the [Developers Italia Hackathon](https://developers.italia.it) held on the 7-8th October, 2017.

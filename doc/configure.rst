Interprete HTML
===============

Panoramica
----------
Generatore di documentazione HTML navigabile a partire dai WSDL. 
Il tool utilizzato per la trasformazione dei file WSDl in HTML e' reperibile sul sito di `Tom Vanek<http://tomi.vanek.sk/index.php?page=wsdl-viewer>`_, l'autore del interprete.`.

Installazione ed Esecuzione MANUALE
-----------------------------------
1. Scaricare il file `zip<http://tomi.vanek.sk/xml/wsdl-viewer_3-1-02.zip>`_;
2. Estrarre la cartella;
   .. bashcode:: #unzip *wsdl*.zip
3. Copiare la cartella nella in ./bin;
4. Aggiungere la riga di codice ``<?xml-stylesheet type="text/xsl" href="wsdl-viewer.xsl"?>`` subito dopo la riga di codice ``<?xml version="1.0" encoding="utf-8"?>`` 
   La riga di codice va aggiunta solo nei file *.wsdl*, all'interno della directory: *./wdsl/*  ex. **./wdsl/wdsl1000/1000serviziIscrizione.wsdl** 
5. Esseguire il comando
   .. bashcode:: firefox </percorso/wsdl/file>


Installazione ed Esecuzione AUTOMATICA
--------------------------------------
#. E' presente uno script in bash in **./bin/** il quale aggiunge il codice XML sopra indicato, in tutti i file *.wsdl* delle cartelle presenti in **./wsdl/\*/**; 
#. Per avviare il programma spostarsi nella directory della repo ed esseguire il comando ``make wsdl``;
#. Per visualizzare la pagina in HTML, eseguire il comando seguente che fornira' un elenco di tutti i file presenti in **./wsdl/\*/**, permettendo di scegliere cio` che verra` convertito.
   .. bashcode:: make html






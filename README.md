youbike-stations
================

Generate Youbike station Google map usable on Android from the Youbike web site map.

Example:

* https://www.google.com/maps/ms?msa=0&msid=217046930935496807564.0004cc92264e828cd5826

Allows linking to a specific station:

* https://www.google.com/maps/ms?msa=0&msid=217046930935496807564.0004cc92264e828cd5826&iwloc=0004fc280c7b3dcd87519
* https://www.google.com/maps/ms?msa=0&msid=217046930935496807564.0004cc92264e828cd5826&iwloc=0004fc280c7b3dcd87519&z=15

The map can be generated from the latest info about stations and bike availability (see URL below).

The data is transformed into a KML file, which can be imported into Google Maps
(My Places, "create with classic My Maps", Import)

Latest station info
-------------------

* quasi-CSV format (lines split by '|', fields by '_'

This is the best information I have found, but it may be a bit unofficial.
I forget where I found it, but it is referenced in various places.
It may be what the youbike web site uses for its map.

This URL lists all stations in Taipei and New Taipei City
It includes availability of bicycles and spaces.
The information is refreshed frequently (every 5 minutes?)

  http://its.taipei.gov.tw/atis_index/aspx/Youbike.aspx?Mode=1

Perl one-liner to turn the data into a CSV file with semi-colon separators:

  perl -ne 'for (split /\|/) { s/_/;/g; print $_,"\n" }' Youbike.txt > Youbike.csv

Ruby program to process the quasi-CSV:

  https://github.com/hiroshiyui/youbike

Processing it in C++ and Python:

  https://gist.github.com/Chienweichih/8064458

* there's also a URL with JSON, but it's not complete (or dynamic?):

  http://its.taipei.gov.tw/atis_index/data/youbike/youbike.json

* data.taipei

Taipei's "Open Data" initiative also provides data, but it is not very satisfactory.

Information about the data here:

  http://data.taipei/opendata/datalist/datasetMeta?oid=8ef1626a-892a-4218-8344-f7ac46e1aa48

This is the data link:

  http://data.taipei/youbike

That link currently returns a nastily named YouBike.gz file which is actually JSON but only has 196 stations

JSON format documentation:

  http://www.dot.gov.taipei/public/mmo/dot/YouBike_JSON檔案說明(修正版)_局網.pdf
  
  http://www.dot.gov.taipei/public/mmo/dot/YouBike_JSON%E6%AA%94%E6%A1%88%E8%AA%AA%E6%98%8E(%E4%BF%AE%E6%AD%A3%E7%89%88)_%E5%B1%80%E7%B6%B2.pdf

  http://www.dot.taipei.gov.tw/public/mmo/dot/YouBike%E5%BE%AE%E7%AC%91%E5%96%AE%E8%BB%8A%E4%BB%8B%E6%8E%A5%E8%AA%AA%E6%98%8E%E6%96%87%E4%BB%B61030502.pdf

More information
----------------

More info might be findable here:

*  http://data.taipei.gov.tw/opendata
*  http://www.dot.taipei.gov.tw/ct.asp?xItem=3167481&CtNode=44829&mp=117001#1

Youbike web site maps

* http://taipei.youbike.com.tw/en/f11.php
* http://taipei.youbike.com.tw/cht/f11.php

This map is better, but not linkable (click on "YouBike")

* http://its.taipei.gov.tw/atis_index/

genkml.pl
---------

program to download the Youbike station info and convert it to KML that can be imported into Google Maps

https://www.google.com/maps/ms?msa=0&msid=217046930935496807564.0004cc92264e828cd5826


Youbike.txt
-----------

example Youbike station info downloaded from:

http://its.taipei.gov.tw/atis_index/aspx/Youbike.aspx?Mode=1

Youbike.kml
-----------

example generated KML file



OBSOLETE:
========

genxml.sh
---------

command to download the latest youbike station info

youbike_stations.xml
--------------------

example of the youbike station info XML data

parsegenxml.pl
--------------

program to convert the youbike station info to KML that can be imported into Google Maps

youbike_stations.kml
--------------------

example of the generated KML

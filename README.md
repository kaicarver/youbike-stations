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

(includes availability of bicycles and spaces, refreshed every 5 minutes?)

* quasi-CSV format (lines split by '|', fields by '_'

  http://its.taipei.gov.tw/atis_index/aspx/Youbike.aspx?Mode=1

Ruby program to process the quasi-CSV:

  https://github.com/hiroshiyui/youbike

and processsing it in C++ and Pythong:

  https://gist.github.com/Chienweichih/8064458

* there's also a URL with JSON, but it's not complete (or dynamic?):

  http://its.taipei.gov.tw/atis_index/data/youbike/youbike.json

JSON format documentation:

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

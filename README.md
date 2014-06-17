youbike-stations
================

Generate Youbike station Google map usable on Android from the Youbike web site map.
Example: https://www.google.com/maps/ms?msa=0&msid=217046930935496807564.0004cc92264e828cd5826

This needs to be redone based on this data:

Can get the latest info about stations and bike availability here:

JSON:
  http://its.taipei.gov.tw/atis_index/data/youbike/youbike.json
JSON format documentation:
  http://www.dot.taipei.gov.tw/public/mmo/dot/YouBike%E5%BE%AE%E7%AC%91%E5%96%AE%E8%BB%8A%E4%BB%8B%E6%8E%A5%E8%AA%AA%E6%98%8E%E6%96%87%E4%BB%B61030502.pdf

quasi-CSV format (lines split by '|', fields by '_'
  http://its.taipei.gov.tw/atis_index/aspx/Youbike.aspx?Mode=1

Ruby program to process the quasi-CSV:
  https://github.com/hiroshiyui/youbike
and processsing it in C++ and Pythong:
  https://gist.github.com/Chienweichih/8064458

More info might be findable here:
  http://data.taipei.gov.tw/opendata
  http://www.dot.taipei.gov.tw/ct.asp?xItem=3167481&CtNode=44829&mp=117001#1

Youbike web site maps
  http://taipei.youbike.com.tw/en/f11.php
  http://taipei.youbike.com.tw/cht/f11.php
This map is better, but not linkable *click on YouBikw
  http://its.taipei.gov.tw/atis_index/


JSON format doc:

YouBike 微笑單車介接說明文件 
 103.5.2 版 
 
YouBike 微笑單車資訊提供各場站基本資料（如站名、行政區、地點、 
經緯度座標等）及即時可借車輛數、可停空位數。詳細資料欄位如下： 
iid ItemId 
sv 場站狀態 0.暫停營運 1.正式啟用 
sd 啟用時間 yyyyMMddhhmmss EX. “20120326132314” 
vtyp 版本別 Ex. “1”.目前 
sno 場站代號 Ex.”0002” 
sna 場站名稱 Ex. “捷運國父紀念館站” 
sip 場站 IP Ex. “192.168.1.101” 
tot 場站的總停車格 Ex. “38” 
sbi 場站的目前車輛數 Ex. “23” 
sarea 場站區域 EX. “信義區” 
mday 資料更新時間 yyyyMMddhhmmss EX. “20120426132314” 
lat 經度 Ex. “25.0408388889” 
lng 緯度 Ex. “121.567894444” 
ar 地址 EX. “復興南路 2 段 235 號” 
sareaen 場站區域英文名稱 EX. “Xinyi Dist.” 
snaen 場站英文名稱 Ex. “MRT S.Y.S Memorial Hall Stataion” 
aren 英文地址 EX. “No.235, Sec. 2, Fusing S. Rd.” 
nbcnt 擋板數量 EX, “2” 
bemp 空位數量 EX, “12” 
act 禁用狀態 EX, “0”.禁用 “1”.正常 
 
 範例: 
(成功回應值) 
{"retCode":"1","retVal":[{"iid":"1","sv":"1","sd":"20000101000000","vtyp":"1","sn
o":"0001","sna":"捷運市政府站
","sip":"10.250.1.1","tot":"180","sbi":"88","sarea":"信義區
","mday":"20120804182000","lat":"25.0408388889","lng":"121.567894444","ar
":"捷運市政府站--","sareaen":"Xinyi Dist.","snaen":"MRT Taipei City Hall 
Stataion","aren":"Intersection in 
"},{…},{"iid":"56","sv":"1","sd":"20120725000000","vtyp":"1","sno":"0041","sna":
"中研公園","sip":"","tot":"30","sbi":"10","sarea":"南港區
","mday":"20120725000000","lat":"25.047425","lng":"121.613706","ar":"中研公
園--","sareaen":"Nangang Dist.","snaen":"Academia Park","aren":"Intersection 
in ","nbcnt":"2","bemp":"12",”act”:”1”}]}

Government data URLs:

公車類
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=busdata1
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=busdata2
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=busevent1
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=busevent2
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=carinfo1
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=carinfo2
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=carunusual
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=estimatetime1
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=estimatetime2
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=istop
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=istoppath
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=orgpathattribute
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=parameter
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=pathdetail1
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=pathdetail2
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=provider
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=route1
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=route2
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=semitimetable1
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=semitimetable2
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=stop1
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=stop2
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=stop3
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=timetable1
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=timetable2
停車類
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=allavailable
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=alldescription
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=alldescriptions
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=certain
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=certaindescription
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=certainnumber
路況類
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=CFG
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=CMS
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=VD
http://its.taipei.gov.tw/atis_index/data/get.aspx?xml=VDDATA
YouBike 微笑單車
http://its.taipei.gov.tw/atis_index/data/youbike/youbike.json

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

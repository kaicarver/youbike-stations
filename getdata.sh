# Get the Youbike station data and import it into the database
if [ 1 = 1 ] ; then
    echo get the data from the Youbike site HTML pages...
    curl -s http://taipei.youbike.com.tw/cht/f11.php > map_cht.html
    curl -s http://taipei.youbike.com.tw/en/f11.php  > map_en.html
else
    echo do not download data from Youbike site, use cached version
fi

echo extract the data from the HTML file...
egrep '^\s*siteContent' map_cht.html                                        >  stations.js
egrep '^\s*siteContent' map_en.html  | sed 's/siteContent/siteContentEn/g'  >> stations.js

echo generate SQL commands, well something for now...
node parse.js > stations.formatted.js
echo `grep sno stations.formatted.js | wc -l` stations

# run SQL script to import data into the db...

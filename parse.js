// make Youbike station data usable

require('./stations.js')

var area_id = {
		'板橋區' : 1,
		'北投區' : 2,
		'大安區' : 3,
		'大同區' : 4,
		'蘆洲區' : 5,
		'南港區' : 6,
		'內湖區' : 7,
		'三重區' : 8,
		'士林區' : 9,
		'樹林區' : 10,
		'松山區' : 11,
		'泰山區' : 12,
		'淡水區' : 13,
		'土城區' : 14,
		'萬華區' : 15,
		'文山區' : 16,
		'五股區' : 17,
		'新店區' : 18,
		'信義區' : 19,
		'新莊區' : 20,
		'汐止區' : 21,
		'鶯歌區' : 22,
		'永和區' : 23,
		'中和區' : 24,
		'中山區' : 25,
		'中正區' : 26
};
// TODO: add English translation of area names

var i = 0;
for (var key in siteContent) {
  if (siteContent.hasOwnProperty(key)) {
    var station = siteContent[key];
    var stationEn = siteContentEn[key];
    station.sareaen = stationEn.sarea;
    station.snaen = stationEn.sna;
    station.aren = stationEn.ar;
    i++;
  }
}

// usage:
//   node parse.js 0183
//   node parse.js > stations.formatted.js
if (typeof(process.argv[2]) != 'undefined') {
  console.log(JSON.stringify(siteContent[process.argv[2]], null, ' '));
} else {
  console.log(JSON.stringify(siteContent, null, ' '));  
}

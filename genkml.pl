# Produce KML for Google Maps from YouBike API
use strict;
use warnings;
use v5.10;
use open ':std', ':encoding(UTF-8)';
use Data::Dumper;
use LWP::Simple;
use Time::Piece;

my $now = localtime->strftime('%d/%m/%Y');

my $stations_url = "http://its.taipei.gov.tw/atis_index/aspx/Youbike.aspx?Mode=1";
#my $content = get($stations_url);
my $contentx = <<'END';
0002_捷運國父紀念館站(2號出口)_48_10_大安區_25.041_121.556945_忠孝東路四段/光復南路口(西南側)_Daan Dist._MRT S.Y.S Memorial Hall Stataion(Exit 2.)_Sec,4. Zhongxiao E.Rd/GuangFu S. Rd_|0003_台北市政府_40_25_信義區_25.0377972_121.565169_台北市政府東門(松智路) _Xinyi Dist._Taipei City Hall_Taipei City Government Eastgate (Song Zhi Road)_|0004_市民廣場_60_23_信義區_25.0360361_121.562325_市府路/松壽路(西北側) _Xinyi Dist._Citizen Square_The N.W. side of Road Shifu & Road Song Shou._|
END

$/ = undef;
my $content = <>;
die "Couldn't get it!" unless defined $content;
#print $content;
my @stations = split /\|/, $content;
pop @stations;
my $num_stations = @stations;

my $i = 0;
print <<END;
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://earth.google.com/kml/2.2">
<Document>
  <name>Taipei YouBike bicycle-sharing stations</name>
  <description><![CDATA[All $num_stations stations retrieved on $now from the YouBike API $stations_url
The official map is a little hard to use. This one makes it easy to get directions to any station.]]></description>
END

my @field_names_clear = qw/Number	Name	Total	Available	Area	Latitude	Longitude	Address	AreaEn	NameEn	AddressEn/;
my @field_names = qw/sno sna tot sbi sarea lat lng ar sareaen snaen aren/;
for my $station (@stations) {
  my @fields = 
  my %station;
  @station{@field_names} = split /_/, $station;
  my $m = \%station;
  my $xmlstr = <<END;
  <Placemark>
    <name>$m->{sna}</name>
    <Snippet>$m->{ar}</Snippet>
    <description><![CDATA[$m->{sna}<br>
$m->{ar}<br>
$m->{snaen}<br>
$m->{aren}]]></description>
    <Point>
      <coordinates>$m->{lng},$m->{lat},0.000000</coordinates>
    </Point>
  </Placemark>
END
  $xmlstr =~ s/Stataion/Sta./g;
  $xmlstr =~ s/Sta\.?\(/Sta. (/g;
  $xmlstr =~ s/Sta\.Exit (\d)/Sta. (Exit $1)/g;

  print $xmlstr;
  #last if $i++ > 60;
}
print <<END;
</Document>
</kml>
END

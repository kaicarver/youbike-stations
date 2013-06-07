# Produce KML for Google Maps from XML data on the YouBike web site
# The XML data is accessible here:
#   http://www.youbike.com.tw/genxml9.php?lat=25.037525&lng=121.56378199999995&radius=5&mode=0
use strict;
use warnings;
use v5.10;
use open ':std', ':encoding(UTF-8)';
use XML::Simple;
use Data::Dumper;

my $xml = new XML::Simple;
my $data = $xml->XMLin('youbike_stations.xml');
my $i = 0;
print <<END;
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://earth.google.com/kml/2.2">
<Document>
  <name>Taipei YouBike bicycle-sharing stations</name>
  <description><![CDATA[All the stations from the YouBike site.
Their map is a little hard to use. This one makes it possible to get directions on the Google Maps Android app.]]></description>
END
for my $name (sort keys %{$data->{marker}}) {
  #say "name: $name";
  my $m = {};
  $m->{name} = $name;
  for my $key (sort keys %{$data->{marker}->{$name}}) {
    #say "  ", $key, ": ", $data->{marker}->{$name}->{$key};
    $m->{$key} = $data->{marker}->{$name}->{$key};
  }
  my $xmlstr = <<END;
  <Placemark>
    <name>$m->{name}</name>
    <Snippet>$m->{address}</Snippet>
    <description><![CDATA[$m->{name}<br>
$m->{address}<br>
$m->{nameen}<br>
$m->{addressen}]]></description>
    <Point>
      <coordinates>$m->{lng},$m->{lat},0.000000</coordinates>
    </Point>
  </Placemark>
END
  $xmlstr =~ s/Stataion/Sta./g;
  $xmlstr =~ s/Sta\.?\(/Sta. (/g;
  $xmlstr =~ s/Sta\.Exit (\d)/Sta. (Exit $1)/g;

  print $xmlstr;
  #last if $i++ > 0;
}
print <<END;
</Document>
</kml>
END

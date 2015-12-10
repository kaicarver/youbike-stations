# Generate HTML for one Youbike station from the file with all stations

# usage: perl genhtml.pl station_number date Youbike.csv

my @values = ();
my $i = 1;
my $seq = shift;
my $date = shift;
#$date = localtime;

#print "seq=$seq\n";

<>;
while (<>) {
  chomp;
  s/\r//;
  s/\'/\'\'/g;
  my @a=split/;/;
  my ($label,$name,$total,$available,$area,$lat,$lng,$address,$area_en,$name_en,$address_en) = @a;
  my $spaces = $total - $available;
  #print "seq=$seq i=$i\n";
  if ($i != $seq) {
    $i = $i+1;
  } else {
    print <<END;
<!DOCTYPE html>
<html>
<head>
<title>$name - $name_en : Youbike Station $label</title>
<script
src="http://maps.googleapis.com/maps/api/js">
</script>

<script>
var myCenter=new google.maps.LatLng($lat,$lng);

function initialize()
{
var mapProp = {
  center:myCenter,
  zoom:16,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker=new google.maps.Marker({
  position:myCenter,
  });

marker.setMap(map);
var infowindow = new google.maps.InfoWindow({
  content:"$available bikes; $spaces spaces <br>(on $date)"
  });

infowindow.open(map,marker);

}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>

<body>
<p>Youbike station $label : $name / $name_en
<p>$area - $address / $address_en - $area_en</p>
<p>$available bicycles, $spaces spaces (on $date)</p>

<div id="googleMap" style="width:500px;height:380px;"></div>

<p><a href="index.html">All Youbike stations</a></p>
</body>
</html>
END
    exit;
  }
}

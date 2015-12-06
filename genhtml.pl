# Generate SQL for loading up all the stations

# usage: perl gensql.pl Youbike.csv

my @values = ();
my $i = 1;
my $seq = shift;
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
<title>Youbike station $label $name - $name_en</title>
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
  content:"$name_en : $available bikes; $spaces spaces"
  });

infowindow.open(map,marker);

}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>

<body>
<p>Youbike Station Name: $name_en (Station No: $label) <a href="">中文</a></p>
<p>Bikes: $available available, $spaces spaces, $total total</p>
<p>Area: $area_en</p>
<p>Address: $address_en</p>

<div id="googleMap" style="width:500px;height:380px;"></div>
</body>
</html>
END
    exit;
  }
}

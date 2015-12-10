# Generate HTML for all Youbike stations from the fie with all stations

$filename = 'Youbike.csv';

($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$mtime,$ctime,$blksize,$blocks)
  = stat($filename);

$date = localtime $mtime;
$date =~ s/(\d\d:\d\d):\d\d (\d\d\d\d)/$2, $1/; # but time at end and remove seconds
$date =~ s/  / /; #remove extra spaces


for (1..422) {
  print <<END;
<a href="$_.html">$_</a> /
END
  $cmd = qq{perl genhtml.pl $_ "$date" $filename > youbike/stations/$_.html};
  print $cmd, "\n";
  #`$cmd`;
}


for (1..422) {
  print <<END;
<a href="$_.html">$_</a> /
END
  `perl genhtml.pl $_ "Sunday Dec 6, 2015 at 13:33" Youbike.csv > youbike/stations/$_.html`;
}

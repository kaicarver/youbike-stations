
for (1..422) {
  print <<END;
<a href="$_.html">$_</a> /
END
  `perl genhtml.pl $_ Youbike.csv > youbike/stations/$_.html`;
}

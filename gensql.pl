# Generate SQL for loading up all the stations

# usage: perl gensql.pl Youbike.csv

my %area_id = (
		'板橋區' => 1,
		'北投區' => 2,
		'大安區' => 3,
		'大同區' => 4,
		'蘆洲區' => 5,
		'南港區' => 6,
		'內湖區' => 7,
		'三重區' => 8,
		'士林區' => 9,
		'樹林區' => 10,
		'松山區' => 11,
		'泰山區' => 12,
		'淡水區' => 13,
		'土城區' => 14,
		'萬華區' => 15,
		'文山區' => 16,
		'五股區' => 17,
		'新店區' => 18,
		'信義區' => 19,
		'新莊區' => 20,
		'汐止區' => 21,
		'鶯歌區' => 22,
		'永和區' => 23,
		'中和區' => 24,
		'中山區' => 25,
		'中正區' => 26,
);

<>;

my @values = ();
while (<>) {
  chomp;
  s/\r//;
  s/\'/\'\'/g;
  my @a=split/;/;
  my $area_id = $area_id{$a[4]};
  push @values, "('$a[0]', '$a[1]', $a[2], $a[3], $area_id, $a[5], $a[6], '$a[7]', '$a[9]', '$a[10]')";
}
my $values = join(",\n        ", @values);
print <<END;
INSERT INTO station (label, name, total, available, area_id, lat, lng, address, name_en, address_en) VALUES
        $values;
END


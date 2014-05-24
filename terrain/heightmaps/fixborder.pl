#!/usr/bin/perl -w
#
# fixborder.pl -- normalize border of height map to a fixed height

use Getopt::Long;

$opt_border = 5;
$opt_height = 5;

GetOptions('border=f'=>\$opt_border, 'height=f'=>\$opt_height);

$cols = -1;

while($_ = <>) {
    @row = split(/\s/, );
    if ($cols == -1) {
	$cols = @row;
	# print "Setting columns to ", $cols, "\n";
    }
    elsif ($cols != @row) {
	die "inconsistent number of elements in rows.\n";
    }

    $heightmap[$rows++] = [ @row ];
}

for ($i = 0; $i < $opt_border; $i++) {
    for ($j = 0; $j < $cols; $j++) {
	$heightmap[$i][$j] = ($opt_height * ($opt_border - $i) +
	                      $heightmap[$i][$j] * $i) / $opt_border;
    }
}

for ($i = $rows - $opt_border; $i < $rows; $i++) {
    for ($j = 0; $j < $cols; $j++) {
	$heightmap[$i][$j] = ($heightmap[$i][$j] * ($rows - $i-1) +
	                       $opt_height * ($opt_border - ($rows-$i-1))) 
	                       / $opt_border;
    }
}

for ($i = 0; $i < $rows; $i++) {
    for ($j = 0; $j < $opt_border; $j++) {
	$heightmap[$i][$j] = ($opt_height * ($opt_border - $j) +
	                      $heightmap[$i][$j] * $j) / $opt_border;
    }
}

for ($i = 0; $i < $rows; $i++) {
    for ($j = $cols - $opt_border; $j < $cols; $j++) {
	$heightmap[$i][$j] = ($heightmap[$i][$j] * ($cols - $j-1) +
	                       $opt_height * ($opt_border - ($cols-$j-1))) 
	                       / $opt_border;
    }
}

dumpmap();

sub dumpmap
{
    for (my $i = 0; $i < $rows; $i++) {
	for (my $j = 0; $j < $cols; $j++) {
	    printf "%0.3f ", $heightmap[$i][$j];
	}
	print "\n";
    }
    print "\n";
}

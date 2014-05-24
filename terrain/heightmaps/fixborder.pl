#!/usr/bin/perl -w
#
# fixborder.pl -- normalize border of height map to a fixed height

use Getopt::Long;
use List::Util qw(min);

$opt_border = 5;
$opt_height = 5;
$opt_fuzzy = 0;

GetOptions('border=f'=>\$opt_border, 'height=f'=>\$opt_height, 'fuzzy=i' =>\$opt_fuzzy);

$cols = -1;

while($_ = <>) {
    @row = split(/\s/, );
    if ($cols == -1) {
	$cols = @row;
	# print "Setting columns to ", $cols, "\n";
    }
    elsif (scalar @row != 0 && $cols != @row) {
	die "inconsistent number of elements in rows.\n";
    }

    $heightmap[$rows++] = [ @row ];
}

# for ($i = 0; $i < $opt_border; $i++) {
#     for ($j = 0; $j < $cols; $j++) {
# 	if ($j > $opt_border && $j < $cols - $opt_border) {
# 	    $heightmap[$i][$j] = ($opt_height * ($opt_border - $i) +
# 				  $heightmap[$i][$j] * $i) / $opt_border;
# 	}
#     }
# }

for ($i = 0; $i < $rows; $i++) {
    for ($j = 0; $j < $cols; $j++) {
	$proximity = $cols;
	$proximity = min($i, $j, $rows - $i, $cols - $j);

	if ($proximity < $opt_border + rand($opt_fuzzy)) {
	    $heightmap[$i][$j] = sqrt(($heightmap[$i][$j]**2 * ($proximity)
				  + $opt_height**2 * (($opt_border - $proximity)))
				  / $opt_border);
	}
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

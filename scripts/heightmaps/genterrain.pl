#!/usr/bin/perl -w
#
# genterrain.pl -- create fractal terrain in form of height map using the 
#                  diamond-square algorithm

use Getopt::Long;

# $opt_scale is used as a scaling factor for random perturbations. Specifically,
# we generate a random number between -1 * $opt_scale and 1 * $opt_scale during
# the first round of the algorithm (reducing range thereafter).
$opt_scale = 1;

# $opt_skip is used to determine how many rounds of the algorithm to skip,
# keeping the values in the initial heightmap. This can be used to seed with
# specific terrain features.
$opt_skip = -1;

GetOptions('scale=f' =>\$opt_scale, 'skip=i' => $opt_skip);

$rows = 0;
$cols = -1;

#
# Pull in initial heightmap
#
while ($_ = <>) {
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

#
# Apply Diamond-Square algorithm
#

if ($cols != $rows) {
    die ("input heightmap must be square and power of two plus one on a side.\n");
}

for ($i = ($opt_skip > 0) ? $opt_skip + 1 : 0; 2**$i < ($cols-1); $i++) {
    # print "Round ", $i, "\n";

    $dist = ($cols - 1) / (2**$i);

    # Diamond step
    for ($j = 0; $j < 2**$i; $j++) {
	for ($k = 0; $k < 2**$i; $k++) {
	    $sum = $heightmap[$j * $dist][$k * $dist] +
		$heightmap[$j * $dist][($k+1) * $dist] +
		$heightmap[($j+1) * $dist][$k * $dist] +
		$heightmap[($j+1) * $dist][($k+1) * $dist];

	    $heightmap[$j * $dist + $dist/2][$k * $dist + $dist/2] =
		$sum / 4 + ((rand(2.0) - 1) * $opt_scale) / 2**$i;
	}
    }

    # Square step
    for ($j = 0; $j <= 2**($i+1); $j++) {
	$ypos = $j * $dist / 2;

	for ($k = 0; $k < 2**($i) + ($j % 2); $k++) {
	    $contrib = 0;
	    $sum = 0;
	    $xpos = $k * $dist + (($j+1) % 2) * $dist / 2;

	    # print "x = ", $xpos, ", y = ", $ypos, "\n";
	    
	    if ($xpos != 0) {
		$sum += $heightmap[$ypos][$xpos - $dist/2];
		$contrib++;
	    }
	    if ($xpos < $cols - 1) {
		$sum += $heightmap[$ypos][$xpos + $dist/2];
		$contrib++;
	    }
	    if ($ypos != 0) {
		$sum += $heightmap[$ypos - $dist/2][$xpos];
		$contrib++;
	    }
	    if ($ypos < $rows -1 ) {
		$sum += $heightmap[$ypos + $dist/2][$xpos];
		$contrib++;
	    }
	    $heightmap[$ypos][$xpos] = $sum / $contrib + 
		((rand(2.0) - 1.0) * $opt_scale) / 2**$i;
	}
    }

}
dumpmap();

#
#
#
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

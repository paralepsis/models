#!/usr/bin/perl -w
#
# genterrain.pl -- create fractal terrain in form of height map using the 
#                  diamond-square algorithm

use Getopt::Long;

# $opt_scale is used as a scaling factor for random perturbations. Specifically,
# we generate a random number between -1 * $opt_scale and 1 * $opt_scale during
# the first round of the algorithm (reducing range thereafter).
$opt_scale = 30.0;

# $opt_skip is used to determine how many rounds of the algorithm to skip,
# keeping the values in the initial heightmap. This can be used to seed with
# specific terrain features.
$opt_skip = -1;

$opt_cols = 129;

$opt_radius = 50.0;

$opt_seed = time();

$opt_hill = 0;

GetOptions('scale=f' =>\$opt_scale,
           'skip=i' => $opt_skip,
           'cols=i' => $opt_cols,
           'radius=f' => $opt_radius,
           'seed=f' => $opt_seed,
           'hill=f' => $opt_hill,);

$cols = $opt_cols;
$rows = $cols;

$minRad = $opt_radius * 0.6;

srand($opt_seed);

#
# Generate an initial heightmap
#
for ($i = 0; $i < $rows; $i++) {
    for ($j = 0; $j < $cols; $j++) {
	$heightmap[$i][$j] = $opt_radius;
    }
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
dumpPoly();

#
# Steps:
# - Selects a row from the map, 
# - Converts to a circular form using height as radius, and
# - dumps it as an openscad polygon.
#
sub dumpPoly
{
    $i = $rows / 2;

    if ($opt_hill > 0) {
	printf "linear_extrude(height = %0.3f, center=false, convexity = 10, \$fn= \$cols, scale=0.75)\n\t", $opt_hill;
    }

    printf "polygon(points=[";
    for (my $j = 0; $j < $cols; $j++) {
        $angle = 2*3.14159 * $j / $cols; # radians

        if ($heightmap[$i][$j] < $minRad) { $heightmap[$i][$j] = $minRad; }

        printf "[%0.3f, %0.3f], ",
	    $heightmap[$i][$j] * cos($angle), $heightmap[$i][$j] * sin($angle);
    }

    printf "]);\n";

}



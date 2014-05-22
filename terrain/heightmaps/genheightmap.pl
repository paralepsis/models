#!/usr/bin/perl -w
#
# genheightmap.pl -- create a blank heightmap of specified size (in elements)

use Getopt::Long;

$opt_rows = 10;
$opt_cols = 10;
$opt_height = 10;
$bonus = 0;

GetOptions('rows=i' => \$opt_rows,
	   'cols=i' => \$opt_cols,
	   'height=f' => \$opt_height,
	   'wave=f{2}' => \@opt_wave,
	   'peak=f{2}' => \@opt_peak,
	   'random=f' => \$opt_random,
	   'xgrad=f{2}' => \@opt_xgrad);

for ($i = 0; $i < $opt_rows; $i++) {
    for ($j = 0; $j < $opt_cols; $j++) {
	if (defined $opt_random) {
            $bonus = rand($opt_random);	
	}

	if (defined $opt_xgrad[0]) {
	    printf "%0.3f ", $opt_xgrad[0] * ((($opt_cols-1) - $j) / ($opt_cols-1)) + $opt_xgrad[1] * (1 - ((($opt_cols-1) - $j) / ($opt_cols-1))) + $bonus;
	}
	elsif (defined $opt_wave[0]) {
	    printf "%0.3f ", $opt_wave[0] * (abs((($opt_cols -1)/2 - ($j))) / (($opt_cols-1)/2)) +
				$opt_wave[1] * (1 - (abs((($opt_cols-1)/2 - ($j))) / (($opt_cols-1)/2))) +
                                $bonus;
	}
	elsif (defined $opt_peak[0]) {
	    $proximity = (($j < $opt_cols / 2) ? $j : $opt_cols - $j - 1) +
			 (($i < $opt_rows / 2) ? $i : $opt_rows - $i - 1);
	    printf "%0.3f ", $opt_peak[0] + 2 * ($opt_peak[1] - $opt_peak[0]) * $proximity / ($opt_rows + $opt_cols)
                             + $bonus;
	}
	else {
	    printf "%0.3f ", $opt_height + $bonus;
	}

    }
    print "\n";
}

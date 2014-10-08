#!/usr/bin/perl -w
#
# height2scad.pl -- create an OpenSCAD polyhedral from a height map

use Getopt::Long;

$opt_min = 0.00001;
$opt_max = 9999999;

GetOptions('xdim=f' => \$opt_xdim, 'ydim=f' => \$opt_ydim,
	   'min=f' => \$opt_min, 'max=f' => \$opt_max,
	   'module=s' =>\$opt_module);

$rows = 0;
$cols = -1;

while ($_ = <>) {
    @row = split(/\s/, );

    if ($cols == -1) {
	$cols = scalar @row;
	# print "Setting columns to ", $cols, "\n";
    }
    elsif ($cols != scalar @row && scalar @row != 0) {
	die "height2scad.pl: inconsistent number of elements in rows.\n";
    }


    if (scalar @row > 0) {
        for ($j = 0; $j < @row; $j++) {
	    if ($row[$j] < $opt_min) { $row[$j] = $opt_min; }
	    if ($row[$j] > $opt_max) { $row[$j] = $opt_max; }
    	}

    	$heightmap[$rows++] = [ @row ];
    }
}

# print "Columns = ", $cols, "; Rows = ", $rows, "\n";

if (!defined $opt_xdim) { $opt_xdim = $cols; }
if (!defined $opt_ydim) { $opt_ydim = $rows; }

if (defined $opt_module) {
    print "module ", $opt_module, "() {\n";
}

#
# Dump the polyhedron
#
print "   polyhedron( points = [\n";

#
# Print the polyhedron points, scaling to specified dimensions
#
# Note: Points are printed alternating between top surface and
#       corresponding bottom surface point.
#
for ($i = 0; $i < $rows; $i++) {
    for ($j = 0; $j < $cols; $j++) {
	printf("      [%0.3f, %0.3f, %0.3f],\n", 
	       $j / ($cols - 1) * $opt_xdim,
	       $i / ($rows - 1) * $opt_ydim,
	       $heightmap[$i][$j]
	    );
	printf("      [%0.3f, %0.3f, 0.0],\n", 
	       $j / ($cols - 1) * $opt_xdim,
	       $i / ($rows - 1) * $opt_ydim
	    );
    }
}

print "      ],\n      faces = [\n";

#
# Print the faces (triangles) for the top and bottom surfaces
#
for ($i = 0; $i < $rows-1; $i++) {
    for ($j = 0; $j < $cols-1; $j++) {
	# Top face
	printf("      [%d, %d, %d], \n",
	       2 * $cols * $i       + 2 * ($j + 1),
	       2 * $cols * $i       + 2 * $j,
	       2 * $cols * ($i + 1) + 2 * $j
	    );
	printf("      [%d, %d, %d], \n",
	       2 * $cols * ($i + 1) + 2 * ($j + 1),
	       2 * $cols * $i       + 2 * ($j + 1),
	       2 * $cols * ($i + 1) + 2 * $j
	    );
	# Bottom face
	printf("      [%d, %d, %d], \n",
	       2 * $cols * ($i + 1) + 2 * $j + 1,
	       2 * $cols * $i       + 2 * $j + 1,
	       2 * $cols * $i       + 2 * ($j + 1) + 1
	    );
	printf("      [%d, %d, %d], \n",
	       2 * $cols * ($i + 1) + 2 * $j + 1,
	       2 * $cols * $i       + 2 * ($j + 1) + 1,
	       2 * $cols * ($i + 1) + 2 * ($j + 1) + 1
	    );
    }
}

#
# Print the faces (triangles) for the sidewalls in the X dimension
#
printf("      /* X dimension faces */\n");
for ($j = 0; $j < $cols-1; $j++) {
    # Triangles along Y axis
    printf("      [%d, %d, %d], \n",
	   2 * $cols * 0 + 2 * $j + 1,
	   2 * $cols * 0 + 2 * $j,
	   2 * $cols * 0 + 2 * ($j + 1) + 1
	);
    printf("      [%d, %d, %d], \n",
	   2 * $cols * 0 + 2 * ($j + 1) + 1,
	   2 * $cols * 0 + 2 * $j,
	   2 * $cols * 0 + 2 * ($j + 1)
	);

    # Triangles along last row
    printf("      [%d, %d, %d], \n",
	   2 * $cols * ($rows - 1) + 2 * ($j + 1) + 1,
	   2 * $cols * ($rows - 1) + 2 * $j,
	   2 * $cols * ($rows - 1) + 2 * $j + 1
	);
    printf("      [%d, %d, %d], \n",
	   2 * $cols * ($rows - 1) + 2 * ($j + 1),
	   2 * $cols * ($rows - 1) + 2 * $j,
	   2 * $cols * ($rows - 1) + 2 * ($j + 1) + 1
	);
}

#
# Print the faces (triangles) for the sidewalls in the Y dimension
#
printf("      /* Y dimension faces */\n");
for ($i = 0; $i < $rows-1; $i++) {
    # Triangles along X axis
    printf("      [%d, %d, %d], \n",
	   2 * $cols * ($i + 1),
	   2 * $cols * $i,
	   2 * $cols * $i + 1
	);
    printf("      [%d, %d, %d], \n",
	   2 * $cols * ($i + 1),
	   2 * $cols * $i + 1,
	   2 * $cols * ($i + 1) + 1
	);

    # Triangles along last column
    printf("      [%d, %d, %d], \n",
	   2 * ($cols - 1) + 2 * $cols * $i,
	   2 * ($cols - 1) + 2 * $cols * ($i + 1),
	   2 * ($cols - 1) + 2 * $cols * ($i + 1) + 1
	);
    printf("      [%d, %d, %d], \n",
	   2 * ($cols - 1) + 2 * $cols * $i + 1,
	   2 * ($cols - 1) + 2 * $cols * $i,
	   2 * ($cols - 1) + 2 * $cols * ($i + 1) + 1
	);
}

print "      ]);\n";

if (defined $opt_module) {
    print "}\n";
}

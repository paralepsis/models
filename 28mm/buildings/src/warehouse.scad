/* warehouse.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 *
 */

use <building.scad>

translate([270,70,155/2]) cube(size=[240, 153, 155], center=true);

building(b1Dims, b1Windows, b1Doors);

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
b1Dims = [127, // xdim
	     100, // ydim
	     65, // height
	     7, // wall thickness
	     4]; // floor/roof thickness

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
b1Windows = [[[0, 30, 0], [0,0,-90]],
		    [[0, 70, 0], [0,0,-90]],
		    [[90,93,0], [0,0,0]],
		   ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
b1Doors = [[[40, 93, 0], [0,0,0], [1,0,0]],
	   	  [[120, 50, 0], [0,0,-90], [0,0,0]],
          ];

/* cinderblockPattern()
 *
 * Note: taken from cinderblocks.scad
 */
module cinderblockPattern() {
    height = 120;
    width = 145;
    cinderblockHeight = 4;
    cinderblockWidth = 2 * cinderblockHeight;

    for (row = [0 : floor(height / cinderblockHeight)]) {
        translate([0, 0, row * cinderblockHeight]) {
            rotate([0, 90, 0]) cylinder($fn=15, r=mortarRad, h=width);

            for (col = [ 0 : floor(width / cinderblockWidth) - 1]) {
                translate([col * cinderblockWidth + (row % 2) * cinderblockWidth / 2, 0, 0]) cylinder($fn=15, r=mortarRad, h=cinderblockHeight);
            }
        }
    }
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */

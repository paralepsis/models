/* favela-ruins-1.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 */
use <building.scad>
use <damage/bigSlice.scad>
use <cinderblocks.scad>

/******** GENERATE THE BUILDING ********/

difference() {
    building(b1Dims, b1Windows, b1Doors,
                doBackWall = false,
                doRemovableBackWall = false,
		doEars = false);

    /* deform the building */
    translate([10,-4,255]) rotate([0,145,90]) bigSlice();
    translate([103,-40,255]) rotate([0,128,90]) translate([-30,0,0]) bigSlice();
    translate([0,-230,8]) rotate([-90,0,20]) bigSlice();
    translate([99,35.5,-45]) rotate([0,0,90]) quickCinderblockPatch(adjust=4);
    translate([163.5,99,-45]) rotate([0,0,180]) quickCinderblockPatch(adjust=0);
}

/******** BUILDING ARRAY DEFINITIONS ********/

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
b1Dims = [100, // xdim
	     100, // ydim
	     62, // height
	     7, // wall thickness
	     4]; // floor/roof thickness

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
b1Windows = [[[0, 70, 0], [0,0,-90]]];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
b1Doors = [[[60, 93, 0], [0,0,0], [1,0,0]],
          ];


/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */

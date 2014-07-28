/* favela-ruins-2.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 */
use <building.scad>
use <bigCube.scad>
use <cinderblocks.scad>

mirror([1,0,0]) 
render() difference() {
    translate([-50,-50,0]) render () building(b1Dims, b1Windows, b1Doors,
                doBackWall = false,
                doRemovableBackWall = false,
		doEars = false);

    /* deform building */
    rotate([-145,0,45]) translate([-118.5,-128.5,-290]) bigCube();
    rotate([0,0,90]) {
      translate([49,-14.5,-8.5]) rotate([0,0,90])
          quickCinderblockPatch(adjust=4);
      translate([113.5,49,-8.5]) rotate([0,0,180])
          quickCinderblockPatch(adjust=0); // was -1
    }
}

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
b1Dims = [100, // xdim
	     100, // ydim
	     45, // height, short because we're just going to deform it
	     7, // wall thickness
	     4]; // floor/roof thickness

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
b1Windows = [];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
b1Doors = [ ];

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */
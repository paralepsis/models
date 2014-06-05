/* buildings.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 */

use <building.scad>
use <stairs.scad>

translate([169,78,69]) rotate([0,0,180]) color("red")
	import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");

/* Basic building using parameters below */
building(b1Dims, b1Windows, b1Doors);

// translate([152.4,0,0]) stairs(stairCt=8,stairHt=9);
translate([152.4,0,0,])
    easyStairs(stairsLen = 100, stairsHt = 69, stairsWidth = 40);

/* Add some stairs! */
/*
translate([152.4+40,3,0])rotate([0,0,180]) mirror([0,1,0])
	stairs(stairsLength=97,
		stairWidth=40, 
		stairsHeight=69,  // accounts for a 4 thickness floor on top
		stairLength = 19, 
		floorThick=4, 
		topLandingLength = 20, 
		bottomLandingLength = 0,
		sidewallHt = 20,
		doSidewall = true,
		doEndwall = true);
*/
/* Add ears to stair corners */
// translate([152.4+37,5,.15]) cylinder(r=9,h=0.3,center=true);
// translate([152.4+40,100,.15]) cylinder(r=7,h=0.3,center=true);

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
b1Dims = [152.4, // xdim
	     100, // ydim
	     65, // height
	     7, // wall thickness
	     4, // floor/roof thickness
		1]; // ears

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
		  [[123,0,0], [0,0,0], [1,0,0]]
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

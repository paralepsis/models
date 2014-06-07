/* building-1.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

use <building.scad>

/* First Floor Room A */
building(firstFloorADims,
	firstFloorAWindows,
	firstFloorADoors);

/* First Floor Room B */
translate([100,0,0])
	building(dims = firstFloorBDims,
		windows = firstFloorBWindows,
		doors = firstFloorBDoors);

/******** FIRST FLOOR ROOM A ********/

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
firstFloorADims = [100, // xdim
	     100, // ydim
	     65, // height
	     7, // wall thickness
	     4, // floor/roof thickness
	     0]; // not currently used

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
firstFloorAWindows = [[[0, 30, 0], [0,0,-90]],
		    [[0, 70, 0], [0,0,-90]],
		    [[70,93,0], [0,0,0]],
		   ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
firstFloorADoors = [[[30, 93, 0], [0,0,0], [1,0,0]],
	   	  [[93, 50, 0], [0,0,-90], [0,0,0]],
          ];

/******** FIRST FLOOR ROOM B ********/

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
firstFloorBDims = [100, // xdim
	     127, // ydim
	     65, // height
	     7, // wall thickness
	     4, // floor/roof thickness
	     0]; // not currently used

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
firstFloorBWindows = [[[93, 42, 0], [0,0,-90]],
		    [[93, 88, 0], [0,0,-90]],
		    [[50,120,0], [0,0,0]],
		   ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
firstFloorBDoors = [[[0, 50, 0], [0,0,-90], [0,0,0]],
		  [[40,0,0], [0,0,0], [1,0,0]],
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



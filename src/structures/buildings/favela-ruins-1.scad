use <building.scad>
use <bigCube.scad>

difference() {
    building(b1Dims, b1Windows, b1Doors,
                doBackWall = false,
                doRemovableBackWall = false,
		doEars = false);

    translate([0,55,0]) rotate([-130,0,-35]) translate([-128.5,-128.5,-300]) bigCube();
}

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
b1Windows = [[[93, 70, 0], [0,0,-90]]];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
b1Doors = [[[40, 93, 0], [0,0,0], [1,0,0]],
          ];

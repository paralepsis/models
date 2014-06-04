use <building.scad>
use <first-floor-4x6.scad>

earThick = 0.3;

/* Basic building using parameters below */
secFloorBuilding(b2Dims, b2Windows, b2Doors);

module secFloorBuilding(dims = [0,0,0,0,0,0], windows = [], doors = []) {
	assign(xDim = dims[0],
		  yDim = dims[1], 
		  wallHeight = dims[2],
		  wallThick = dims[3], 
		  floorThick = dims[4],
		  doEars = dims[5],
		  notchFudge = 0.5)
	{
		difference() {
			/* Main Structures */
			union() {
				/* walls */
				linear_extrude(height=wallHeight)
					buildingWalls(xDim = xDim, yDim = yDim);

				/* patio walls (quick and dirty) */
				cube([152.4,wallThick,20 + floorThick]);
				translate([xDim,0,0]) cube([52.4,wallThick + notchFudge,20 + floorThick]);
				translate([0,yDim - wallThick,0])
					cube([152.4,wallThick,20 + floorThick]);
				translate([152.4 - wallThick, 0, 0]) 
					cube([wallThick, 60, 20 + floorThick]);

				/* floor
                   * Note: xDim is wallThick longer than usual to strech to stairs.
				 */
				translate([wallThick,wallThick + notchFudge,0])
					tiledFloor(roofXDim = 152.4 - 1 * wallThick,
							  roofYDim = 100 - 2 * wallThick - notchFudge,
							  thick = floorThick);

				/* ears */
				if (doEars) {
					translate([0,0,earThick/2])
						cylinder(r=wallThick, h=earThick,center=true);
					translate([xDim,0,earThick/2])
						cylinder(r=wallThick, h=earThick,center=true);
					translate([0,yDim,earThick/2])
						 cylinder(r=wallThick, h=earThick,center=true);
					translate([xDim,yDim,earThick/2])
						cylinder(r=wallThick, h=earThick,center=true);
				}
				/* Add ears to stair corners */
				translate([152.4,0,.15]) cylinder(r=7,h=0.3,center=true);
				translate([152.4,100,.15]) cylinder(r=7,h=0.3,center=true);
			}
			/* Subtract Back Wall (and little slice to right) */
			linear_extrude(height=wallHeight)
				buildingBackWall(xDim = xDim, yDim = yDim, fudge=false);
			translate([xDim, 0,0.3])
				cube([notchFudge, wallThick-3, wallHeight]);

			/* Subtract Windows */
			for (win = windows) {
				translate(win[0]) rotate(win[1]) window(doWindow=true);
			}
			/* Subtract Doors */
			for (door = doors) {
				translate(door[0]) rotate(door[1]) door(doDoor=true, doFrame = door[2][0]);
			}
		} /* difference */

		/* Add in back wall, subtract out doors and windows again */
		difference() {
			linear_extrude(height=wallHeight)
				buildingBackWall(xDim = xDim, yDim = yDim, fudge=true);

			/* Subtract Windows */
			for (win = windows) {
				translate(win[0]) rotate(win[1]) window(doWindow=true);
			}
			/* Subtract Doors */
			for (door = doors) {
				translate(door[0]) rotate(door[1]) door(doDoor=true, doFrame = door[2][0]);
			}
		}

		/* Add back in windows and door frames */
		for (win = windows) {
			translate(win[0]) rotate(win[1]) window(doWindow=false);
		}
		for (door = doors) {
			translate(door[0]) rotate(door[1]) door(doDoor=false, doFrame = door[2][0]);
		}

	} /* assign */
}

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
b2Dims = [100, // xdim
	     100, // ydim
	     65, // height
	     7, // wall thickness
	     4, // floor/roof thickness
		1]; // ears

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
b2Windows = [[[0, 30, 0], [0,0,-90]],
		    [[0, 70, 0], [0,0,-90]],
		    [[30,93,0], [0,0,0]],
		    [[70,93,0], [0,0,0]]
		   ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
b2Doors = [[[100,30,0], [0,0,90], [1,0,0]]
          ];



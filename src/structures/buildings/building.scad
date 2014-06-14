/* building.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 */

/******** GLOBAL PARAMETERS ********/

/* wall/roof parameters
 */
wallThick = 7;    // thickness (mm) of exterior walls
wallHeight = 65;  // height (mm) of exterior walls
roofThick = 4;    // height (mm) of roof and/or floors
epsilon = 0.001;  // occasionally used to ensure that things overlap

/* ear parameters -- control how corners are tacked down to build plate
 */
earThick = 0.6;            // thickness (mm) of corner ears
earRadius = wallThick + 4; // radius (mm) of corners ears

/* notch parameters -- control how the back wall fits into the sides
 */
notchLen = 3; // length of the notch (mm) parallel to back wall
notchWidth = 2; // thickness of the notch (mm) in the back wall
notchFudge = 0.5; // amount of material to cut away around the notch

/* marine -- this simply drops a Space Marine in the model for reference.
 */
// translate([34,48,5]) rotate([0,0,180]) color("red")
//  import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");

/******** BUILD SOMETHING ********/
building(dims = b1Dims, windows = b1Windows, doors = b1Doors);

// rotate([0,0,90]) translate([-35,-100,0]) stairs();

newstairs();

/******** DEFINE EXAMPLE BUILDING ********/

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness, do ears].
 */
b1Dims = [100, // xdim
	  127, // ydim
	  65, // height
	  7, // wall thickness
	  4, // floor/roof thickness
	  0]; // unused

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
b1Windows = [[[93, 42, 0], [0,0,-90]],
	     [[93, 88, 0], [0,0,-90]],
	     [[50,120,0], [0,0,0]],
	     ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
b1Doors = [[[0, 50, 0], [0,0,-90], [0,0,0]],
	   [[40,0,0], [0,0,0], [1,0,0]],
	   ];

/******** CONSTRUCT BUILDING ********/

module building(dims = [0,0,0,0,0,0],
		windows = [],
		doors = [],
		doEars = true,
		doBackWall = true,
		doRemovableBackWall = true,
		tiledFloor = true)
{
    assign(xDim = dims[0],
	   yDim = dims[1], 
	   wallHeight = dims[2],
	   wallThick = dims[3], 
	   floorThick = dims[4]) {
	difference() {
	    /* Main Structures */
	    union() {
		/* walls */
		linear_extrude(height=wallHeight)
		    buildingWalls(xDim = xDim, yDim = yDim);
		
		/* floor */
		if (tiledFloor && doRemovableBackWall) {
		    translate([wallThick,wallThick + notchFudge,0])
			tiledFloor(roofXDim = xDim - 2 * wallThick,
				   roofYDim = yDim - 2 * wallThick - notchFudge,
				   thick = floorThick);
		}
		else if (tiledFloor) /* and no removable back wall */ {
		    translate([wallThick,wallThick,0])
			tiledFloor(roofXDim = xDim - 2 * wallThick,
				   roofYDim = yDim - 2 * wallThick,
				   thick = floorThick);
		}
		else if (!tiledFloor && doRemovableBackWall) {
		    /* plain floor (no tiles) */
		    translate([wallThick, wallThick + notchFudge, 0])
			cube([xDim - 2 * wallThick,
			      yDim - 2 * wallThick - notchFudge,
			      floorThick],
			      center=false);
		}
		else /* not tiled, not removable back wall */ {
		    /* plain floor (no tiles) */
		    translate([wallThick, wallThick, 0])
			cube([xDim - 2 * wallThick,
			      yDim - 2 * wallThick,
			      floorThick],
			      center=false);
		}

		/* ears */
		if (doEars) {
		    translate([0,0,earThick/2])
			cylinder(r=earRadius, h=earThick,center=true);
		    translate([xDim,0,earThick/2])
			cylinder(r=earRadius, h=earThick,center=true);
		    translate([0,yDim,earThick/2])
			cylinder(r=earRadius, h=earThick,center=true);
		    translate([xDim,yDim,earThick/2])
			cylinder(r=earRadius, h=earThick,center=true);
		}
	    }

            if (doBackWall && doRemovableBackWall) {
	        /* Subtract Back Wall */
	        linear_extrude(height=wallHeight)
		    buildingBackWall(xDim = xDim, yDim = yDim, fudge=false);
            }
	    else if (!doBackWall) {
		translate([wallThick, 0, roofThick])
		    cube([xDim - 2 * wallThick,
                          wallThick,
                          wallHeight - roofThick]);
	    }
	    /* else leave the back wall in place */
	    
	    /* Subtract Windows */
	    for (win = windows) {
		translate(win[0]) rotate(win[1]) window(doWindow=true);
	    }
	    /* Subtract Doors */
	    for (door = doors) {
		translate(door[0]) rotate(door[1]) door(doDoor=true, doFrame = door[2][0]);
	    }
	} /* difference */

        if (doBackWall) {	
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


/******** WALL MODULES ********/

module buildingWalls(xDim = 0, yDim = 0) {
    difference() {
	square([xDim, yDim]);
	translate([wallThick, wallThick, 0])
	    square([xDim - 2*wallThick, yDim - 2*wallThick]);
    }
}


module buildingBackWall(xDim = 0, yDim = 0, fudge = true) {
    assign(bwFudge = (fudge) ? notchFudge : 0,
	   backWallThick = wallThick,
	   widthAroundNotch = ((fudge) ? wallThick - 
			       (2* notchFudge + notchWidth) :
			       wallThick - notchWidth)/2) {

	/*
	  Back Wall Polygon:
	  
	  7   _____________________________________ 6
	  8   |_  9                            4 _| 5
	  11 ____| 10                          3 |____ 2
	     |_______________________________________|
	     0                                          1

	*/

	polygon(points = [[0,0], [xDim,0], [xDim, widthAroundNotch],
			  [xDim - wallThick - notchLen - bwFudge, widthAroundNotch], // 3
			  [xDim - wallThick - notchLen - bwFudge, // 4
			   backWallThick - widthAroundNotch], // 5
			  [xDim - wallThick - bwFudge,  // 6
			   backWallThick - widthAroundNotch], // 7
			  [xDim - wallThick - bwFudge, backWallThick], // 8
			  [wallThick + bwFudge, backWallThick],
			  [wallThick + bwFudge,
			   backWallThick - widthAroundNotch],
			  [wallThick + notchLen + bwFudge, 
			   backWallThick - widthAroundNotch],
			  [wallThick + notchLen + bwFudge, widthAroundNotch],
			  [0, widthAroundNotch]],
		paths = [[0,1,2,3,4,5,6,7,8,9,10,11,0]]);
    }
}


/******** FLOOR MODULES ********/

/* tiledFloor() -- creates a floor with 1cm^2 tiles raised to height
 *                 thick (mm)
 */
module tiledFloor(roofXDim = 0,
                  roofYDim = 0, 
                  thick = 0)
{
    /* create a base floor slightly lower than specified thickness */
    cube([roofXDim,roofYDim,thick-0.5], center=false);

    /* add "tiles" on top of base floor from above */
    intersection() {
	cube([roofXDim, roofYDim, thick]);
	for (i = [0:(floor(roofXDim / 10)+1)]) {
	    for (j = [0:(floor(roofYDim/10)+1)]) {
		translate([10*i,10*j,0]) cube([9.6,9.6,thick], center=false);
	    }
	}
    }
}

/******** WINDOW MODULES ********/

/* window() -- Creates a single window at given height, aligned with X axis,
 *			 with center back edge at  [x=0, y=0]
 *
 * Note:
 * doWindow --  specifies if the window should be cut out or not. This is
 *              used (i.e., set to true) when "diffing" windows out of walls.
 */
module window(windowWidth=30, windowHeight=20, doWindow=true)
{
    heightFromFloor = 25;
    frameHeight = 3;
    frameWidth = windowWidth + 4;
    frameThick = wallThick + 3;
    
    /* Horizontal frame above and below */
    translate([-1 * frameWidth/2,
	       -1 * (frameThick - wallThick)/2, 
	       heightFromFloor - frameHeight + roofThick]) 
	cube([frameWidth, frameThick, frameHeight]);
    translate([-1 * frameWidth/2, 
	       -1 * (frameThick - wallThick)/2, 
	       heightFromFloor + windowHeight + roofThick]) 
	cube([frameWidth, frameThick, frameHeight]);
    
    /* Window itself */
    if (doWindow) {
	translate([-1 * windowWidth/2, 0 -epsilon/2, heightFromFloor + 
		   roofThick]) 
	    cube([windowWidth, wallThick + epsilon, windowHeight]);
    }
}

/******** DOOR MODULES ********/

/* door() -- creates a single door with given width/height, aligned with the
 *           x axis, with center back edge at [x=0, y=0].
 *
 * Notes:
 * doDoor --  specifies if the door should be cut out or not. This is
 *            used (i.e., set to true) when "diffing" doors out of walls.

 */
module door(doorWidth=32, doorHeight=45, doDoor=true, doFrame=true)
{
    heightFromFloor = 0;
    frameHeight = 3;
    frameWidth = doorWidth + 4;
    frameThick = wallThick + 3;

    /* Horizontal frame above door */
    if (doFrame) {
	translate([-1 * frameWidth/2,
		   -1 * (frameThick - wallThick)/2,
		   doorHeight + roofThick])
	    cube([frameWidth, frameThick, frameHeight]);
    }

    /* Door itself */
    if (doDoor) {
	translate([-1 * doorWidth/2, 0 - epsilon/2, heightFromFloor + roofThick])
	    cube([doorWidth, wallThick + epsilon, doorHeight]);
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

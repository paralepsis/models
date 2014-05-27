
/* NOTE: yDim calculations are goofed because I am not accounting for the additional space
 *       taken up along the Y dimension resulting from the back wall bit.
 */

translate([34,48,5]) rotate([0,0,180]) import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");

xDim = 0;
yDim = 0;

wallThick = 7;
wallHeight = 65;
roofThick = 4;

notchLen = 3; // amount notch protrudes back perpendicular to wall to which it is attached
notchWidth = 2; // width of the notch protrusion

notchFudge = 0.5; // fudge factor to account for slop in printer, either side
minSafeWidth = 2.5; // don't let back wall corners get smaller than this

backWallThick = min((2*minSafeWidth + notchFudge) + notchWidth, wallThick);
widthAroundNotch = (backWallThick - (2 * notchFudge + notchWidth)) / 2;

epsilon = 0.001;

building(dims = b1Dims, windows = b1Windows, doors = b1Doors);

// rotate([0,0,90]) translate([-35,-100,0]) stairs();


/******** DEFINE BUILDING ********/

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
b1Dims = [100, // xdim
	     127, // ydim
	     65, // height
	     7, // wall thickness
	     4]; // floor/roof thickness

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

module building(dims = [0,0,0,0], windows = [], doors = []) {
	assign(xDim = dims[0],
		  yDim = dims[1], 
		  wallHeight = dims[2],
		  wallThick = dims[3], 
		  floorThick = dims[4])
	{
		difference() {
			/* Main Structures */
			union() {
				linear_extrude(height=wallHeight)
					buildingWalls(xDim = xDim, yDim = yDim);
				translate([wallThick,wallThick + notchFudge,0])
					tiledFloor(roofXDim = xDim - 2 * wallThick,
							  roofYDim = yDim - 2 * wallThick - notchFudge,
							  thick = floorThick);
			}
			/* Subtract Back Wall */
			linear_extrude(height=wallHeight)
				buildingBackWall(xDim = xDim, yDim = yDim, fudge=false);

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


/******** WALL MODULES ********/

module buildingWalls(xDim = xDim, yDim = yDim) {
	difference() {
		square([xDim, yDim]);
		translate([wallThick, wallThick, 0]) square([xDim - 2*wallThick, yDim - 2*wallThick]);
	}
}


module buildingBackWall(xDim = xDim, yDim = yDim, fudge = true) {

assign(bwFudge = (fudge) ? notchFudge : 0,
	  backWallThick = wallThick,
	  widthAroundNotch = ((fudge) ? wallThick - (2* notchFudge + notchWidth):
			wallThick - notchWidth)/2)
{

/*
Back Wall Polygon:

  7   _____________________________________ 6
  8   |_  9                            4 _| 5
 11 ____| 10                          3 |____ 2
    |_______________________________________|
   0                                          1

*/

polygon(
	points = [[0,0], [xDim,0], [xDim, widthAroundNotch],
			  [xDim - wallThick - notchLen - bwFudge, widthAroundNotch],
			  [xDim - wallThick - notchLen - bwFudge, 
			   backWallThick - widthAroundNotch],
			  [xDim - wallThick - bwFudge, 
			   backWallThick - widthAroundNotch],
			  [xDim - wallThick - bwFudge, backWallThick],
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

module tiledFloor(roofXDim = xDim - 2 * wallThick,
                  roofYDim = yDim - (wallThick + backWallThick + notchFudge), 
                  thick=roofThick)
{
    cube([roofXDim,roofYDim,thick-0.5], center=false);
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
 */
module window(windowWidth=30,windowHeight=20,doWindow=true)
{
	heightFromFloor = 21;
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
		translate([-1 * windowWidth/2, 0 -epsilon/2, heightFromFloor + roofThick]) 
			cube([windowWidth, wallThick + epsilon, windowHeight]);
	}
}

/******** DOOR MODULES ********/

/* door()
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

/******** STAIR MODULES ********/

/* stairs() - build a set of stairs with a landing at the top
 *
 * Note: 
 * - stairsLength includes the top and bottom landings.
 * - bottom landing will be respected, top landing may grow.
 * - railing will extend above height of top of stairs by sidewallHt.
 * - height doesn't do anything special to take a roof into account.
 * - incut is considered as part of stairLength
 */
module stairs(stairsLength=100,
			stairWidth=35, 
			stairsHeight=65, 
			stairLength = 19, 
			floorThick=4, 
			topLandingLength = 0, 
			bottomLandingLength = 0,
			sidewallHt = 20,
			doSidewall = true,
			doEndwall = true)
{
	incut = 5; // Amount that stairs are incut at the bottom

	/* See if additional space is needed at top landing. */
	endwallSpace = (doEndwall) ? wallThick : 0;
	addtlTopLanding = max(endwallSpace,
					    topLandingLength + endwallSpace - stairLength);

	stairCt = floor((stairsLength - addtlTopLanding - bottomLandingLength - incut) / stairLength);
	stairHt = (stairsHeight - floorThick) / stairCt;
	topLandingRealLength = stairsLength - stairCt * stairLength - bottomLandingLength;

	rotate([90,0,90])	linear_extrude(height = stairWidth) {
		for (i = [1 : stairCt]) {
			translate([incut,0,0])
			polygon(points = [[(i-1)*stairLength + bottomLandingLength,
							 0], 
						    [(i-1)*stairLength + bottomLandingLength, 
							(i-1) * stairHt + floorThick],
						    [-1 * incut + (i-1)*stairLength + bottomLandingLength, 
							i * stairHt + floorThick], 
						    [i * stairLength + bottomLandingLength, 
							i * stairHt + floorThick],
						    [i * stairLength + bottomLandingLength, 
							0]],
				    paths = [[0,1,2,3,4,0]]);
		}
	}

	/* Fill in region for top landing */
	translate([0, stairsLength - topLandingRealLength, 0])
		cube([stairWidth,
			  topLandingRealLength,
			  stairsHeight]);

	if (doSidewall) {
		/* Add the sidewall */
		rotate([90,0,90]) linear_extrude(height = wallThick) {
			polygon(points = [[max(bottomLandingLength - incut,0),0],
				    			[max(bottomLandingLength - incut, 0), 
							 sidewallHt + floorThick + stairHt],
							[stairLength * (stairCt-1) + bottomLandingLength,
							 sidewallHt + stairsHeight],
							[stairsLength, 
							 sidewallHt + stairsHeight],
							[stairsLength, 0]],
				    paths = [[0,1,2,3,4,5,0]]);
		}
	}
	if (doEndwall) {
		translate([0,stairsLength - wallThick,0]) cube([stairWidth, wallThick, stairsHeight + sidewallHt]);
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
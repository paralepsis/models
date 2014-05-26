
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

translate([-35,0,0]) stairs();

/* stairs() - build a set of stairs with a landing at the top
 *
 * Note: stairsLength includes the top and bottom landings.
 */
module stairs(stairsLength=100,
			stairWidth=35, 
			stairsHeight=65, 
			stairLength = 22, 
			floorThick=4, 
			topLandingLength = 0, 
			bottomLandingLength = 10)
{
	incut = 4; // Amount that stairs are incut at the bottom

	stairCt = floor((stairsLength - topLandingLength - floorThick - bottomLandingLength) / (stairLength - incut));
	stairHt = (stairsHeight - floorThick) / stairCt;

	echo(stairCt,stairHt);


	rotate([90,0,90])	linear_extrude(height = stairWidth) {
		for (i = [1 : stairCt]) {
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

	translate([0, stairLength * stairCt + bottomLandingLength, 0])
		cube([stairWidth,
			  max(topLandingLength, 
				 stairsLength - stairCt * stairLength - bottomLandingLength),
			  stairsHeight]);
	
}

/******** DEFINE BUILDING ********/

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
b1Dims = [100, // xdim
	     100, // ydim
	     65, // height
	     7, // wall thickness
	     4]; // floor/roof thickness

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
b1Windows = [[[0, 30, 0], [0,0,-90]],
		    [[0, 70, 0], [0,0,-90]],
		    [[70,93,0], [0,0,0]],
		   ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
b1Doors = [[[30, 93, 0], [0,0,0], [1,0,0]],
	   	  [[93, 50, 0], [0,0,-90], [0,0,0]],
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

			/* Subtract Windows and Doors */
			for (win = windows) {
				translate(win[0]) rotate(win[1]) window(doWindow=true);
			}
			/* Subtract Doors */
			for (door = doors) {
				translate(door[0]) rotate(door[1]) door(doDoor=true, doFrame = door[2][0]);
			}
		} /* difference */

		/* Add back in windows, door frames, and back wall */
		for (win = windows) {
			translate(win[0]) rotate(win[1]) window(doWindow=false);
		}
		for (door = doors) {
			translate(door[0]) rotate(door[1]) door(doDoor=false, doFrame = door[2][0]);
		}
		linear_extrude(height=wallHeight)
			buildingBackWall(xDim = xDim, yDim = yDim, fudge=true);
	} /* assign */
}


/******** WALL MODULES ********/

module buildingWalls(xDim = xDim, yDim = yDim) {
	difference() {
		square(xDim, yDim);
		translate([wallThick, wallThick, 0]) square(xDim - 2*wallThick, yDim - 2*wallThick);
	}
}


module buildingBackWall(xDim = xDim, yDim = yDim, fudge = true) {
/*
polygon(
	points = [[0,0], [xDim,0], [xDim, widthAroundNotch],
			  [xDim - wallThick - notchLen - notchFudge, widthAroundNotch],
			  [xDim - wallThick - notchLen - notchFudge, 
			   backWallThick - widthAroundNotch],
			  [xDim - wallThick - notchFudge, 
			   backWallThick - widthAroundNotch],
			  [xDim - wallThick - notchFudge, backWallThick],
			  [wallThick + notchFudge, backWallThick],
			  [wallThick + notchFudge,
			   backWallThick - widthAroundNotch],
			  [wallThick + notchLen + notchFudge, 
			   backWallThick - widthAroundNotch],
			  [wallThick + notchLen + notchFudge, widthAroundNotch],
			  [0, widthAroundNotch]],
	paths = [[0,1,2,3,4,5,6,7,8,9,10,11,0]]);
*/

// widthAroundNotch = (backWallThick - (2 * notchFudge + notchWidth)) / 2;

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

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */
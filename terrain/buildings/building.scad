

/* NOTE: yDim calculations are goofed because I am not accounting for the additional space
 *       taken up along the Y dimension resulting from the back wall bit.
 */

translate([34,48,5]) rotate([0,0,180]) import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");

xDim = 100;
yDim = 100;

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

/******** CONSTRUCT BUILDING ********/

/* Exterior is a vector holding dimensions of the building [X, Y, height].
 */
/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
/* 127mm
windows = [[[0, 40, 0], [0,0,-90]],
		 [[0, 90, 0], [0,0,-90]],
		 [[90,xDim - wallThick,0], [0,0,0]],
		];
*/
windows = [[[0, 30, 0], [0,0,-90]],
		 [[0, 70, 0], [0,0,-90]],
		 [[70,xDim - wallThick,0], [0,0,0]],
		];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
doors = [[[30, xDim - wallThick, 0], [0,0,0], [1,0,0]],
		[[yDim - wallThick, 50, 0], [0,0,-90], [0,0,0]],
        ];

building();

module building() {
	difference() {
		/* Main Structures */
		union() {

			translate([wallThick,backWallThick + notchFudge,0]) tiledFloor();

/*
			translate([0,widthAroundNotch + notchFudge,0])
				linear_extrude(height=wallHeight) buildingWalls();
*/
			translate([0,0,0])
				linear_extrude(height=wallHeight) buildingWalls();
		}
		/* Subtract Back Wall */
		linear_extrude(height=wallHeight) buildingBackWall(fudge=false);

		/* Subtract Windows and Doors */
		for (win = windows) {
			echo(win);
			translate(win[0]) rotate(win[1]) window(doWindow=true);
		}
		/* Subtract Doors */
		for (door = doors) {
			echo(door);
			translate(door[0]) rotate(door[1]) door(doDoor=true, doFrame = door[2][0]);
		}
	}

	/* Add back in windows, door frames, and back wall */
	for (win = windows) {
		translate(win[0]) rotate(win[1]) window(doWindow=false);
	}
	for (door = doors) {
		translate(door[0]) rotate(door[1]) door(doDoor=false, doFrame = door[2][0]);
	}
	linear_extrude(height=wallHeight) buildingBackWall(fudge=true);
}


/******** WALL MODULES ********/

/*

Major Structure Polygon (outdated):

1 ______________________________________ 2
  | __________________________________ |
  | | 7                            6 | |
  | |                                | |
  | |                                | |
  | |                                | |
  | |  8                             | |
  | |_   9                        5 _| |
  |___|                            |___|
 0     10                         4      3
*/

module buildingWalls(xDim = xDim, yDim = yDim) {

/*
	wallsYDim = yDim - (notchWidth + notchFudge);

	polygon(
		points = [[0,0], [0,wallsYDim], [xDim,wallsYDim], [xDim,0],
				  [xDim - wallThick - notchLen, 0],
				  [xDim - wallThick - notchLen, notchWidth],
				  [xDim - wallThick, notchWidth],
				  [xDim - wallThick, wallsYDim - wallThick],
				  [wallThick, wallsYDim - wallThick],
				  [wallThick, notchWidth],
				  [wallThick + notchLen, notchWidth],
				  [wallThick + notchLen, 0]],
		paths = [[0,1,2,3,4,5,6,7,8,9,10,11,12,0]]);

			wallsYDim = yDim;

	polygon(
		points = [[0,0], [0,wallsYDim], [xDim,wallsYDim], [xDim,0],
				  [xDim - wallThick, 0],
				  [xDim - wallThick, wallsYDim - wallThick],
				  [wallThick, wallsYDim - wallThick],
				  [wallThick, 0]],
		paths = [[0,1,2,3,4,5,6,7,0]]);
*/
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
/* stairs.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 */
/******** GLOBALS ********/

/******** STAIR MODULES ********/

stairs2(stairLen=10, stairHt=6, stairWidth = 30, stairCt = 5, incutLen = 10);
stairsSidewall(stairLen=10, stairHt=6, stairWidth = 30, stairCt = 5, incutLen = 10);

module easyStairs(stairsLen, stairsHt, stairsWidth)
{
    ct = floor(stairsHt / 7); // 6 is a decent height for a stair
    stairHt = stairsHt / ct;
    incutLen = 12;

    stairLen = (stairsLen - incutLen) / ct;

    stairs(stairLen = stairLen, stairHt = stairHt, stairWidth = stairsWidth,
	   stairCt = ct, incutLen = incutLen);
}

module stairs(stairLen=12,
	      stairHt=7,
	      stairWidth = 30,
	      stairCt = 5,
	      incutLen = 12)
{
    rotate([90,0,90]) stairsOnly(stairLen=stairLen, stairHt=stairHt,
				 stairWidth = stairWidth, stairCt = stairCt,
				 incutLen = incutLen);
    translate([stairWidth,0,0]) rotate([90,0,90])
	stairsSidewall(stairLen=stairLen, stairHt=stairHt,
		       stairWidth = stairWidth, stairCt = stairCt,
		       incutLen = incutLen);
}

module stairsOnly(stairLen=10, stairHt=7, stairWidth = 30, stairCt = 5, incutLen = 10) 
{
       for (i = [0 : stairCt - 1]) {
       	   translate([i * (stairLen), i * stairHt, 0])
	       stair(stairLen=stairLen, stairHt=stairHt,
		     stairWidth = stairWidth, incutLen = incutLen);
    }
}	      

module stairsSidewall(stairLen = 0, stairHt = 0, stairWidth = 0, stairCt = 0, incutLen = 0, sidewallWidth = 5, sidewallHt = 20) {
    linear_extrude(height = sidewallWidth)
	polygon(points = [[0,0], [0, sidewallHt + stairHt],
			  [(stairCt - 1) * stairLen, sidewallHt + stairCt * stairHt],
			  [stairCt * stairLen + incutLen, sidewallHt + stairCt * stairHt],
			  [stairCt * stairLen + incutLen, (stairCt - 1) * stairHt],
			  [stairLen + incutLen,0]],
		paths = [[0,1,2,3,4,5,0]]);
}

module stair() {
       incutHt = 5;
       bar = 2;

        linear_extrude(height=stairWidth)
              polygon(points = [[incutLen,0],
	      		        [incutLen,incutHt], 
	      		        [0, incutHt],
	      		        [0, stairHt],
				[stairLen+incutLen, stairHt],
				[stairLen+incutLen, 0]],
		      paths = [[0,1,2,3,4,5,0]]);
}

/******** OLD VERSION OF CODE ********/

/* stairs() - build a set of stairs with a landing at the top
 *
 * Note: 
 * - stairsLength includes the top and bottom landings.
 * - bottom landing will be respected, top landing may grow.
 * - railing will extend above height of top of stairs by sidewallHt.
 * - height doesn't do anything special to take a roof into account.
 * - incut is considered as part of stairLength
 */

module OLDstairs(stairsLength=100,
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
	translate([0,stairsLength - wallThick,0])
	    cube([stairWidth, wallThick, stairsHeight + sidewallHt]);
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

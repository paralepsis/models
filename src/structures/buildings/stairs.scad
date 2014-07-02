/* stairs.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 */
/******** GLOBALS ********/
epsilon = 0.001;

/******** STAIR MODULES ********/

module stairwell(swLen,
		 swHeight,
		 stairsWidth,
		 floorThick = 4,
		 sidewallThick = 7)
{
    ct = floor(swHeight/7);

    echo(ct);

    stairHt = swHeight / ct;
    incutLen = 12;
    sidewallHt = 20;

    stairLen = (swLen - incutLen) / ct;

    stairs(stairLen = stairLen,
	   stairHt = stairHt,
	   stairWidth = stairsWidth,
	   stairCt = floor(ct / 2),
	   incutLen = incutLen,
	   sidewallThick = sidewallThick);

    /* position second half of stairwell above first */
    rotate([0,0,180]) color("red") {
		translate([0,
			   -1 * (stairLen * (floor(ct/2)-1)),
		   (ct / 2 - 2) * stairHt + floorThick])
	
	{
	    stairs(stairLen = stairLen,
		   stairHt = stairHt,
		   stairWidth = stairsWidth,
		   stairCt = ct / 2,
		   incutLen = incutLen,
		   sidewallThick = sidewallThick);
	}
    }
}

module easyStairs(stairsLen,
		  extraTopLanding = 0,
		  stairsHt,
		  stairsWidth,
		  floorThick = 4,
		  sidewallThick = 5)
{
    ct = floor(stairsHt / 7); // 6 is a decent height for a stair
    stairHt = stairsHt / ct;
    incutLen = 12;
    sidewallHt = 20;

    stairLen = (stairsLen - incutLen) / ct;

    stairs(stairLen = stairLen,
	   stairHt = stairHt,
	   stairWidth = stairsWidth,
	   stairCt = ct,
	   incutLen = incutLen,
	   sidewallThick = sidewallThick);

    /* Tack on additional landing space */
    if (extraTopLanding > 0) {
	translate([0, stairsLen, stairsHt - floorThick])
	    cube([stairsWidth, extraTopLanding, floorThick]);
	translate([stairsWidth, stairsLen, (ct - 1) * stairHt])
	    cube([sidewallThick,
		  extraTopLanding,
		  stairsHt - (ct - 1) * stairHt + sidewallHt]);
    }

    /* Tack on endwall */
    translate([0,
	       stairsLen + extraTopLanding - sidewallThick,
	       (ct - 1) * stairHt])
	cube([stairsWidth + sidewallThick,
	      sidewallThick, 
	      stairsHt - (ct - 1) * stairHt + sidewallHt]);
}

module stairs(stairLen=12,
	      stairHt=7,
	      stairWidth = 30,
	      stairCt = 5,
	      incutLen = 12,
	      sidewallThick = 0)
{
    rotate([90,0,90]) stairsOnly(stairLen=stairLen, stairHt=stairHt,
				 stairWidth = stairWidth, stairCt = stairCt,
				 incutLen = incutLen);
    if (sidewallThick > 0) {
	translate([stairWidth - epsilon,0,0]) rotate([90,0,90])
	    stairsSidewall(stairLen=stairLen, stairHt=stairHt,
			   stairWidth = stairWidth, stairCt = stairCt,
			   incutLen = incutLen, sidewallWidth = sidewallThick);
    }
}

module stairsOnly(stairLen=10,
		  stairHt=7,
		  stairWidth = 30,
		  stairCt = 5,
		  incutLen = 10) 
{
    for (i = [0 : stairCt - 1]) {
	translate([i * (stairLen), i * stairHt, 0])
	    stair(stairLen=stairLen + epsilon, stairHt=stairHt,
		  stairWidth = stairWidth, incutLen = incutLen);
    }
}	      

module stairsSidewall(stairLen = 0,
		      stairHt = 0, 
		      stairWidth = 0, 
		      stairCt = 0, 
		      incutLen = 0, 
		      sidewallWidth = 5, 
		      sidewallHt = 20)
{
    linear_extrude(height = sidewallWidth + epsilon)
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
    myEpsilon = 0;

    linear_extrude(height=stairWidth)
	polygon(points = [[incutLen,0],
			  [incutLen,incutHt], 
			  [0, incutHt],
			  [0, stairHt],
			  [stairLen+incutLen+myEpsilon, stairHt],
			  [stairLen+incutLen+myEpsilon, 0]],
		paths = [[0,1,2,3,4,5,0]]);
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

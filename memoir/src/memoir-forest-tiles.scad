/* Memoir '44 Tile Set: Forest
 *
 * Copyright (C) Robert B. Ross, 2014.
 *
 * Released under "Creative Commons - Attribution - Share Alike" license.
 *
 * Note: Apologies for the state of this code. It was a learning experience.
 */

// $fa=2;
$fs=0.75;
forestTile2();

forestTile();

module forestBlankTile(height=1.5) {
	/* Memoir '44 tiles are 62mm across (point to point) x 1.5mm high
	 */
	cylinder(r = 62/2, h = height, $fn = 6, center = [0,0]);
}

module evergreenTree(height=10) {
    tops =    [0.5, 1,   1.6, 2.1, 3.2, 4.0, 4.6];
    bottoms = [2.2, 3.2, 4.1, 5.1, 6.1, 6.5, 7.3];
    rnds = rands(-0.05,0.05,14);

    union() 
	for (i = [0:6]) {
	    translate([0,0,height/7*(7-i)])
		scale([0.75+rnds[2*i],0.75+rnds[2*i+1],1])
		cylinder(r1=bottoms[i]/2,r2=tops[i]/2,h=1.4);
	}
}

module evergreenTree2(height=10) {
    tops =    [0.5, 1,   1.6, 2.1, 3.2, 4.0, 4.6];
    bottoms = [2.2, 3.2, 4.1, 5.1, 6.1, 6.5, 7.3];
    rnd = rands(-0.6,0.6,1)[0];

    translate([0,0,rnd]) union() 
	for (i = [0:6]) {
	    translate([0,0,height/7*(7-i)])
		scale([0.75,0.75,1])
		cylinder(r1=bottoms[i]/2,r2=tops[i]/2,h=1.4);
	}
}

module deciduousTree(height=10,project=0) {
    rads = [ 2.5, 2.2, 3.0, 2.5, 1.5, 2.3 ];
    rndx = rands(-2, 2, 6);
    rndy = rands(-2, 2, 6);
    rndz = rands(0, 3, 6);

    // Trunk -- only if we haven't set to project spheres down.
    if (project == 0) {
	cylinder(r1=2, r2=1.5, h=height/3);
    }

    for (i = [0:5]) {
	translate([rndx[i],rndy[i],height/3.5 + rndz[i] + 0.1*i]) sphere(r=rads[i]);
	if (project == 1) {
	    translate([rndx[i],rndy[i],0])
		cylinder(r=rads[i], h=height/3.5 + rndz[i] + 0.1*i);
	}	
    }
}

module evergreenForest() {
    x = [-1, -4, -6,  4,  8, 11, 15, -27, -23, -22, 25, 20, 21,  17,  10,  12,   -18, -10, -11, -16];
    y = [-18, -23, -19, 2, 4, 12, 9, 0,     3, -5,   1, -4, -9, -17, -22, -17, 11,  10,  12,  06];
    h = [8,    7,  8,  7,  6, 8, 8, 7,     7, 8,   7, 8,  6.5,   8,  7,  7.5, 7, 5.5, 8, 8.3];

    for (i = [0:19]) {
	translate([x[i], y[i], 0.4]) scale([0.9,0.9,0.9]) evergreenTree(h[i]);
    }
}

module evergreenForestMore() {
    x = [-20, -14, -16,  14,  18, 17, 21, -19, 10, 23, 22, -20, -18];
    y = [-2, 2, -1, 2, 7, 11, 9, -10, 6, 4, 1, 4, 1];
    h = [8,    7,  8,  7,  6, 8, 8, 7,7.2, 7, 7.4, 6.5, 7.2];

    for (i = [0:12]) {
	translate([x[i], y[i], 0.4]) scale([0.9,0.9,0.9]) evergreenTree(h[i]);
    }
}

module deciduousForest() {
	x = [-10, -13, -16,  4,  8, 11, 15, -7, -3, -2,  15, 5, 7,  17,  10,  12, -1, -10, -11, -16, -13, -9];
	y = [-16, -21, -17, 22, 17, 22, 19, 0,   -6, -9,  1, -4, -9, -7, -12, -7, 23,  17,  22,  16, -7, -11];
	h = [8,    7,  8,  7,  6.5, 8, 8, 7,   6.5, 8,   7, 8,  6.5,   7,  8,  8.2, 7, 6.5, 8, 8, 7, 6];
	p = [0,0,0,0,0,0,0,0,0,1,0,1,1,1,1,1,0,1,0,0,0,0];

	for (i = [0:21]) {
	    translate([x[i], y[i], 1.4]) scale([1,1,1]) deciduousTree(height=h[i], project = p[i]);
	}
}

module deciduousForestMore() {
	x = [1, 4, 6,  0,  8, 1, 5 ,          -2, 2, -4, 5, 0, -5, 3, -7, 0, 10, -1, 17, 15,-4, -8, 5, -6,
-6];
	y = [-6, -11, -7, -12, -17, -15, -22,  4, 7, 9, 11, 13, 18, 18, 5, 0, -2,15, 16, -12, -14, -2,
-15, 20, 12];
	h = [8,    7,  8,  7,  8.5, 8, 8, 8, 8, 7, 7, 8, 7, 7.5, 7, 7.5, 7.7, 8, 7.4, 7.5, 7.7, 7.2, 7.5, 7, 7.5]; 
	p = [1,1,1,1,0,0,0,1,1,1,0,1,0,1,0,1,0,1,0,0,0,0,0,0,1];

	for (i = [0:24]) {
	    translate([x[i], y[i], 1.4]) scale([0.9,0.9,0.9]) deciduousTree(height=h[i], project=p[i]);
	}
}

module radialEvergreenForest(count = 40, seed = 10) {
    angle = rands(0,359,count,seed);
    for (i = [0:count]) {
	rotate([0,0,angle[i]]) translate([i + 1,0,0]) evergreenTree2(height=7.0);
    }
}

module radialDeciduousForest(count=30, seed=20) {
    angle = rands(0,359,count,seed);
    for (i = [0:count]) {
	if (i < 10) {
	    rotate([0,0,angle[i]]) translate([i/1.3 + 1,0,1.0])
		deciduousTree(project=1,height=8);
	}
	else {
	    rotate([0,0,angle[i]]) translate([i/1.3 + 1,0,1.0])
		deciduousTree(project=0,height=8);
	}
    }
}

module miscEvergreens() {
   xyz = [[-11,22,0], [-14,21,0], [-10,20,0], [-8,2,0], [-8,5,0], [-6,-22,0], [-8,-24,0],
          [-24,-5,0], [-21,-6,0], [-23,8,0], [-17,16,0], [15,14,0], [18,14,0], [19,12,0],
          [21,11,0], [-27,0.5,0], [-19,7.5,0]];

   for (loc = xyz) {
	translate(loc) evergreenTree2(height=7.2);
   }
}

module forestTile2() {
    forestBlankTile();

    translate([-15,3,0]) radialEvergreenForest(count=17);
    translate([10,19,0]) radialEvergreenForest(count=5,seed=15);
    translate([-18,12,0]) radialEvergreenForest(count=3,seed=99);
    translate([3.5,-21,0]) radialEvergreenForest(count=11,seed=1);
    translate([-7,-9,0]) radialDeciduousForest(count=18,project=1);
    translate([9,0,0]) radialDeciduousForest(count=21,seed=99); 
    translate([0,9,0]) radialDeciduousForest(count=19,seed=1128);

    /* fill in gaps */
    miscEvergreens();
}

module forestTile() {

	forestBlankTile();

	deciduousForest();
	evergreenForest();
	deciduousForestMore();
	evergreenForestMore();
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


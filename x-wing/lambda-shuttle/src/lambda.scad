/* tie-phantom.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 *
 * TODO:
 *
 */

raft = true;

/* 74mm total length */

/* for reference */
// translate([50,0,0]) import("/Users/rross/git/models/x-wing/tie-fighter/products/tie-fighter.stl");

/* put the whole thing together */
difference() {
    lambda();
    translate([0,0,-3]) cube([60,120,6], center=true);
    connectorInternals();
}

if (raft) {
    /* generate a raft and ears */
    translate([-14, -36, 0]) cylinder($fn=20, h=0.3, r=4);
    translate([14, -36, 0]) cylinder($fn=20, h=0.3, r=4);
    hull() {
        translate([-6, -62, 0]) cylinder($fn=20, h=0.3, r=4);
        translate([6, -62, 0]) cylinder($fn=20, h=0.3, r=4);
        translate([-7, -42, 0]) cylinder($fn=20, h=0.3, r=4);
        translate([7, -42, 0]) cylinder($fn=20, h=0.3, r=4);
    }
}

/******** LAMBDA MODULES ********/

module lambda() {
    translate([0,0,6*1.2]) scale([1.2,1.2,1.2]) {
	cockpit();
	body();
	topFin();
	sideFin();
	mirror([1,0,0]) sideFin();
    }
}

module cockpit() {
    /* note: this is a little quick-and-dirty using hull() */
    translate([0,-33,1]) 
    rotate([-15,0,180]) scale([1.1,1.2,1.2]) 
    hull() {
	translate([0,0,3.5]) rotate([-7,0,0]) linear_extrude(height=0.1)
	    polygon(points=[[-4.75,0], [-3.5,16], [3.5,16], [4.75,0]],
		    paths=[[0,1,2,3,0]]);

	linear_extrude(height=0.1)
	    polygon(points=[[-7,0], [-5,16], [5,16], [7,0]],
		    paths=[[0,1,2,3,0]]);
	
	translate([0,0,-2.5]) rotate([4,0,0]) linear_extrude(height=0.1)
	    polygon(points=[[-5,0], [-4,12], [4,12], [5,0]],
		    paths=[[0,1,2,3,0]]);

	translate([0,-4,0]) rotate([90,0,0])
	linear_extrude(height=0.1)
	    polygon(points = [[-7,0], [-5,2.75], [5,2.75], [7,0], [5,-2], [-5,-2]],
		    paths = [[0,1,2,3,4,5,0]]);

	}

}

module body() {
    /* curved bottom sides of body */
    hull() {
	translate([-12,0,-2.99]) rotate([90,0,0]) cylinder($fn=20,r=3,h=30);
	translate([12,0,-2.99]) rotate([90,0,0]) cylinder($fn=20,r=3,h=30);
    }

    /* middle region of body */
    rotate([90,0,0]) linear_extrude(height=30)
	polygon(points= [[0,0], [9,0], [7,6], [-7,6], [-9,0]],
		paths = [[0,1,2,3,4,5,0]]);

    /* upper region of body */
    translate([-3,-16,5.99]) rotate([90,0,90])
    linear_extrude(height=6) polygon(points = [[16,0], [-6,0], [-1,3], [16,3]],
	    paths = [[0,1,2,3,0]]);

    /* little side cylinders */
    translate([-9,-14,0.5]) rotate([90,0,0]) cylinder($fn=20,r=1.5,h=14);
    translate([9,-14,0.5]) rotate([90,0,0]) cylinder($fn=20,r=1.5,h=14);

    /* gun emplacements on end of bottom region */
    translate([12,-30,-3]) rotate([90,0,0]) cylinder($fn=20,r1=2,r2=1,h=3);
    translate([-12,-30,-3]) rotate([90,0,0]) cylinder($fn=20,r1=2,r2=1,h=3);

    /* engines */
    rotate([90,0,0]) for (i = [0:1]) {
	mirror([i,0,0])
	difference() {
	    hull() {
		translate([11.5,-3,-1]) cylinder($fn=20,r=2.2,h=1.1);
		translate([3.5,-3,-1]) cylinder($fn=20,r=2.2,h=1.1);
	    }
	    hull() {
		translate([11,-2.75,-1.01]) cylinder($fn=20,r=1.6,h=1.1);
		translate([4,-2.75,-1.01]) cylinder($fn=20,r=1.6,h=1.1);
	    }		
	}
    }
}

module topFin() {
    translate([-0.35,-35,8.98])
	rotate([90,0,90]) {
	linear_extrude(height=0.7) 
   	   polygon(points=[[2,0], [38,0], [32,40], [15,40], [-3,8]],
		   paths = [[0,1,2,3,4,0]]);

	/* panels */
	translate([0,0,-0.35]) {
	    linear_extrude(height=1.4)
		polygon(points=[[2.2,1], [-2,8], [20,8], [20,1]],
			paths = [[0,1,2,3,0]]);

	    linear_extrude(height=1.4)
		polygon(points=[[-0.8,9], [16,39], [20,39], [20,9]],
			paths = [[0,1,2,3,0]]);

	    linear_extrude(height=1.4)
		polygon(points=[[21,1], [21,12], [35.3,12], [37,1]],
			paths = [[0,1,2,3,0]]);

	    linear_extrude(height=1.4)
		polygon(points=[[21,13], [21,39], [31.1,39], [35,13]],
			paths = [[0,1,2,3,0]]);
	}
    }

    /* three small supports at bottom of fin */
    for (i=[0:2]) {
	translate([0,-11+2.7*i,8.99])
	    rotate([90,0,0])
	    linear_extrude(height=1)
	    polygon(points=[[-2,0], [2,0], [0.8,5], [-0.8,5]],
		    paths = [[0,1,2,3,0]]);
    }
}

module sideFin() {
    translate([12.2,0,-3.2])
    rotate([0,-100,0]) 
    translate([9.8,0,-5.7]) rotate([0,0,-90])
    detachedSideFin();
}

/* detachedSideFin() 
 *
 * Notes:
 * - The small angled bit has been adjusted to have a length (8.2 values in
 *   polygon) that intersects with the body of the Lambda, for printing in
 *   this fixed position. If you want to have separable side fins, then you
 *   should change these back to 8.0 and diff them out of the body (actually
 *   you would probably need to thicken the cylinders too...would be worth a
 *   parameter to this module).
 */
module detachedSideFin() {
    /* main fin */
    linear_extrude(height=0.7)
	polygon(points = [[0,0], [0,40], [17,40], [30,0]],
		paths = [[0,1,2,3,0]]);

    /* panels */
    translate([0,0,-0.35]) {
	linear_extrude(height=1.4)
	    polygon(points=[[1.5,10], [1.5,39], [10,39], [10,10]],
		    paths=[[0,1,2,3,0]]);

	linear_extrude(height=1.4)
	    polygon(points=[[12,10], [12,39], [16,39], [25,10]],
		    paths =[[0,1,2,3,0]]);
 
	linear_extrude(height=1.4)
	    polygon(points =[[1.5,1], [1.5,9], [25.5,9], [28,1]],
		    paths = [[0,1,2,3,0]]);
    }

    /* small angled bit */
    rotate([-30,0,0]) {
	linear_extrude(height=0.7)
	    polygon(points = [[0,0], [0,-8.4], [30,-8.4], [30,0]],
		    paths = [[0,1,2,3,0]]);

	/* cylinder gun emplacements */
	translate([27,-4,0]) cylinder($fn=20,h=1.75,r=3.2);

	/* little cylinders on the end, for connection */
	for (j= [0:1]) {
	    for (i= [0:1]) {
		translate([5+ 16*j + 4*i,0,0]) hull() {
		    translate([0,-11.2,0]) rotate([0,90,0])
					      cylinder($fn=30, h=1,r=3.2);
		    translate([0,-2,0]) cube([0.8,0.8,0.8]);
		}
	    }
	}
    }

    /* joint support */
    translate([0,0.1,0.45]) scale([1,1.3,0.9]) rotate([0,90,0]) cylinder($fn=20,h=30,r=0.5);
}

/* connectorInternals() 
 *
 * Notes:
 * - I want the big radius to be 5.98/2, but on first print this actually ended
 *   up at 5.5/2. Thus the adjustment there.
 * - Similarly, I want the little radius to be 3.65/2, but on first print this 
 *   actually ended up at 3.2/2. Thus the adjustment.
 */
module connectorInternals() {
    littleRad = (3.65+0.4)/2;
    littleHt  = 5.2;
    bigRad    = (5.98+0.5)/2;
    bigHt     = 3.3; // was 4 originally

    $fn=20;

    translate([0,-20,bigHt]) {
        translate([0,0,littleHt]) sphere(r=littleRad);
        translate([0,0,-0.01]) cylinder(r=littleRad, h=littleHt+0.01);
        translate([0,0,-1*bigHt-0.01]) cylinder(r=bigRad, h = bigHt+0.01);
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

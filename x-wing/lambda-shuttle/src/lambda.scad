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

/* 74mm total length */

/* for reference */
// translate([50,0,0]) import("/Users/rross/git/models/x-wing/tie-fighter/products/tie-fighter.stl");

difference() {
    lambda();
    translate([0,0,-3]) cube([60,120,6], center=true);
}

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
	    polygon(points = [[0,0], [0,-8], [30,-8], [30,0]],
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

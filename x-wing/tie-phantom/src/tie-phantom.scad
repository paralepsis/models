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



difference() {
    body();
    translate([7,0,0]) rotate([0,-90,0]) connector(internals=false);
}
translate([7,0,0]) rotate([0,-90,0]) connector();

fin();
rotate([0,0,240]) fin();
rotate([0,0,120]) fin();

module body() {
    scale([1.2,1.2,1.2]) {
	scale([1.2,1.2,1]) difference() {
	    cylinder($fn=3, h=6,r=6);
	    translate([4,-2,-0.01]) cube([2,4,9.1]);
	    rotate([0,0,120]) translate([4,-2,-0.01]) cube([2,4,9.1]);
	    rotate([0,0,240]) translate([4,-2,-0.01]) cube([2,4,9.1]);
	}

	scale([1.2,1.2,1]) {
	    rotate([0,0,30]) translate([0,0,6]) cylinder($fn=6,r=3.3,h=2);
	    rotate([0,0,30]) bodyDetail1();
	    rotate([0,0,150]) bodyDetail1();
	    rotate([0,0,270]) bodyDetail1();
	}

	rotate([0,0,0]) {
	    translate([0,0,8]) cylinder($fn=8, r1=3.3,r2=2.9,h=5);
	    
	    difference() {
		translate([0,0,8]) cylinder($fn=40,r1=3.3,r2=3,h=5);
		translate([-8,-4,7.5]) cube([8,8,6]);
	    }
	    translate([0,0,13]) cylinder($fn=8,r1=2.9,r2=1.2,h=0.6);
	}


    }
}

module bodyDetail1() {
    translate([-0.5,3,0]) cube([1,1.5,3]);
    translate([-1.7/2,0.55,-0.6]) rotate([0,0,0]) cube([1.7,3.8,2]);
}

module fin() {
    translate([-5.3,0,0.2]) rotate([0,-90,90]) {
	translate([0,0,-0.4])
	    linear_extrude(height=0.8)
	    polygon(points=[[0,0], [3,8], [9,8], [35.3,1], [35.5,0]],
		    paths = [[0,1,2,3,4,0]]);

	/* fin connection to body */
	translate([0,0,-0.6]) cube([37,1.2,1.2]);
	translate([-0.2,-1.2,-1.5]) cube([8,1.31,3]);
	translate([7,-2.3,-0.6]) rotate([0,0,30]) cube([2,2,1.2]);

	/* fin detail */
	translate([0,0,-0.6]) linear_extrude(height=1.2)
	    polygon(points=[[2,2], [4,7], [8.2,7], [8.2,2]],
		    paths=[[0,1,2,3,0]]);
	
	translate([0,0,-0.6]) linear_extrude(height=1.2)
	    polygon(points=[[9.2,7], [28.5,2], [9.2,2]],
		    paths = [[0,1,2,0]]);
    }
}

module connector(internals=true) {
    littleRad = 2.14/2;
    littleHt  = 4.32;
    bigRad    = 4.48/2;
    bigHt     = 3.3; // was 4 originally

    $fn=20;

    translate([bigRad+0.8,0,0]) difference() {
        cylinder(r1=bigRad+0.8,r2=bigRad+0.8,h=littleRad+littleHt + bigHt + 1);
	if (internals) {
	    translate([0,0,bigHt]) {
		translate([0,0,littleHt]) sphere(r=littleRad);
		cylinder(r=littleRad, h=littleHt);
		translate([0,0,-1*bigHt]) cylinder(r=bigRad, h = bigHt);
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

/* turbolaser-top.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 *
 */

$fn=30;

// translate([-6.8 + 20,24,0]) rotate([0,0,-13]) import("./turbolaser-top-nolasers.stl");

translate([20,0,0]) body();


module body() {
    difference() {
	roughBody();
	translate([0,0,-2.5]) cube([24,24,5], center=true);
    }
}

module roughBody() {
    render(convexity=5) difference() {
	rotate([0,0,45]) cylinder($fn=4, r1=15.2,r2=11.3, h=12.5);

	/* cutouts for big wheels */
	translate([-3, 4,11]) cube([17,4,4], center=true);
	translate([-10, 4,5]) cube([3,4,4], center=true);
	translate([-3, -4,11]) cube([17,4,4], center=true);
	translate([-10, -4,5]) cube([3,4,4], center=true);
	// translate([-3,-4,8]) cube([17,4,10], center=true);
    }

    /* big wheels */
    translate([-2,6,6]) rotate([90,0,0]) wheel();
    translate([-2,-2,6]) rotate([90,0,0]) wheel();

    /* top cylinders */
    translate([6,-1.95,12.5]) rotate([90,0,0]) cylinder(r=1.3,h=4.1);
    translate([6,6.05,12.5]) rotate([90,0,0]) cylinder(r=1.3,h=4.1);

    /* top decoration */
    cylinder(r=1.2,h=12.7);
    translate([-5,0,0]) cylinder(r=1.2,h=12.7);
    translate([4.4,0,0]) cylinder(r=1.6,h=12.7);

    /* cylinders poking out sides */
    translate([-1.5,10.5,5]) rotate([90,0,0]) cylinder(r=1.6,h=2);
    translate([-1.5,-8.5,5]) rotate([90,0,0]) cylinder(r=1.6,h=2);

    /* bits on sides */
    translate([0.6,10,0]) cube([5.5,1,1]);
    translate([0.6,-11,0]) cube([5.5,1,1]);

}


module wheel() {
    assign(rad=8) difference() {
	//rotate([0,0,360/24]) 
	    cylinder($fn=12, r=rad,h=4);
	for (i = [0:5]) {
	    rotate([0,0,(360/12)*(i+1)]) translate([rad,0,0])
		translate([0,0,0.75]) cube([1.5,1,1.5],center=true);
	}
	translate([0,0,4-1.5]) for (i = [0:5]) {
	    rotate([0,0,(360/12)*(i+1)]) translate([rad,0,0])
		translate([0,0,0.75]) cube([1.5,1,1.5],center=true);
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

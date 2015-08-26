include <spiff.scad>

brim = 0;

translate([-30,-25,0]) evade("A",0);
translate([-30,0,0]) evade("B",0);
translate([-30,25,0]) evade("C",0);
translate([-30,50,0]) evade("D",0);

translate([0,-25,0]) evade("E",0.5);
translate([0,50,0]) evade("F",0.7);

translate([30,-25,0]) evade("G",0);
translate([30,0,0]) evade("H",0);
translate([30,25,0]) evade("I",0.5);
translate([30,50,0]) evade("J",0);

// cube([10,10,10]);

if (brim) {
    translate([-45,-40,0]) difference() {
	cube([90,105,0.3],center=false);
	translate([1.2, 1.2, -0.1]) cube([90-2.4, 105-2.4, 0.5], center=false);
    }
 }

module evade(char="2",bump=0) {
    union() scale(1.1) {

	/* outer circle */
	color("red") translate([0, 0.0, 0]) scale([1.5,1.5,1.1]) difference() {
	    cylinder(h = 1.5, r = 5.5, $fn = 80);
	    translate([0, 0, -0.5]) cylinder(h = 10, r = 3.75, $fn = 80);
	}

	/* three uniform points */
	for (i=[0:2]) {
	    rotate([0,0,90*i + 180]) translate([0,-6,0]) scale([1.2,1.2,1.0])
		triangle();
	}

	/* labeled point */
	letter(char, bump);
	rotate([0,0,90]) translate([0,-6,0]) scale([1.2,1.2,1.0]) triangle();
    }
}

module letter(c, b) {
    translate([10.5, -3+b, 0]) scale([0.95,1,1]) rotate([0,0,90])
	color("white") linear_extrude(height=3.0) write(c);
}

module triangle() {
    color("red") difference() {
	rotate([-90, 0, 0]) {
	    difference() {
		scale([1, 1.5, 1]) cylinder(h = 6, r1 = 3.5, r2 = 0, center = true, $fn = 60);
	    }
	}
	translate([-100, -100, -100]) cube([200, 200, 100], center=false);
	translate([-100, -100, 2.5]) cube([200, 200, 100]);
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

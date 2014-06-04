/* storage-tank.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

/******** GLOBALS ********/
tankHt = 100;
tankRad = 50;
tankThick = 1.2;
$fn=360; // NOTE: COMMENT OUT WHEN EDITING TO SPEED RENDERING

/******** BUILD SOMETHING ********/
tank();
tankTop();
tankPipes();
tankLadder();
marine();

/******** MODULES ********/

/* marine -- this simply drops a Space Marine in the model for reference.
 */

module marine(loc=[48,48,0]) {
	translate(loc) rotate([0,0,180]) color("red")
	    import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");
}

module tank() {
	difference(convexity=2) {
		union() {
			/* tank wall */
			// rotate_extrude(convexity=2) translate([tankRad,0,0]) square([tankThick,tankHt]);
			cylinder(r = tankRad, h = tankHt);

			/* random control box */
			translate([tankRad+2,0,10]) cube([6,20,20],center=true);
		}
		/* difference out everything on the inside */
		cylinder(r=tankRad - tankThick, h = tankHt + 0.001);
	}

	/* floor, with a cutout to save some plastic and perhaps reduce shrinkage */
	difference() {
		cylinder(r=tankRad+5, h=2);
		cylinder(r=tankRad/2, h=4.001, center=true);
	}
}

module tankTop() {
	sphereRad = tankRad/sin(atan(tankRad/tankHt));
	difference() {
		sphere(r=sphereRad);
		translate([-1 *sphereRad,-1*sphereRad, -1*sphereRad])
			cube([sphereRad*2,sphereRad*2,tankHt + sphereRad], center=false);
	}

	translate([tankRad/3,-1 * tankRad/3,tankHt]) {
		cylinder(r=tankRad/5,h=sphereRad - tankHt);
		for (i = [0 : 8]) {
			rotate([0,0,45 * i]) translate([tankRad/5 - 2, 0, 0]) cylinder(r=1, h=sphereRad - tankHt + 0.6);
		}
	}
}

module tankLadder() {
	translate([0,-1 * (tankRad+1),0]) {
		for (i= [2 : (tankHt - 1) / 8]) {
			translate([0,0,8 * i]) difference() {
				cube([16,3,1.5], center=true);
				translate([0,1,0.5]) cube([12,2,0.6], center=true);
			}
		}
	}
}

module tankPipes() {
	rotate([0,0,-10]) tankPipe();
	rotate([0,0,10])  tankPipe();
}

module tankPipe(pipeRad=8, pipeHt=20) {
	translate([0,tankRad+pipeHt-8,0]) {
		cylinder(r=pipeRad, h=pipeHt);
		translate([0,0,pipeHt]) sphere(r=pipeRad);
		translate([0,0,pipeHt]) rotate([90,0,0]) cylinder(r=pipeRad, h=pipeHt);
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
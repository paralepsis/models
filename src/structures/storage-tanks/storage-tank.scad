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
tankThick = 1.6;
$fn=360; // NOTE: COMMENT OUT WHEN EDITING TO SPEED RENDERING, 360 is crazy

/******** BUILD SOMETHING ********/
tank();
// tankTop();
//marine();
// tankControls();

// tankPipe();

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
			cylinder(r = tankRad, h = tankHt);

			/* more bits and pieces (control box, pipes, ladder) */
			tankControls();
			tankPipes();
			tankLadder();
		}
		/* difference out everything on the inside */
		cylinder(r=tankRad - tankThick, h = tankHt + 0.001);
	}

	/* lip inside top of tank wall to help with attaching top */
	rotate_extrude(convexity=2) translate([tankRad - 3, tankHt - 3, 0])
		polygon(points = [[3,-2], [3,3], [0,3]], paths = [[0,1,2,0]]);


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
			rotate([0,0,45 * i]) translate([tankRad/5 - 2, 0, 0]) cylinder($fn=6,r=1, h=sphereRad - tankHt + 0.6);
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

module tankControls() {
	translate([tankRad+2,0,10]) {
		cube([6,20,20],center=true);

		/* little keypad */         
		translate([2.5,4,4]) rotate([0,-10,0]) rotate([90,0,90]) {
			cube([5.5,5,2.75],center=true);

	         for (i = [0:2]) {
	             for (j = [0:3]) {
	                 translate([1.1*i - 0.25,1.1*j - 1.5,0])
	                 	  cube([0.75,0.75,3.5],center=true);
	             }
	        	}
		}
    }
}

module tankPipes() {
	rotate([0,0,14])  tankPipe();
}

module tankPipe(pipeRad=8, pipeHt=20, brim=true) {
	translate([0,tankRad+pipeHt-1,0]) {
		translate([0,-1 * pipeHt,pipeHt]) rotate([-90,0,0]) {
			cylinder(r=1.4 * pipeRad, h=2);
			for (i = [0 : 8]) {
				rotate([0,0,45 * i]) translate([1.2 * pipeRad, 0, 0]) 
					cylinder($fn=6,r=1, h=2 + 0.6);
			}
		}
		cylinder(r=pipeRad, h=pipeHt);
		translate([0,0,pipeHt]) sphere(r=pipeRad);
		translate([0,0,pipeHt]) rotate([90,0,0])
		    cylinder(r=pipeRad, h=pipeHt);

		/* brim */
		if (brim) {
		    cylinder(r=pipeRad+2, h=2);
		    translate([-1 * (pipeRad + 2), -1 * pipeHt, 0])
			cube([2*pipeRad+4,pipeHt,2], center=false);
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

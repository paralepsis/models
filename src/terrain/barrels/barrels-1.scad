use <curvedPoly.scad>
use <baseTexture129x64.scad>
use <barrel.scad>

// translate([40,10,0]) rotate([0,0,180]) import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");

final();

module final() {
	difference() {
	translate([0,0,-2]) {
		barrels();
		texturedBaseInterior();
	}
	translate([0,0,-3]) baseExtrusion(height=3);
	}
	// texturedBeveledBase();
}

module testing() {
	barrels();
	render() texturedBaseInterior();
	// translate([-2.5,-2,0]) scale([1.05,1.05,1]) color("blue") baseExtrusion();
}



/********* BARREL MODULES *********/

module barrels() {
	xyz = [[9.5,30.1,5.0], [22.5,30.1,4.8], [60,30,6],
		  [68.5,19,5], [78,12,5]];

	for (loc = xyz) {
		translate(loc) barrel(mm=35, extend=1);
	}

	translate([32,42,8]) rotate([0,80,0]) barrel(mm=35);
	translate([53,52,10]) rotate([0,90,-60]) barrel(mm=35);
	translate([80.5,25.5,5]) rotate([5,-5,0]) barrel(mm=35, extend=1);
}

/********** BASE MODULES **********/

module baseExtrusion(height=5) {
	linear_extrude(height=height, convexity=2)
	scale([1.2,1.2]) 
	curvedPoly();
}

module texturedBaseInterior() {
        intersection() {
                baseExtrusion(height=9);
			difference() {
                translate([-26,13,-7]) rotate([2,4,-15]) baseTexture129x64();
			translate([-50,80,25]) rotate([5,-2,0]) rotate([180,0,-20]) baseTexture129x64();
			translate([-20,80,27]) rotate([5,-2,0]) rotate([180,0,-20]) baseTexture129x64();
			}
      }
}

module texturedBeveledBase() {
	   $fs=0.1;
        union() {
                texturedBaseInterior();
                difference() {
                        beveledBase();
                        baseExtrusion(height=9);
                }
        }
}

module beveledBase() {
        difference() {
                translate([0,0,-5])
                minkowski() {
                        baseExtrusion(height=5);
                        sphere(r=5);
                }
                translate([-75,-25,-20])
                cube([400,200,20]);
        }
}

$fn=30;

// translate([-12,-14,40]) 
// rotate([-90,0,0])

connWidth  = 3;
boltDepth  = 3;
nutDepth   = 1.75;
slop       = 0.4;
connLength = 18;

/*
translate([-30,30,0]) mount();

translate([-30,0,0]) difference() {
    midPiece();
    translate([-15,-15,-30]) cube([30,30,30],center=false);
}

translate([-30,-30,0]) difference() {
    rotate([180,0,0]) midPiece();
    translate([-15,-15,-30]) cube([30,30,30],center=false);
}
*/

cameraBracket();

/******** MAJOR COMPONENT MODULES ********/
module cameraBracket() {
	translate([-5,-1 * connWidth * 1.5]) linear_extrude(height=4) {
	    minkowski() {
		square([10,connWidth*3 + 3]);
		circle(r=3);
	    }
	}
	translate([0,0,3.99]) rotate([0,0,90]) doubleConnector();
}

/* mount() -- Mount to be attached to back wall of printer
 */
// mount();
module mount() {
    /* plate with mounting holes */
    translate([-9,-9,0]) {
	difference() {
	    linear_extrude(height=4) {
		minkowski() {
		    translate([-3,0,0]) square([22,18]);
		    circle(r=3);
		}
	    }
	    /* remove mounting holes */
	    translate([0,3,2]) rotate([180,0,0]) std1032BoltHole();
	    translate([0,15,2]) rotate([180,0,0]) std1032BoltHole();
	}
    }
    
    /* connector on plate */
    translate([3.5,0,2]) rotate([0,0,90]) {
	tripleConnector();
    }
}

// midPiece();
module midPiece(width=connWidth) {
    translate([-12/2,-19/2, -2])
	linear_extrude(height=4) {
	minkowski() {
	    square([12,18]);
	    circle(r=3);
	}
    }
    
    rotate([180,0,0]) {
	doubleConnector();
    }
    
    rotate([0,0,90]) {
	tripleConnector();
    }
}

/******** BUILDING BLOCK MODULES ********/

/* doubleConnector -- two-component connector
 */
module doubleConnector() {
    difference() {
	union() color("red") {
	    translate([-1 * (connWidth + slop/2), 0, 0]) connectorBit();
	    translate([connWidth + slop/2, 0, 0]) connectorBit();
	}
	boltHoles();
    }
}

/* tripleConnector() -- three-component connector
 */
// tripleConnector();
module tripleConnector() {
    difference() {
	union() {
	    connectorBit();
	    translate([-1 * ((connWidth + boltDepth)/2 + 1.5 * connWidth + slop),0,0])
		connectorBit(width=connWidth+boltDepth);
	    translate([(connWidth + nutDepth)/2 + 1.5 * connWidth + slop,0,0])
		connectorBit(width=connWidth+nutDepth);
	}
	boltHoles();
    }
}

/* boltHoles() -- standard positioning of bolt/nut holes
 */
module boltHoles() {
    rotate([0,0,90]) color("blue") {
	translate([0,7,connLength - 7.5]) rotate([90,0,0])
	    std1032BoltHole();	
	translate([0,-7,connLength - 7.5]) rotate([90,90,0])
	    std1032NutHole();
    }
}

/* connectorBit() -- create a single U-shaped connector piece.
 *
 * Notes:
 * - connector is aligned in YZ plane, centered at X=0.
 * - width parameter controls the "thickness" in the X dimension.
 */
// connectorBit();
module connectorBit(width=connWidth, length=connLength) {
    myRadius = 7.5;
    myLength = max(2*myRadius,length);

    rotate([0,-90,0]) translate([0,-1*myRadius,-0.5*width]) {
	linear_extrude(height=width) hull() {
	    square([1,2 * myRadius]);
	    translate([myLength - myRadius,myRadius]) circle(r=myRadius);
	}
    }
}

// Approach taken from MCAD.
//
// Modified for #10-32 machine screw and nut
//   http://www.smithfast.com/msthreaddims.html
//   http://www.mcfeelys.com/tech/dimensions.htm
//
module std1032BoltHole(length=30, tolerance = +0.0001)
{
    radius = 4.78/2 + tolerance; // listed tolerance is .0028 in
    //capHeight = (.097 * 25.4) + tolerance;
    capHeight = 4.82 + tolerance;
    capRadius = 7.82/2 + tolerance;

    translate([0, 0, -capHeight+tolerance]) cylinder(r= capRadius, h=capHeight);
    cylinder(r = radius, h = length);
}

module std1032NutHole(tolerance = +0.0001)
{
    radius = 10.44/2+tolerance;
    height = 3.18+tolerance;

    cylinder(r= radius, h=height, $fn = 6, center=[0,0]);
}


/******** ATTIC ********/
module oldCameraBracket() {
    myBracketRad = 6/2+.1;
    difference() {
	union() {
	    cylinder(r=myBracketRad,h=28);
	    translate([0,-2,0]) cube([7,4,28]);
	}

	translate([0,0,(28-8)/2])
	    cylinder(r=4.5, h=8);
	translate([0,0,-0.001])
	    cylinder(r=3.5/2, h=28 + 0.002);
    }

    translate([4,0,14]) rotate([90,0,90]) {
	translate([-5,-1 * connWidth * 1.5]) linear_extrude(height=4) {
	    minkowski() {
		square([10,connWidth*3]);
		circle(r=3);
	    }
	}
	translate([0,0,2]) rotate([0,0,90]) doubleConnector();
    }
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 */


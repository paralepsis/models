/* bd-snow-cages.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 *
 */

/******** GLOBALS *********/
$fn=30;

topRad = 13.24/2;
bottomRad = 10.04/2;
height = 70;
totalRad = 94/2;

cageHeight = 5.5;
cageOffset = 22.24;

centerTeethRad = 26;
petalThick = 7;

cutoutYRad = 13.93/2 - 0.1; // radius of cutout in Y
cutoutXRad = 5.7 - 0.1; // radius of cutout in X
cutoutHeight = cageHeight + 0.002;
cutoutOffset = (topRad * (cageOffset) + bottomRad * (height - cageOffset)) / height + cutoutXRad - 0.001;



/******** BUILD CAGE ********/


translate([0,0,2.66]) difference() {
    union() {
	translate([0,0,3]) centerTeeth();
	
	outerPetals();

	/* extended pole bit */
	translate([cutoutOffset, 0, 8])
	    scale([cutoutXRad / cutoutYRad, 1, 1]) cylinder(r=cutoutYRad, h=12);
    }
    translate([0,0,-15.5]) poleBit();
}

/******** MODULES FOR CONSTRUCTING CAGE ********/

/* outerPetals()
 * 94/2 total radius
 */
module outerPetals() {
    difference() {
	union() {
	    cylinder(r=totalRad, h=petalThick/2);
	    translate([0,0,petalThick/2])
		cylinder(r1=totalRad, r2=centerTeethRad, h=petalThick/2);
	}
	outerPetalsDifference();
    }
}

module outerPetalsDifference() {
    for (i = [0:5]) {
	rotate([0,0,360/5*i]) translate([centerTeethRad, -1.5, 0])
	    cube([totalRad - centerTeethRad,3,10]);

	rotate([0,0,360/5*i + 360/10]) translate([centerTeethRad + 8, 0,0]) cylinder(r=7,h=10);
    }

    cylinder(r1=totalRad, r2=centerTeethRad, h=petalThick/2);
}

module centerTeeth() {
    intersection() {
	translate([0,0,-5.25]) cylinder($fn=20, r=centerTeethRad, h=11.25);

	union() {
	    cylinder($fn=20, r=centerTeethRad, h=4 * sqrt(2));
	    for (i = [0 : 20]) {
		rotate([45,0,18 * i]) translate([20,-4,-4])
		    cube([6,8,8], center=false);
	    }
	}
    }
}

/******** MODULES FOR RECONSTRUCTING THE BD POLE BOTTOM ********/

module poleBit() {
    color("grey") render() {
	cylinder(r2=topRad, r1 = bottomRad, h = height);
	translate([0,0,cageOffset]) littleCage();
    }
}

/* littleCage()
 * 30mm across
 */
module littleCage() {
    totalWidth = 30.0;
    additionalWidth = 1.2; // additional width in the X on side of cutout
    cageRad = 12.4/2; // radius of rounded corners
    
    offset = totalWidth/2 - cageRad;
    
    difference() {
	hull() {
	    translate([offset + additionalWidth, offset, 0])
		cylinder(r=cageRad, h = cageHeight);
	    translate([-1 * offset, offset, 0])
		cylinder(r=cageRad, h = cageHeight);
	    translate([offset + additionalWidth, -1 * offset, 0])
		cylinder(r=cageRad, h = cageHeight);
	    translate([-1 * offset, -1 * offset, 0])
		cylinder(r=cageRad, h = cageHeight);
	}
	translate([cutoutOffset, 0, 0]) scale([cutoutXRad / cutoutYRad, 1, 1]) cylinder(r=cutoutYRad, h=cutoutHeight);
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

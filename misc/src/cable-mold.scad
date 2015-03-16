$fn=30;

reliefRad  = 3.75;  // mm
cableRad   = 1.625; // mm
ribSpacing = 3.2;  // mm
alignRad   = 2.0;  // mm
alignSlop  = 0.05; // difference in pin and hole radius (mm)

ribbedMold();

module ribbedMold(ears=1) {
    translate([0,4,10]) rotate([-90,0,0]) difference() {
        union() {
            translate([-15,0,0]) cube([30,10,28]);
            translate([-10,6,5]) rotate([90,0,0]) cylinder(r=alignRad,h=10);
            translate([10,6,23]) rotate([90,0,0]) cylinder(r=alignRad,h=10);
        }
        ribbedBody();
        translate([0,0,-1]) cylinder(r=cableRad,h=40);
        translate([-10,6,23]) rotate([90,0,0]) cylinder(r=alignRad+alignSlop,h=10);
        translate([10,6,5]) rotate([90,0,0]) cylinder(r=alignRad+alignSlop,h=10);
    }

    translate([0,-4,10]) rotate([90,0,0]) difference() {
        union() {
            translate([-15,-10,0]) cube([30,10,28]);
            translate([-10,4,23]) rotate([90,0,0]) cylinder(r=alignRad,h=10);
            translate([10,4,5]) rotate([90,0,0]) cylinder(r=alignRad,h=10);
        }
        ribbedBody();
        translate([0,0,-1]) cylinder(r=cableRad,h=40);
        translate([-10,4,5]) rotate([90,0,0]) cylinder(r=alignRad+alignSlop,h=10);
        translate([10,4,23]) rotate([90,0,0]) cylinder(r=alignRad+alignSlop,h=10);
    }

    if (ears) {
        translate([-14,5,0])    cylinder(r=3,h=0.3);
        translate([14,5,0])     cylinder(r=3,h=0.3);
        translate([-14,-5,0])   cylinder(r=3,h=0.3);
        translate([14,-5,0])    cylinder(r=3,h=0.3);

        translate([14,-31,0])   cylinder(r=3,h=0.3);
        translate([14,31,0])    cylinder(r=3,h=0.3);
        translate([-14,-31,0])  cylinder(r=3,h=0.3);
        translate([-14,31,0])   cylinder(r=3,h=0.3);
    }
}

module ribbedBody(cable = 0) {
    difference() {
        union() {
            translate([0,0,-0.025]) cylinder(r=reliefRad, h=8.05);
            translate([0,0,8]) cylinder(r1=reliefRad, r2=reliefRad*0.8, h=14);
        }

        // cable
        if (cable) translate([0,0,-0.05]) cylinder(r=cableRad, h=24.1);

        // ribbed bits
        for (i=[0:3]) {
	    translate([-4,1.5,11 + ribSpacing *i]) rotate([0,90,00]) hull() {
                translate([0,4,0]) cylinder(r=0.4,h=8);
                cylinder(r=0.4,h=8);
            }
	    translate([-4, -1.5 - 4,11 + ribSpacing *i]) rotate([0,90,00]) hull() {
                translate([0,4,0]) cylinder(r=0.4,h=8);
                cylinder(r=0.4,h=8);
            }
    
        }
    
        for (i=[0:2]) {
	    rotate([0,0,90]) translate([-4,1.5,11 + ribSpacing *(i+0.5)]) rotate([0,90,0]) hull() {
                translate([0,4,0]) cylinder(r=0.4,h=8);
                cylinder(r=0.4,h=8);
            }
	    rotate([0,0,90]) translate([-4,-1.5 - 4,11 + ribSpacing *(i+0.5)]) rotate([0,90,0]) hull() {
                translate([0,4,0]) cylinder(r=0.4,h=8);
                cylinder(r=0.4,h=8);
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



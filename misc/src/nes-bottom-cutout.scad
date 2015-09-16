% import("/Users/rross/git/models/misc/products/nes-bottom.stl");

translate([0,0,-0.5]) vent();

// connector();

module connector() {
    translate([0,-1.5,0]) cube([23,3,5]);
}

module vent() {
    difference() {
        ventCircles();
        for (j=[0:5]) rotate([0,0,j*60]) connector();
    }
}

module ventCircles() {
    for (i=[0:3]) {
        difference() {
            cylinder(h=5,r=7+5*i);
            cylinder(h=5,r=5+5*i);
        }
    }
}


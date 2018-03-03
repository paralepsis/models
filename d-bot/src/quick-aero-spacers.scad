$fn=50;

difference() {
   cylinder(d=6.8,h=4); // was 4.8
   translate([0,0,-0.5]) cylinder(d=3.5,h=5); // was 3.2
}


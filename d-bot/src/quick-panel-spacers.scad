$fn=50;

difference() {
   cylinder(d=8,h=7); // was 4.8
   translate([0,0,-0.5]) cylinder(d=3.5,h=8); // was 3.2
}


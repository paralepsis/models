$fn=50;

// hole: 22.75mm ID

translate([0,0,42]) rotate([180,0,0]) difference() {
   union() { 
      cylinder(d1=22.75, d2=24.0, h=20);
      translate([0,0,19.9]) rotate_extrude() translate([11,0,0]) circle(r=4);
      translate([0,0,22]) cylinder(d1=25, d2=24.2, h=20);
   }
   translate([0,0,-1]) cylinder(d=18,h=50);
}

// adapter: 24.6mm ID


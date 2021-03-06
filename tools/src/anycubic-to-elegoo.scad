$fn=30;

difference() {
   // cube([50,30,18]);
   hull() {
   translate([1,17,0]) cylinder(r=1,h=35);
   translate([1,1,0]) cylinder(r=1,h=35);
   translate([49,17,0]) cylinder(r=1,h=35);
   translate([49,1,0]) cylinder(r=1,h=35);
   }
   translate([(50-29)/2,(18-15)/2,-0.5]) cube([29,15,35+1]);
}

$fn=50;

difference() {
   cylinder(r1=6,r2=7,h=12);
   translate([0,0,1]) cylinder(r1=5,r2=6,h=12);
   // translate([0,0,-1]) cylinder(r1=2,h=12);
}


difference() {
   intersection() {
      cylinder(r1=6,r2=7,h=12);
      translate([0,0,11.5]) cube([15,2,1],center=true);
   }
   cylinder(r=5,h=13);
}

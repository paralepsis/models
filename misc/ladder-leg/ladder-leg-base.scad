$fn=80;

width = 101.6; // 4" in mm
screwHole = 6.35 + 0.2; // 1/4" in mm plus slop
height = 38.1; // 1.5" in mm
hole = 44.45; // 1.75" in mm opening

difference() {
   body();

   for(i=[0:3]) rotate([0,0,i*90+45]) translate([55,0,-1]) {
      translate([0,0,7]) cylinder(d1=screwHole, d2=screwHole+10,h=10);
      cylinder(d=screwHole,h=10);
   }

   translate([0,0,-1]) cylinder(d=hole,h=height+2);
}

module body() {
   cylinder(d=hole+15, h=height);

   translate([-width/2,-width/2,0]) hull() {
      translate([7,7,0]) cylinder(r=7,h=8);
      translate([width-7,7,0]) cylinder(r=7,h=8);
      translate([7,width-7,0]) cylinder(r=7,h=8);
      translate([width-7,width-7,0]) cylinder(r=7,h=8);
   }

   translate([0,0,7.9]) rotate_extrude() translate([(hole+15)/2-0.1,0]) difference() {
      square([6,6]);
      translate([6,6]) circle(d=12);
   }
}

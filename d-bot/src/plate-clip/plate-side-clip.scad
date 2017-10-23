$fn=50;

oneEighthIn=3.175; // 1/8" to mm

translate([0,0,oneEighthIn+2]) rotate([180,0,0]) difference() {
   form();
   translate([0,6,0]) boltCutout(gap=1);
}
   

module form() {
   translate([-15,0,0]) cube([30,18,oneEighthIn+0.1]);
   translate([-15,0,oneEighthIn]) cube([30,20,2]);
}


module boltCutout(thick=1.2,gap=0,washer=7.2) {
   translate([0,0,-0.1]) {
      hull() {
         cylinder(d=3.2,h=thick);
         translate([0,5,0]) cylinder(d=3.2,h=thick);
      }
   
      translate([0,0,thick+0.2*gap]) hull() {
         cylinder(d=washer,h=10);
         translate([0,5,0]) cylinder(d=washer,h=10);
      }
   }
}



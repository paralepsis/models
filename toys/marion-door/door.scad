$fn=30;

difference() {
   body();
   topCutout();
   bottomCutout();
}
   
module body() {
   /* main form */
   cube([90,52,3]);

   /* posts on corners */
   translate([-2,1,1.5]) union() {
      rotate([0,90,0]) cylinder(h=7,d=3);
      translate([0,-1.5,-1.5]) cube([7,3,1.5]);
   }
   translate([90-5,1,1.5]) union() {
      rotate([0,90,0]) cylinder(h=7,d=3);
      translate([0,-1.5,-1.5]) cube([7,3,1.5]);
   }

   /* latch */
   translate([38,48,0]) union() {
      cube([8,1.6,6.5]);
      translate([0,3.6,0]) cube([8,1.6,6.5]);
   }
}

module topCutout() {
   translate([1.5,0,-0.1]) difference() {
      translate([0,1,0]) cube([23,50,0.4]);
      translate([0.4,1.4,-0.1]) cube([23-0.8,50-0.8,0.5]);
   }
}

module bottomCutout() {
   translate([26.5,0,-0.1]) difference() {
      translate([0,1,0]) cube([62,50,0.4]);
      translate([0.4,1.4,-0.1]) cube([62-0.8,50-0.8,0.5]);
   }
}

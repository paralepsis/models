$fn=40;

rotate([-90,0,0]) for (i=[0:3]) {
   translate([i*10,-2.1-i*0.4,0]) zstop(height=2.1+i*0.4);
}

module zstop(height=2) {
   difference() {
      union() {
         hull() { 
            cylinder(r=2,h=4);
            translate([3,0,0]) cylinder(r=2,h=4);
         }
         translate([-2,0,0]) cube([7,height,12]);
      }
      translate([1.5,6,8]) rotate([90,0,0]) cylinder(d=2.7,h=10);
   }
}


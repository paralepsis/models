for (i=[0:9]) {
   translate([i*4,0,0]) {
      cube([4,2,i+2]);
      translate([0,10,0]) cube([4,2,i+2]);
      translate([0.5,0,i+2-0.15]) cube([3,11,0.15]);
   }
}

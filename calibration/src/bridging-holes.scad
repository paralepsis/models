$fn=80;

for (i=[0:9]) {
   translate([i*9,0,0]) {
      difference() {
         cube([9,12,0.75*(i+2)]);
         translate([4.5,6,-0.15]) cylinder(d=8,h=0.75*(i+2));
      }
      // translate([0,10,0]) cube([8,4,0.75*(i+2)]);
      // translate([2,0,0.75*(i+2)-0.15]) cube([4,13,0.15]);
   }
}

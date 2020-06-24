$fn=40;

difference() {
   union() {
      cylinder(d=7,h=1.8);
      for (i=[0:3]) {
         translate([0,0,1.79+3*i]) cylinder(d1=4,d2=3,h=3.05);
         translate([0,0,1.79+3*i-0.75]) cylinder(d1=3,d2=4,h=0.8);
      }

   }
   translate([-5,-2,10]) rotate([60,0,0]) cube([10,10,10]);
}

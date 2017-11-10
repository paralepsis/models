$fn=80;

// 4.8 mm deep hole for using an 8mm bolt

difference() {
   union() {
      translate([-15,0,0]) cube([24,10,78]);
      translate([-15,0,0]) cube([9.75,11,78]);
      translate([4,0,0]) rotate([0,0,180])
         linear_extrude(height=78)
         polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
   }

   bolts();
}

module bolts() {
   union() {
         /* bolt holes */
         translate([-0.5,12,20]) rotate([90,0,0]) cylinder(h=15,d=5.2);
         translate([-0.5,12,58]) rotate([90,0,0]) cylinder(h=15,d=5.2);
   
         /* cap holes (with a little gap to allow bridging */
         translate([-0.5,3.8,20]) rotate([-90,0,0]) cylinder(h=30,d=9);
         translate([-0.5,3.8,58]) rotate([-90,0,0]) cylinder(h=30,d=9);
   }
}

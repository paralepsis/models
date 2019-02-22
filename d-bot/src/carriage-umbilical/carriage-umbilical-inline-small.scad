$fn=80;

difference() {
   union() {
      translate([-15,-16,0]) {
         hull() {
            translate([5,0,0]) cube([20,10,20]);
            translate([15,20,0]) cylinder(d=21,h=20);
         }

         /* angled bit to fit in v-slot */
         translate([19.5,0,0]) rotate([0,0,180])
            linear_extrude(height=20)
            polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
      }
   }

   /* conduit hole */
   translate([0,4,-0.5]) cylinder(d=14,h=21);
   translate([0,-2.2,10]) rotate([90,0,0]) {
      /* bolt holes */
      translate([0,0,14-4.8]) cylinder(h=15,d=5.2);

      /* cap holes (with a little gap to allow bridging */
      translate([0,0,-20]) cylinder(h=30,d=9);

   }

   /* cutout for wires to enter */
   translate([5,2,-2]) cube([10,6,30]);

   /* cutout for wire tie */
   translate([12,-3,10]) rotate([0,-90,0]) cylinder(d=3,h=30);
}


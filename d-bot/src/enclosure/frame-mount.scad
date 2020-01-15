$fn=80;

bottomLip = 1;


difference() {
   union() {
      translate([-15,-16,0]) {
         hull() {
            translate([5,0,0]) cube([20,10,33 + 2*bottomLip]);
            translate([15,18,0]) cylinder(d=21,h=33 + 2*bottomLip);
            translate([5,21,20]) cube([20,10,13 + 2*bottomLip]); /* spot for magnet */
         }

         /* angled bit to fit in v-slot */
         translate([19.5,0,0]) rotate([0,0,180])
            linear_extrude(height=33 + 2*bottomLip)
            polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);

         /* bottom lip */
         if (bottomLip) {
            translate([5,30,33]) cube([20,7,2]);
         }
      }
   }

   /* conduit hole */
   translate([0,4,-0.5]) cylinder(d=14,h=40);
   translate([0,-2.2,10]) rotate([90,0,0]) {
      /* bolt holes */
      translate([0,0,14-4.8]) cylinder(h=15,d=5.2);

      /* cap holes (with a little gap to allow bridging */
      translate([0,0,-20]) cylinder(h=30,d=9);

   }

   /* cutout for wires to enter */
   translate([5,2,-2]) cube([10,6,40]);

   /* cutout for wire tie */
   translate([12,-3,6]) rotate([0,-90,0]) cylinder(d=3,h=30);

   /* cutout for magnet */
   translate([0,15.1, 26]) rotate([90,0,0]) cylinder(d=6.25, h=1.1);
}


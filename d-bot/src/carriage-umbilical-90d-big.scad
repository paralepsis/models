$fn=80;


difference() {
   union() {
      translate([-15,-16,0]) {
         hull() {
            translate([5,0,0]) cube([25,10,20]);
            translate([33,0,10.5]) rotate([-90,0,0]) cylinder(d=21,h=20);

            translate([27,0,0]) cube([12,20,15]);

         }

         /* angled bit to fit in v-slot */
         translate([19.5,0,0]) rotate([0,0,180])
            linear_extrude(height=20)
            polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
      }
   }

   /* conduit hole */
   translate([18,-17,10.5]) rotate([-90,0,0]) cylinder(d=16,h=25);
   translate([0,-2.2,10]) rotate([90,0,0]) {
      /* bolt holes */
      translate([0,0,14-4.8]) cylinder(h=15,d=5.2);

      /* cap holes (with a little gap to allow bridging */
      translate([0,0,-20]) cylinder(h=30,d=9);
   }
   translate([15,-20,12]) cube([7,30,10]);
   translate([8,-4,-1]) cylinder(d=3,h=30);
}


$fn=80;

difference() {
   union() {
      translate([-15,-16,0]) {
         hull() {
            translate([5,0,0]) cube([20,10,20]);
            translate([15,16,0]) cylinder(d=22,h=20);
         }

         /* angled bit to fit in v-slot */
         intersection() { 
           translate([5,-1,0]) cube([20,10,20]);
           translate([0,0,3.75]) rotate([0,-45,0]) translate([0,0,-15])
           translate([19.5,0,-5]) rotate([0,0,180])
              linear_extrude(height=30)
              polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
         }
        }
   }

   /* conduit hole */
   translate([0,0,-0.5]) cylinder(d=16,h=21);
   translate([0,-2.2,10]) rotate([90,0,0]) {
      /* bolt holes */
      translate([0,0,14-4.8]) cylinder(h=15,d=5.2);

      /* cap holes (with a little gap to allow bridging */
      translate([0,0,-20]) cylinder(h=30,d=9);
   }
}

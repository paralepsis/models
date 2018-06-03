$fn=80;


difference() {
   union() {
      translate([-8,0,0]) cube([40,20,20]);
         /* angled bit to fit in v-slot */
      translate([-8,0,5.5]) rotate([0,-90,180])
         linear_extrude(height=40)
         polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
      translate([-8,0,0]) cube([40, 56,5]);

      translate([27,0,0]) rotate([90,0,90]) linear_extrude(height=5) polygon(points=[[20,0], [20,20],[56,5], [56,0]]);
   }

   translate([18,28,-0.5]) cylinder(d=4.2,h=10);
   translate([18,48,-0.5]) cylinder(d=4.2,h=10);

   /* TODO: MAKE SURE HOLES ARE CORRECT DEPTH. */
   translate([18,15,10]) rotate([90,0,0]) {
      /* bolt holes */
      translate([0,0,14-4.8]) cylinder(h=15,d=5.2);

      /* cap holes (with a little gap to allow bridging */
      translate([0,0,-20]) cylinder(h=30,d=9);
   }
   translate([0,15,10]) rotate([90,0,0]) {
      /* bolt holes */
      translate([0,0,14-4.8]) cylinder(h=15,d=5.2);

      /* cap holes (with a little gap to allow bridging */
      translate([0,0,-20]) cylinder(h=30,d=9);
   }
}


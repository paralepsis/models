$fn=80;

ht = 30;

% old();
new();


module new() {
   difference() {
      union() {
         translate([-18,0,0]) rotate([90,0,90])
            linear_extrude(height=50)
            polygon(points=[[0,20],[0,40],[20,40],[ht,20],[ht,14],[ht+36,5],[ht+36,0],[15,0]]);
         /* angled bit to fit in v-slot */
         translate([-18,0,25.5]) rotate([0,-90,180])
            linear_extrude(height=50)
            polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
      }

      // translate([18,28,-0.5]) cylinder(d=4.4,h=10);
      translate([-18.1,ht,5]) cube([45.1,50,30]);
      hull() {
         translate([18,ht+8.5,-0.5]) cylinder(d=4.4,h=20);
         translate([18,ht+9.5,-0.5]) cylinder(d=4.4,h=20);
      }
      hull() {
         translate([18,ht+27.5,-0.5]) cylinder(d=4.4,h=20);
         translate([18,ht+28.5,-0.5]) cylinder(d=4.4,h=20);
      }

      /* TODO: MAKE SURE HOLES ARE CORRECT DEPTH. */
      translate([20,15,30]) rotate([90,0,0]) {
         /* bolt holes */
         translate([0,0,14-4.8]) cylinder(h=15,d=5.5);

         /* cap holes (with a little gap to allow bridging */
         translate([0,0,-20]) cylinder(h=30,d=9);
      }
      translate([-6,15,30]) rotate([90,0,0]) {
         /* bolt holes */
         translate([0,0,14-4.8]) cylinder(h=15,d=5.5);
   
         /* cap holes (with a little gap to allow bridging */
         translate([0,0,-20]) cylinder(h=30,d=9);
      }
   }
}

module old() {
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

      // translate([18,28,-0.5]) cylinder(d=4.4,h=10);
      translate([18,29,-0.5]) cylinder(d=4.4,h=10);
      translate([18,48,-0.5]) cylinder(d=4.4,h=10);

      /* TODO: MAKE SURE HOLES ARE CORRECT DEPTH. */
      translate([20,15,10]) rotate([90,0,0]) {
         /* bolt holes */
         translate([0,0,14-4.8]) cylinder(h=15,d=5.5);

         /* cap holes (with a little gap to allow bridging */
         translate([0,0,-20]) cylinder(h=30,d=9);
      }
      translate([0,15,10]) rotate([90,0,0]) {
         /* bolt holes */
         translate([0,0,14-4.8]) cylinder(h=15,d=5.5);
   
         /* cap holes (with a little gap to allow bridging */
         translate([0,0,-20]) cylinder(h=30,d=9);
      }
   }
}


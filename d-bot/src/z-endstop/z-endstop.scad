$fn=30;

/* zDrop -- gap between bottom of rail and top of switch assembly 
 *          (in mm)
 */
zDrop = 1;

zEndstopMount();

module zEndstopMount() {
   difference() {
      union() { 
         /* base and connector to frame */
         translate([-17.5,-2-zDrop,0]) cube([40,36,4]);
         translate([-17.5,16,0]) cube([40,18,13]);

         /* angled bit to fit in v-slot */
         translate([-17.5,18+3.5,13]) rotate([90,0,0]) rotate([0,90,00])
            linear_extrude(height=40)
            polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
      }

      /* cutouts */
      union() {
         translate([5,1-zDrop,4]) rotate([0,180,0]) endstopCutouts();
   
         /* bolt holes */
         translate([-8,26,14-4.8]) cylinder(h=15,d=5.2);
         translate([14,26,14-4.8]) cylinder(h=15,d=5.2);

         /* cap holes (with a little gap to allow bridging */
         translate([-8,26,-0.1]) cylinder(h=14-4.8,d=9);
         translate([14,26,-0.1]) cylinder(h=14-4.8,d=9);
      }
   }
}

module endstopCutouts() {
   translate([3,6.3,0]) rotate([30,0,0]) {
      rotate([0,90,0]) cylinder($fn=6,d=3.5,h=3);
      translate([4.75,0,0]) rotate([0,90,0]) cylinder($fn=6,d=3.5,h=3);
      translate([9.5,0,0]) rotate([0,90,0]) cylinder($fn=6,d=3.5,h=3);
   }
   translate([0,0,-0.1]) cylinder(h=5,d=3.2);
   translate([19,0,-0.1]) cylinder(h=5,d=3.2);
   translate([-6.25,10,0]) rotate([90,30,0]) cylinder($fn=6,d=3.9,h=9.5);
}

use <bevel.scad>
use <attach.scad>

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
         translate([-17.5,-2-zDrop,0]) difference() {
            e0 = [[0,0,2],[0,0,1],0];
            n0 = [[0,0,2],[-1,-1,0],0];
            e1 = [[40,0,2],[0,0,1],0];
            n1 = [[40,0,2],[1,-1,0],0];

            cube([40,36,4]);
            bevel(e0,n0,cr=1,cres=10,l=4);
            bevel(e1,n1,cr=1,cres=10,l=4);
         }
         translate([-17.5,16,0]) {
            e2 = [[20,0,4],[1,0,0],0];
            n2 = [[20,0,4],[0,-1,1],0];
            e3 = [[0,18,13/2],[0,0,1],0];
            n3 = [[0,18,13/2],[-1,1,0],0];
            e4 = [[40,18,13/2],[0,0,1],0];
            n4 = [[40,18,13/2],[1,1,0],0];
            // e5 = [[0,0,13/2],[0,0,1],0];
            // n5 = [[0,0,13/2],[-1,-1,0],0];
            // e6 = [[40,0,13/2],[0,0,1],0];
            // n6 = [[40,0,13/2],[1,-1,0],0];

            difference() {
               union() {
                  cube([40,18,13]);
                  bconcave_corner_attach(e2,n2,l=40,cr=1,cres=10);
               }
               bevel(e3,n3,cr=1,cres=10,l=13);
               bevel(e4,n4,cr=1,cres=10,l=13);
               // bevel(e5,n5,cr=1,cres=10,l=13);
               // bevel(e6,n6,cr=1,cres=10,l=13);
            }
         }

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

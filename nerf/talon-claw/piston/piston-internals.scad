/* K31-specific piston for TC
 *
 * According to here, OD is 0.88" (22.35 mm), ID 0.72" (18.29mm):
 *   http://nerfhaven.com/forums/topic/21855-the-nic-spring-database/
 */

$fn=60;

bridge=0;

difference() {
   k31Piston();
//   translate([0,0,-0.1]) cube([40,40,70]);
}

module k31Piston() {
   difference() {
      import("./G14_L_Spring_Piston-filled_fixed.stl");
      cutout();
   }
}

module cutout() {
   cylinder(d1=23.0,d2=23.00,h=1.5); // bevel bottom edge
   translate([0,0,-1]) cylinder(d=23.00,h=15); // CS's is 22.22mm ID and my spring fits...
   // translate([0,0,12.5]) cylinder(d1=24,d2=22.22,h=2.5);
   if (bridge) {
      translate([0,0,15.0+0.6]) cylinder(d=17,h=34-0.6);
   }
   else {
      translate([0,0,15.0]) cylinder(d=17,h=34);
   }
}

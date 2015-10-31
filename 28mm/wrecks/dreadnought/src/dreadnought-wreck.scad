// import("../orig/Dreadnought.stl");

/* Base */
include <./base-2.scad>;

// % translate([0,0,155/2]) cube(size=[240, 153, 155], center=true);

/* 
translate([24, -85, 0]) rotate([0,0,80]) color("red")
   import("/Users/rross/personal/3dprint/marine/marine-on-base.stl");
*/

/* Dreadnought */
translate([-10,-3,8]) rotate([73,10,130]) dn();

module dn() {
   // Translations/rotations from original STLs:
   // translate([0,0,0]) import("bits/body.stl");
   // translate([15,1,4]) import("bits/center-left.stl");
   // translate([-15,1,4]) import("../orig/Center_-_Right.stl");
   // translate([-27,13,-8]) rotate([26,4,-8]) import("../orig/Right_Arm_Plasma_Cannon.stl");

   import("bits/body.stl");
   import("bits/center-left.stl");
   import("bits/center-right.stl");

   import("bits/right-arm.stl");

   rotate([0,-5,10]) {
      // translate([0,1,-26]) import("../orig/Legs.stl");
      // translate([17.5,5,-25.5]) rotate([30,-6,0]) import("../orig/Foot.stl");
      import("bits/legs.stl");
      import("bits/foot.stl");
   }
}

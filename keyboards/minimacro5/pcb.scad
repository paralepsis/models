$fn=30;

/* Notes:
 * - my M2 heat set nuts, the shortest ones, are 3.5mm in diameter and 4mm
 *   long.
 * - stock miniMACRO5 shell leaves 5mm from top face to where the PCB hits
 *   the plastic underneath. Mill-max sockets supposedly take up an additional
 *   0.64mm of space above the board.
 * - rotary encoders only need about 12.25mm in the Y.
 */

include<./plate.scad>;



// translate([0,0,-5]) import("./orig/miniMACRO5.stl");
shape();

module shape() {
   difference() {
      simpleBody();
      pcbPlus(height=20);
      switchHoles();
   }
}

module pcbPlus(height=1) {
   translate([-12.987,-11.087,0]) cube([12.987+89.187,11.087*2,height]);

   /* screws */
   translate([-9.9,8,0]) cylinder(r=1.2,h=5);
   translate([-9.9,-8,0]) cylinder(r=1.2,h=5);
   translate([86.1,8,0]) cylinder(r=1.2,h=5);
   translate([86.1,-8,0]) cylinder(r=1.2,h=5);

   /* USB */
   translate([80,-5.5,-2.5]) cube([20,11,10.5]);
}

module simpleBody() {
   translate([0,0,-5]) linear_extrude(height=7.5)
      polygon(points=[[-16,-14],[-16,14],[92,14],[92,-14]]);

}

module switchHoles() {
   translate([-7.15-2.525+0.15,-7.15-2.525+0.15,-5]) miniHoles();
}

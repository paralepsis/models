% import("../orig/Small_and_Medium_Base_Tray_-_10mm.stl");

include <10mm-bits.scad>

inset = 0.0;
cornerRad=3.75;
trayHt=10;
xDim = 160;
yDim = 165;
wallThick = 2.4;
bottomThick = 1.5;

bottomMagnets = 1;

epsilon = 0.1;

tray();

/* tray() -- final form, with magnet holes removed */
module tray() {
   difference() {
      /* remove anything that might have come out of the intended hull */
      intersection() {
         baseShape();
         trayHull();
      }

      /* cut out magnet holes */
      magnetHoles();
   }
}

/* baseShape() -- tray with cut out interior */
module baseShape() {
   difference() {
      trayHull();

      /* cut out interior */
      translate([wallThick,20,bottomThick]) smallSlot();
      translate([wallThick,81,bottomThick]) mediumSlot();
   }

   cornerPosts();
}

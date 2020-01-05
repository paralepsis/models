include <10mm-bits.scad>

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
      translate([wallThick,15,bottomThick]) smallSlot();
      translate([wallThick,yDim-90,bottomThick]) smallSlot();

      translate([0,yDim-20,1.75]) rulerSlot();
   }

   cornerPosts();
}

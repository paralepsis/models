tileSide = 30;
tileBHt  = 1.8; // bottom height (thick)
tileTHt  = 0.9; // top height (thick)
tileMHt  = 0.6; // mid height (thick)
tileGap  = 0.3; // gap between tiles in a row */

fitSlop =0.2; // general slop to account for tolerances in prints.

straw1Dia = 6;
straw2Dia = 4;

midOverlap = 0.4; // amount of overlap between middle and bottom

frameWid = 3;

for (i=[0:5]) {
   translate([i*(tileSide + tileGap),0,0]) tile(exploded = 0, detail = 1);
}


module tile(exploded=0, detail = 1)
{
   if (exploded) {
      /* exploded view, not print view */
   
      /* top */
      translate([0,0,tileBHt+tileMHt+2]) xTileFrame();

      /* middle */
      translate([0,0,tileBHt + 1]) middle(detail = detail);

      /* bottom */
      translate([tileSide,0,tileBHt]) rotate([0,180,0])
         simpleTileFrame(cutout=1);
   }
   else {
      translate([0,0,tileBHt]) xTileFrame();

      /* middle */
      translate([0,0,tileBHt-tileMHt]) middle(detail=1);

      /* bottom */
      translate([tileSide,0,tileBHt]) rotate([0,180,0])
         simpleTileFrame(cutout=1);
   }
}


translate([-10,10,-straw1Dia/2-1]) rotate([0,90,0])
   cylinder($fn=30,d=straw1Dia,h=100);
translate([-10,17,-straw2Dia/2-1]) rotate([0,90,0])
   cylinder($fn=30,d=straw2Dia,h=100);


/********************** MODULES **********************/

module simpleTileFrame(h = tileBHt, cutout=0)
{
   difference() {
      cube([tileSide,tileSide,h]);
      translate([frameWid,frameWid,-0.1])
         cube([tileSide - frameWid*2,tileSide-frameWid*2,h+0.2]);
      if (cutout) middle(detail=0);
   }
}

module middle(detail=0) {
   if (detail) {
      crossHatch();
   }
   else {
      translate([frameWid - midOverlap, frameWid - midOverlap, 0])
         cube([tileSide- 2*frameWid + 2*midOverlap,
               tileSide- 2*frameWid + 2*midOverlap,
               tileMHt]);
   }
}

module xTileFrame(h = tileTHt, cutout=0)
{
   xHt = h -0.3;
   xWid = 3;

   intersection() {
      cube([tileSide,tileSide,h]);
 
      union() {
         difference() {
            cube([tileSide,tileSide,h]);

            /* difference */
            translate([frameWid,frameWid,-0.1])
               cube([tileSide - frameWid*2,tileSide-frameWid*2,h+0.2]);
            if (cutout) middle(detail=0);
         }
         rotate([0,0,45]) translate([0,-xWid/2,0])
            cube([1.5*tileSide, xWid, xHt]);
         translate([tileSide,0,0]) rotate([0,0,135]) translate([0,-xWid/2,0])
            cube([1.5*tileSide, xWid, xHt]);
      }
   }
}

module crossHatch(count = 10,h=0.8) {
   space = tileSide / count;
   xHt = 0.6;

   difference() {
      cube([tileSide,tileSide,h]);
      translate([0.4,0.4,-0.1]) cube([tileSide-0.8,tileSide-0.8,h+0.2]);
   }

   intersection() {
     cube([tileSide,tileSide,h]);

      for (i=[0:2*count-1]) {
         translate([-tileSide + i*tileSide/count,0,0]) rotate([0,0,45]) translate([0,-0.2,0])
            cube([1.5*tileSide, 0.4, h]);

         translate([-tileSide + i*tileSide/count,0,0]) translate([tileSide,0,0]) rotate([0,0,135]) translate([0,-0.2,0])
            cube([1.5*tileSide, 0.4, h]);
      }
   }
}

/* falcon-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <bintools.scad>

/* Harbor Freight Large
 * 46.5mm tall
 * 48.6mm tall with legs
 * 109.3mm wide
 * 80mm length
 */

tiltedFalconBox();

module tiltedFalconBox()
{
   roundShapedBox(xDimTop=160, yDimTop=109.3, xDimBottom=158,
                  yDimBottom=107.3, ht=46.5, wallThick=2.0);
   roundBoxBottom(xDim=158,yDim=107.3,ht=1.5);

   intersection() { 
      translate([-8.5,2,0]) rotate([0,0,26.2]) tiltedFalconEnclosure();
      roundBoxBottom(xDim=158,yDim=107.3, ht=46.5-0.1);
   }
}

/* tiltedFalconEnclosure()
 *
 * Note: ~12 degrees angle?
 */
module tiltedFalconEnclosure()
{
   angle = 12;
   cutPoint = 11.5;

   intersection() {
      rotate([-1*angle,0,0]) falconEnclosure();
      // translate([0,3,20 + cutPoint]) cube(center=true, size=[160,100,40]);
      translate([0,5,20 + cutPoint]) cube(center=true, size=[160,120,40]);
   }

   linear_extrude(height=cutPoint+0.05) projection(cut=true)
      translate([0,0,-1*cutPoint]) intersection() {
         rotate([-1*angle,0,0]) falconEnclosure();
         translate([0,3,20 + cutPoint]) cube(center=true, size=[160,110,40]);
      };
}

/* falconBox() -- this is probably good, but keeps MF flat, so
 *                the dish is protruding much more than rest of
 *                craft.
 */
module falconBox() {
   roundShapedBox(xDimTop=160, yDimTop=109.3, xDimBottom=158,
                  yDimBottom=107.3, ht=46.5, wallThick=2.0);
   roundBoxBottom(xDim=158,yDim=107.3,ht=1.5);

   translate([-11,8.5,0]) rotate([0,0,26.5]) falconEnclosure();
}

/* falconEnclosure()
 *
 * Notes:
 * - standard wall thickness is 1.2mm
 * - Total height of Falcon is around 36mm.
 * - Total height of outline is 46.5 - 0.1 mm.
 * - Posts need to be about 6mm tall to keep post and bottom gun off the base.
 */
module falconEnclosure() {
   postHeight = (46.5 - 0.1) - 36+6+1;
   supportHeight = (46.5 - 0.1) - 36 + 11.5+1;

   falconOutline();

   /* posts */
   translate([17-14,18,0]) post(height=postHeight,topRad=7,bottomRad=8);
   translate([17-14,-18,0]) post(height=postHeight,topRad=7,bottomRad=8);

   translate([-23-14,18,0]) post(height=postHeight,topRad=7,bottomRad=8);
   translate([-23-14,-18,0]) post(height=postHeight,topRad=7,bottomRad=8);

   /* front-end support */
   linear_extrude(height=supportHeight) mirror([0,0,0])
      polygon(points=[[50,0],[50,23],[68,15],[68,0]]);
   linear_extrude(height=supportHeight) mirror([0,1,0])
      polygon(points=[[50,0],[50,23],[68,15],[68,0]]);
}

module post(height=20,topRad=4,bottomRad=7) {
   hull() {
      translate([0,0,height-topRad/2]) scale([2,2,1]) sphere(r=topRad/2);
      cylinder(r=bottomRad,h=0.1);
   }
}

/* falconOutline() -- cut a slice out of the original case to use as
 *                    outline of the Falcon.
 *
 * Note: -17 is a nice translation to get a good cut.
 */
module falconOutline(height=46.5-0.1) {
   translate([0,-1.75,0]) linear_extrude(height=height)
      projection(cut=true) translate([0,0,-17])
      rotate([0,0,90]) import("../orig/falcon-outline-bottom.stl");
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 3
 *  c-basic-offset: 3
 * End:
 *
 * vim: ts=8 sts=3 sw=3 expandtab
 */

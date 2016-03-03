/* medium-bins.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

/* Note: Abusing roundBoxBottom() a lot in this source, to create whole
 *       forms for diff()'ing, etc.
 */

include <./bintools.scad>

/* Harbor Freight Medium
 * 46.5mm tall
 * 48.6mm tall with legs
 * 80mm wide, 77 bottom
 * 54mm length, 52 bottom
 */

/* Harbor Freight Small
 * 46.5mm tall
 * 48.6mm tall with legs
 * 54mm wide
 * 39.25mm length
 */

// mediumBin();
mediumSplitBin();

module mediumBin() {
   roundShapedBox(xDimTop=54, yDimTop=80, xDimBottom=54,
                  yDimBottom=80, ht=46.5/2, wallThick=1.6);
   roundBoxBottom(xDim=53,yDim=78.5,ht=1.2);
}

module mediumSplitBin() {
   difference() {
      /* abusing roundBoxBottom() to make entire box shape */
      roundBoxBottom(xDim=80, yDim=54, ht=46.5/2);

      translate([-39.25/2,0,1.2])
         roundBoxBottom(xDim=37.5, yDim=50.8, ht=46.5/2);
      translate([+39.25/2,0,1.2])
         roundBoxBottom(xDim=37.5, yDim=50.8, ht=46.5/2);
   }
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */

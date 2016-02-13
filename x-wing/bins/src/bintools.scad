// Harbor Frieght Medium
// 46.5mm tall
// 48.6mm tall with legs
// 80mm wide, 77 bottom
// 54mm length, 52 bottom

/* harborFreightMediumFullHt(locations, outlineScale)
 *
 * locations -- an array of pairs of triples specifying a translation and rotation of the children().
 *              e.g., locations = [[[0,0,0], [0,0,0]],
 *                                 [[5.5, 21.3,0], [0,0,0]],
 *                                 [[-5.5, -21.3, 0],[0,0,0]]];
 *
 * outlineScale -- scaling of the region around the blank. 1.2 is default.
 *
 * Dimensions (from ___)
 *   46.5mm tall
 *   48.6mm tall with legs
 *   80mm wide, 77mm bottom
 *   54mm length, 52mm bottom
 */
module harborFreightMediumFullHt(locations=[]) {
   solidBottomBox(xDim=54,yDim=80,ht=46.5,locations=locations) children();
}

/* solidBottomBox()
 * locations -- an array of pairs of triples specifying a translation and rotation of the children().
 *              e.g., locations = [[[0,0,0], [0,0,0]],
 *                                 [[5.5, 21.3,0], [0,0,0]],
 *                                 [[-5.5, -21.3, 0],[0,0,0]]];
 *
 * outlineScale -- scaling of the region around the blank. 1.2 is default.
 */
module solidBottomBox(xDim=10,xDim=10,ht=10,locations=[],outlineScale=1.2) {
   offsetFromTop = 0.1; /* amount of space to move the outline from the top of the form; helps keep model clean */

   /* flip right-side up and place on XY plane */
   translate([0,0,ht]) rotate([180,0,0]) {
      /* parallel-sided box, complete bottom */
      roundShapedBox(xDimTop=xDim, yDimTop=yDim, xDimBottom=xDim,
                     yDimBottom=yDim, ht=ht, wallThick=1.6);
      translate([0,0,ht-1.2]) roundBoxBottom(xDim=xDim,yDim=yDim,ht=1.2);

      /* spaces to hold ships */
      difference() {
         union() {
            /* base form */
            for (loc = locations) {
                translate([0,0,offsetFromTop]) translate(loc[0]) rotate(loc[1])
                   blankOutline(height=ht-offsetFromTop, outlineScale=outlineScale) children();
            }
         }
         union() {
            /* what will be differenced out */
            for (loc = locations) {
                translate(loc[0]) rotate(loc[1]) children();
            }
         }
      }
   }
}


/* blankCutout() - extrudes an outline of children() to a given height
 *                 and then difference()s out the children(), leaving
 *                 only the outline.
 */
module blankCutout(height=48.6, epsilon=0.1, outlineScale=1.4) {
   difference() {
      translate([0,0,epsilon]) linear_extrude(height=height-epsilon)
         outline(outlineScale=outlineScale) projection(cut=false) children();
      children();
   }
}

/* blankOutline() - extrudes an outline (enclosing form) of children()
 *                  to a given height.
 *
 * Notes: Intended to allow for taking a form (the "blank") and create a
 *        supporting shape around it.
 */
module blankOutline(height=48.6) {
   linear_extrude(height=height) outline() projection(cut=false) children();
}


/* outline() - generates an outline of an object
 *
 * Note: This is intended to be used on a 2D shape, such as one created
 *       using the projection() operator.
 */
module outline(outlineIterations = 30,outlineScale=1.4) {
   for (i=[0:outlineIterations]) {
      translate([outlineScale*cos(360*i/outlineIterations),
                 outlineScale*sin(360*i/outlineIterations),0]) children();
   }
}

/* roundBox() - rounded corner box
 */
module roundBox(cornerRad=2,xDim=10,yDim=10,ht=10,wallThick=1.2) {
   linear_extrude(height=ht) difference() {
      hull() {
         translate([xDim/2-cornerRad,
                    yDim/2-cornerRad,0]) circle(r=cornerRad);
         translate([-1*xDim/2+cornerRad,
                    yDim/2-cornerRad,0]) circle(r=cornerRad);
         translate([xDim/2-cornerRad,
                    -1*yDim/2+cornerRad,0]) circle(r=cornerRad);
         translate([-1*xDim/2+cornerRad,
                    -1*yDim/2+cornerRad,0]) circle(r=cornerRad);
      }
      hull() {
         translate([xDim/2-cornerRad-wallThick,
                    yDim/2-cornerRad-wallThick,0]) circle(r=cornerRad);
         translate([-1*xDim/2+cornerRad+wallThick,
                    yDim/2-cornerRad-wallThick,0]) circle(r=cornerRad);
         translate([xDim/2-cornerRad-wallThick,
                    -1*yDim/2+cornerRad+wallThick,0]) circle(r=cornerRad);
         translate([-1*xDim/2+cornerRad+wallThick,
                    -1*yDim/2+cornerRad+wallThick,0]) circle(r=cornerRad);
      }
   }
}

/* roundBoxBottom() - rounded corner box bottom
 */
module roundBoxBottom(cornerRad=2,xDim=10,yDim=10,ht=10) {
   linear_extrude(height=ht) hull() {
      translate([xDim/2-cornerRad,
                 yDim/2-cornerRad,0]) circle(r=cornerRad);
      translate([-1*xDim/2+cornerRad,
                 yDim/2-cornerRad,0]) circle(r=cornerRad);
      translate([xDim/2-cornerRad,
                 -1*yDim/2+cornerRad,0]) circle(r=cornerRad);
      translate([-1*xDim/2+cornerRad,
                 -1*yDim/2+cornerRad,0]) circle(r=cornerRad);
   }
}

/* roundShapedBox() - rounded corner box that tapers
 *
 * Note: In typical use for these bins, the *bottom* of this box ends up
 *       being the top of the bin.
 */
module roundShapedBox(cornerRad=2,
                      xDimTop=54,
                      yDimTop=80,
                      xDimBottom=52,
                      yDimBottom=77,
                      ht=46.5/2,
                      wallThick=2)
{
   linear_extrude(height=ht,
                  scale=[xDimTop/xDimBottom,yDimTop/yDimBottom])
   difference() {
      hull() {
         translate([xDimBottom/2-cornerRad,
                    yDimBottom/2-cornerRad,0]) circle(r=cornerRad);
         translate([-1*xDimBottom/2+cornerRad,
                    yDimBottom/2-cornerRad,0]) circle(r=cornerRad);
         translate([xDimBottom/2-cornerRad,
                    -1*yDimBottom/2+cornerRad,0]) circle(r=cornerRad);
         translate([-1*xDimBottom/2+cornerRad,
                    -1*yDimBottom/2+cornerRad,0]) circle(r=cornerRad);
      }
      hull() {
         translate([xDimBottom/2-cornerRad-wallThick,
                    yDimBottom/2-cornerRad-wallThick,0]) circle(r=cornerRad);
         translate([-1*xDimBottom/2+cornerRad+wallThick,
                    yDimBottom/2-cornerRad-wallThick,0]) circle(r=cornerRad);
         translate([xDimBottom/2-cornerRad-wallThick,
                    -1*yDimBottom/2+cornerRad+wallThick,0]) circle(r=cornerRad);
         translate([-1*xDimBottom/2+cornerRad+wallThick,
                    -1*yDimBottom/2+cornerRad+wallThick,0]) circle(r=cornerRad);
      }
   }
}


/**************** DEPRECATED ********************/
module OLDharborFreightMediumFullHt(locations=[],outlineScale=1.2) {
   offsetFromTop = 0.1; /* amount of space to move the outline from the top of the form; helps keep model clean */

   /* flip right-side up and place on XY plane */
   translate([0,0,46.5]) rotate([180,0,0]) {
      /* parallel-sided box, complete bottom */
      roundShapedBox(xDimTop=54, yDimTop=80, xDimBottom=54,
                     yDimBottom=80, ht=46.5, wallThick=1.6);
      translate([0,0,46.5-1.2]) roundBoxBottom(xDim=54,yDim=80,ht=1.2);

      /* spaces to hold ships */
      difference() {
         union() {
            /* base form */
            for (loc = locations) {
                translate([0,0,offsetFromTop]) translate(loc[0]) rotate(loc[1])
                   blankOutline(height=46.5-offsetFromTop, outlineScale=outlineScale) children();
            }
         }
         union() {
            /* what will be differenced out */
            for (loc = locations) {
                translate(loc[0]) rotate(loc[1]) children();
            }
         }
      }
   }
}

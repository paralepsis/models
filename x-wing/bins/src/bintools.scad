/* bintools.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

$fn=60;

/* Harbor Freight Small
 * 46.5mm tall
 * 48.6mm tall with legs
 * 54mm wide
 * 39.25mm length
 */

/* harborFreightSmallFullHt -- see medium versions below for comments.
 */
module harborFreightSmallFullHt(locations=[],inset=0,bottomThick=1.2) {
   solidBottomBox(xDim=39.25,yDim=54,ht=46.5,locations=locations,inset=inset,
                  bottomThick=bottomThick)
      children();
}

/* Harbor Freight Medium
 * 46.5mm tall
 * 48.6mm tall with legs
 * 80mm wide, 77 bottom
 * 54mm length, 52 bottom
 */

/* harborFreightMediumFullHt(locations)
 *
 * locations -- an array of pairs of triples specifying a translation and
 *              rotation of the children().
 *              e.g., locations = [[[0,0,0], [0,0,0]],
 *                                 [[5.5, 21.3,0], [0,0,0]],
 *                                 [[-5.5, -21.3, 0],[0,0,0]]];
 *
 * outlineScale -- scaling of the region around the blank. 1.2 is default.
 */
module harborFreightMediumFullHt(locations=[],inset=0,filled=0,bottomThick=1.2,wallThick=1.5) {
   solidBottomBox(xDim=54,yDim=80,ht=46.5,locations=locations,
                            inset=inset, bottomThick=bottomThick, 
                            wallThick=wallThick,filled=filled)
      children();
}

module harborFreightMediumHalfHt(locations=[],cornerRad=3.75,filled=0,bottomThick=1.2,inset=0) {
   solidBottomBox(xDim=54,yDim=80,ht=46.5/2,bottomThick=bottomThick,inset=inset,
                  locations=locations,filled=filled,cornerRad=cornerRad) children();
}

/* harborFreightLargeHalfHt(locations)
 *
 * See above for description of locations variable
 *
 * Dimensions (from Kariko83)
 *   46.5mm tall
 *   48.6mm tall with legs
 *   109.25mm wide
 *   80mm length
 */
module harborFreightLargeHalfHt(locations=[],inset=0,filled=0,bottomThick=1.2) {
   solidBottomBox(xDim=80,yDim=109.25,ht=46.5/2,locations=locations,
                  inset=inset,filled=filled,bottomThick=bottomThick) children();
}

/* stanleyMediumFullHt(locations)
 *
 * Dimensions:
 * - 40 tall (no legs)
 * - 79.75mm long
 * - 54.5mm wide at top (52.5 at bottom)
 * - 3.5mm corner radius
 * - 1mm inset
 */
module stanleyMediumFullHt(locations=[],
                           cornerRad=3.5,
                           filled=0,
                           bottomThick=1.2,
                           inset=1)
{
   solidBottomBox(xDim=54.5,yDim=79.75,ht=40,filled=filled,
                  bottomThick=bottomThick,inset=inset, cornerRad=cornerRad,
                  locations=locations) children();
}

module harborFreightLargeThirdHt(locations=[]) {
   solidBottomBox(xDim=80,yDim=109.25,ht=46.5/3,locations=locations) children();
}

module harborFreightLargeTwoThirdHt(locations=[]) {
   solidBottomBox(xDim=80,yDim=109.25,ht=2*46.5/3,locations=locations) children();
}

module harborFreightLargeFullHt(locations=[],inset=0) {
   solidBottomBox(xDim=80,yDim=109.25,ht=46.5,locations=locations,inset=inset)
      children();
}

module harborFreightHugeFullHt(locations=[],inset=0) {
   solidBottomBox(xDim=160,yDim=109.25,ht=46.5,locations=locations,inset=inset)
      children();
}

/* solidBottomBox() -- generate a rounded, solid-bottom box with children
 *                     used to generate slots for holding ships.
 *
 * locations -- an array of pairs of triples specifying a translation and rotation of the children().
 *              e.g., locations = [[[0,0,0], [0,0,0]],
 *                                 [[5.5, 21.3,0], [0,0,0]],
 *                                 [[-5.5, -21.3, 0],[0,0,0]]];
 *
 * outlineScale -- scaling of the region around the blank. 1.2 is default.
 *
 * NOTE: Assumes that children are "upside down" (i.e., the XY plane is meant to be top of box) so that
 *       models can drop in "bottom up".
 */
module solidBottomBox(xDim=10, yDim=10, ht=10, inset=0,filled=0,
                      locations=[],outlineScale=1.2,cornerRad=3.75,
                      bottomThick=1.2,wallThick=1.6)
{
   offsetFromTop = 0.1; /* amount of space to move the outline from the top of the form; helps keep model clean */

   /* flip right-side up and place on XY plane */
   translate([0,0,ht]) rotate([180,0,0]) {
      /* parallel-sided box, complete bottom */
      /* Note: because of the way we're building it, the "top" is the bottom
       *       from the roundShapedBox perspective.
       */
      roundShapedBox(xDimTop=xDim - inset, yDimTop=yDim - inset,
                     xDimBottom=xDim, yDimBottom=yDim,
                     ht=ht, wallThick=wallThick, cornerRad=cornerRad);
      translate([0,0,ht-bottomThick]) roundBoxBottom(xDim=xDim-inset,yDim=yDim-inset,
                                             ht=bottomThick, cornerRad=cornerRad);

      /* spaces to hold ships */
      difference() {
         union() {
            /* base form */
            if (filled) {
               fillHtDiff = 2; // difference between top of box and top of fill

               /* Note: just fill with the same shape for the filled version */
               hull() translate([0,0,bottomThick-0.1+fillHtDiff]) roundShapedBox(xDimTop=xDim - inset, yDimTop=yDim - inset,
                                     xDimBottom=xDim, yDimBottom=yDim,
                                     ht=ht-bottomThick+0.1-fillHtDiff, wallThick=1.6, cornerRad=cornerRad);
            }
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
module roundBox(cornerRad=3.75,xDim=10,yDim=10,ht=10,wallThick=1.2) {
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
module roundBoxBottom(cornerRad=3.75,xDim=10,yDim=10,ht=10) {
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
module roundShapedBox(cornerRad=3.75,
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

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 3
 *  c-basic-offset: 3
 * End:
 *
 * vim: ts=8 sts=3 sw=3 expandtab
 */

// Harbor Frieght Medium
// 46.5mm tall
// 48.6mm tall with legs
// 80mm wide, 77 bottom
// 54mm length, 52 bottom

/* blankCutout() - extrudes an outline of children() to a given height
 *                 and then difference()s out the children(), leaving
 *                 only the outline.
 */
module blankCutout(height=48.6) {
   difference() {
      linear_extrude(height=height) outline() projection(cut=false) children();
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

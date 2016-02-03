// import("../orig/x-wing-blank.stl");

// Harbor Frieght Medium
// 46.5mm tall
// 48.6mm tall with legs
// 80mm wide, 77 bottom
// 54mm length, 52 bottom

$fn=20;

double_x_wing_box_solid_bottom(bling=0);


module double_x_wing_box_solid_bottom(ht=46.5/2, bling=1) {
   translate([0,0,ht]) rotate([180,0,0]) difference() {
      union() {
         roundShapedBox(xDimTop=53, yDimTop=78.5, xDimBottom=54,
                        yDimBottom=80, ht=ht, wallThick=1.6);
         // roundBox(xDim=54,yDim=80,ht=ht);

         // translate([0,0,ht-1.2]) roundBoxBottom(xDim=54,yDim=80,ht=1.2);
         translate([0,0,ht-1.2]) roundBoxBottom(xDim=53,yDim=78.5,ht=1.2);
      
         // NOTE: outline does not *quite* come to top of box in this design!
         translate([1.1,-15.8,0.1]) blankOutline(height=ht-0.1)
            import("../orig/x-wing-blank.stl");
         rotate([0,0,180]) translate([1.1,-15.8,0.1]) blankOutline(height=ht-0.1)
            import("../orig/x-wing-blank.stl");
      }
      union() {
         translate([1.1,-15.8,0]) import("../orig/x-wing-blank.stl");
         rotate([0,0,180]) translate([1.1,-15.8,0])
            import("../orig/x-wing-blank.stl");

         // Add icons to the ends
         if (bling) {
            translate([0,80/2-0.2,12.5]) rotate([-90,0,0]) scale([0.28,0.28,0.2]) import("../orig/icons/rebel-t70.stl");
            translate([0,-80/2+0.2,12.5]) rotate([-90,0,180]) scale([0.28,0.28,0.2]) import("../orig/icons/rebel-t70.stl");
         }
      }
   }

}


module blankOutline(height=48.6) {
   linear_extrude(height=height) outline() projection(cut=false) children();
}

module blankCutout(height=48.6) {
   difference() {
      linear_extrude(height=height) outline() projection(cut=false) children();
      children();
   }
}

/* outline() - generates a projected outline of an object
 * scale was 1.1
 */
module outline(outlineIterations = 30,outlineScale=1.5) {
   for (i=[0:outlineIterations]) {
      translate([outlineScale*cos(360*i/outlineIterations),
                 outlineScale*sin(360*i/outlineIterations),0]) children();
   }
}


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

/* huge-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <bintools.scad>

width = 10;
height = 2.1;

// Harbor Freight Medium
// 80mm wide, 77 bottom
// 54mm length, 52 bottom

% translate([-80/2,-54/2,0]) roundShapedBox(xDimTop=77,yDimTop=52,xDimBottom=77,yDimBottom=52,ht=3,wallThick=3);

intersection() {
   difference() { 
      union() { 
         hugeFrame();
      }
      union() { 
         translate([0,54,-0.5]) cylinder(r=14,h=height+1);
         translate([0,-54,-0.5]) cylinder(r=14,h=height+1);
      }
   }
   translate([0,0,-0.5]) roundBoxBottom(cornerRad=30,xDim=80*2,yDim=54*2,ht=10);
}
   
module hugeFrame() {
   difference() {
      roundBoxBottom(cornerRad=30,xDim=80*2,yDim=54*2,ht=height);
      translate([0,0,-0.5]) roundBoxBottom(cornerRad=30-8,xDim=(80-width)*2,
                                           yDim=(54-width)*2,ht=height+1);
   }

   translate([0,0,height/2]) cube(center=true, size=[80*2,width,height]);
   translate([0,0,height/2]) cube(center=true, size=[width,54*2,height]);
   translate([0,54,0]) cylinder(r=24,h=height);
   translate([0,-54,0]) cylinder(r=24,h=height);
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

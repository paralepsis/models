include <he_mount_generator.scad>
use <bevel.scad>
use <attach.scad>

carHeight = 71.8;
carWidth  = 85;
carThick  = 5;

idlerScrewDia = 5.2;

cornerRad=5;

translate([0,-20,0]) hotSide();

module hotSide() {
   e0 = [[0,0,carThick/2], [0,0,1], 0];
   n0 = [[0,0,carThick/2], [-1,-1,0], 0];
   e1 = [[0,carHeight,carThick/2], [0,0,1], 0];
   n1 = [[0,carHeight,carThick/2], [-1,1,0], 0];
   e2 = [[carWidth,carHeight,carThick/2], [0,0,1], 0];
   n2 = [[carWidth,carHeight,carThick/2], [1,1,0], 0];
   e3 = [[carWidth,0,carThick/2], [0,0,1], 0];
   n3 = [[carWidth,0,carThick/2], [1,-1,0], 0];

   rotate([90,0,0])
      difference() {
         union() {
            linear_extrude(height=5)
               polygon(points=[[0,0],[0,carHeight],[carWidth,carHeight],[carWidth,0]]);

         }
         bevel(e0,n0,cr=cornerRad,cres=10,l=carThick);
         bevel(e1,n1,cr=cornerRad,cres=10,l=carThick);
         bevel(e2,n2,cr=cornerRad,cres=10,l=carThick);
         bevel(e3,n3,cr=cornerRad,cres=10,l=carThick);
      }
}

module carHoles() {
     // Remove the holes for the corners. -- ADJUSTED DEPTHS -- RBR
     // Bottom left.
     translate([cornerRad, .1, cornerRad])
          hull() {
          rotate([90,0,0])
               cylinder(d=idlerScrewDia, h=cBotTopHoleDepth + .2, $fn=100);
          translate([0, 0, cBotTopHoleLength])
               rotate([90,0,0])
               cylinder(d=idlerScrewDia, h=cBotTopHoleDepth + .2, $fn=100);
     }

     // Bottom right.
     translate([carWidth - cornerRad, .1, cornerRad])
          hull() {
          rotate([90,0,0])
               cylinder(d=idlerScrewDia, h=cBotTopHoleDepth + .2, $fn=100);
          translate([0, 0, cBotTopHoleLength])
               rotate([90,0,0])
               cylinder(d=idlerScrewDia, h=cBotTopHoleDepth + .2, $fn=100);
     }

     // Top left.
     translate([cornerRad, .1, carHeight - cornerRad])
          rotate([90, 0, 0])
          cylinder(d=idlerScrewDia, h=carThick + .2, $fn=100);

     // Top right.
     translate([carWidth - cornerRad, .1, carHeight - cornerRad])
          rotate([90, 0, 0])
          cylinder(d=idlerScrewDia, h=carThick + .2, $fn=100);
}


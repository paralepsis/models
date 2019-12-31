inWidth  = 64;
inDepth  = 65;
inHeight = 99; // was 105

extThick = 2.0;

screwX1  = 12;
screwX2  = 52;
screwZ2  = 79;
screwDepth = 54;

cutHeight = 30;

epsilon=0.01;
$fn=20;

difference() {
   /* main form */
   translate([-0.5*inWidth-extThick, -0.5*inDepth-extThick,0])
      cube([inWidth+2*extThick, inDepth+extThick, inHeight+extThick]);

   /* interior and back removal */
   translate([-0.5*inWidth, -0.5*inDepth,-1*epsilon])
      cube([inWidth, inDepth+epsilon, inHeight+epsilon]);

   /* top screws */
   translate([screwX1 -0.5*inWidth, screwDepth - 0.5*inDepth, 0]) hull() {
         translate([-1,0,0]) cylinder(d=4.2,h=inHeight+10);
         translate([1,0,0]) cylinder(d=4.2,h=inHeight+10);
      }
   translate([screwX2 -0.5*inWidth, screwDepth - 0.5*inDepth, 0]) hull() {
         translate([-1,0,0]) cylinder(d=4.2,h=inHeight+10);
         translate([1,0,0]) cylinder(d=4.2,h=inHeight+10);
      }

   /* side screws */
   if (0) translate([epsilon, screwDepth - 0.5*inDepth, screwZ1]) rotate([0,90,0])
      hull() {
         translate([-1,0,0]) cylinder(d=4.2,h=inWidth+10);
         translate([1,0,0]) cylinder(d=4.2,h=inWidth+10);
      }
   translate([epsilon, screwDepth - 0.5*inDepth, screwZ2]) rotate([0,90,0])
      hull() {
         translate([-1,0,0]) cylinder(d=4.2,h=inWidth+10);
         translate([1,0,0]) cylinder(d=4.2,h=inWidth+10);
      }

   airCuts();
   sideCut();
}

module airCuts() {
   for (i=[0:2]) {
      translate([-0.5*inWidth + 8,-0.5*inDepth+epsilon,15*i+7])
      rotate([90,40,0]) hull() {
         cylinder(r=2.5,h=10);
         translate([0,74,0]) cylinder(r=2.5,h=10);
      }
   }

   translate([-0.5*inWidth + 8,-0.5*inDepth+epsilon,15*3+7])
   rotate([90,40,0]) hull() {
      cylinder(r=2.5,h=10);
      translate([0,54,0]) cylinder(r=2.5,h=10);
   }

   translate([-0.5*inWidth + 8,-0.5*inDepth+epsilon,15*4+7])
   rotate([90,40,0]) hull() {
      cylinder(r=2.5,h=10);
      translate([0,34,0]) cylinder(r=2.5,h=10);
   }

   translate([-0.5*inWidth + 8,-0.5*inDepth+epsilon,15*5+7])
   rotate([90,40,0]) hull() {
      cylinder(r=2.5,h=10);
      translate([0,14,0]) cylinder(r=2.5,h=10);
   }
}

module sideCut() {
   translate([0,-0.5*inDepth-1*extThick-1*epsilon,-1*epsilon]) {
      translate([12,inDepth+extThick+epsilon,cutHeight-12]) rotate([90,0,0]) cylinder($fn=50,r=12,h=inDepth+extThick+2*epsilon);
      cube([12+epsilon,inDepth+extThick+2*epsilon,cutHeight-12]);
      translate([12,0,0]) cube([inWidth,inDepth+extThick+2*epsilon,cutHeight]);
   }
}

// % import("./filament-out.stl");

$fn=20;
bodyThick=14;
bodyHt=58;
bodyWidth=36;
filamentDia=1.9;
filamentPathLen=28;

epsilon=0.1;
inLen=15; // note this is a little goofed because of the difference() */



if (1) {
   difference() {
      body();
      inside();
      cutouts();
   }

   translate([35,12.5,0]) intersection() {
      difference() {
         body();
         cutouts(boltsOnly=1);
      }
      inside(smaller=0.5);
   }
}
else {
   % body();
   // inside();
   cutouts();
}

module cutouts(boltsOnly=0) {
   if (!boltsOnly) {
      translate([0,1,0]) filamentPath();
      translate([0,1,inLen+1]) switchSpace();
   }

   /* 14mm bolts, I think (?) -- but I'm going to adjust later... */
   translate([-21,3.9,45]) rotate([-90,0,0]) capBoltHole();
   translate([-21,3.9,8]) rotate([-90,0,0]) capBoltHole();
}

module inside(smaller=0) {
   insideThick=3;
   translate([-30,-5.5,0]) rotate([90,0,0]) hull() {
      translate([6+smaller,6+smaller,0]) cylinder(r=3,h=insideThick);
      translate([6+smaller,bodyHt-6-smaller,0]) cylinder(r=3,h=insideThick);
      translate([bodyWidth-6-smaller,6+smaller,0]) cylinder(r=3,h=insideThick);
      translate([bodyWidth-6-smaller,bodyHt-6-smaller,0]) cylinder(r=3,h=insideThick);
   }
}

module body() {

   translate([-30,0,0]) intersection() {
      translate([0,bodyThick/2,0]) rotate([90,0,0]) hull() {
         translate([3,3,0]) cylinder(r=3,h=bodyThick+2);
         translate([3,bodyHt-3,0]) cylinder(r=3,h=bodyThick+2);
         translate([bodyWidth-3,3,0]) cylinder(r=3,h=bodyThick+2);
         translate([bodyWidth-3,bodyHt-3,0]) cylinder(r=3,h=bodyThick+2);
      }

      translate([9,-bodyThick/2,0]) mirror([0,1,0]) linear_extrude(height=bodyHt) {
         outerWallThick=10;
         polygon(points=[[-9,0],[-4.5,0],[-3.5,1],[3.5,1],[4.5,0],
                         [bodyWidth-9,0], [bodyWidth-9,-bodyThick],
                         [-9,-bodyThick]]);
      }
   }
}

module capBoltHole() {
   translate([0,0,-20.3]) cylinder($fn=30,d=5.2,h=20);
   cylinder($fn=30,d=9.2,h=20);
}

module filamentPath() {
   tubeDia=4.5;
   outLen=15;

   difference() {
      translate([0,0,-epsilon]) cylinder(d=tubeDia,h=inLen+2*epsilon);
      translate([0,0,inLen]) rotate_extrude() translate([filamentDia,0,0]) circle(d=filamentDia);
   }
   translate([0,0,inLen]) cylinder(d=filamentDia,h=filamentPathLen);

   translate([0,0,inLen+filamentPathLen]) cylinder(d=tubeDia,h=outLen+epsilon);
}

module switchSpace() {
   switchThick=6;
   switchLen=23.5;
   switchHt=16;
   wiringHt=10;
   wiringThick=10;

   translate([-switchHt-filamentDia/2-1,-switchThick/2-5,0]) {
      /* switch itself */
      cube([switchHt,switchThick+5,switchLen]);

      /* roller */
      translate([switchHt,switchThick+5,switchLen-3]) rotate([90,0,0]) cylinder(d=6,h=switchThick+2);

      /* wire space */
      translate([-wiringHt,-(wiringThick-switchThick)/2-2+5,0.5]) cube([wiringHt+epsilon,wiringThick,switchLen-1]);

      /* screws, M2.5 */
      translate([3,switchThick+6,5]) rotate([90,0,0]) cylinder(d=2.7,h=15);
      translate([3,switchThick+8.3,5]) rotate([90,0,0]) cylinder(d=4.75,h=2.1);
      translate([3,switchThick+6,15]) rotate([90,0,0]) cylinder(d=2.7,h=15);
      translate([3,switchThick+8.3,15]) rotate([90,0,0]) cylinder(d=4.75,h=2.1);

      /* wires out */
      // translate([-6,3+5,-inLen-2-epsilon]) cylinder(d=6,h=inLen+3+epsilon);
      translate([10,3+5,-inLen-3-epsilon]) rotate([0,-34,0]) cylinder(d=5,h=inLen+3+epsilon+10);
   }
}

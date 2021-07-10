spacerLen      = 14;
spacerDia      = 8;
spacerDist     = 31;
spacerHt       = 6;
spacerBarHt    = 2;
spacerBarThick = 4;

blTouchDist    = 18;
blTouchDia     = 13.5;
blTouchHt      = 8;

blTouchMountOffX = 46;
blTouchMountOffY = 26+blTouchDia/2+0;

$fn=40;

complete();

module complete() {
   heatsinkSpacer();
   translate([blTouchMountOffX,0,0])
      rotate([90,0,0]) blTouchMount();

   diffX = blTouchMountOffX - (spacerDist+spacerDia/2);
   translate([spacerDist+spacerDia/2-1,-blTouchHt,0])
      cube([diffX+2,blTouchHt,spacerLen]);

   hull() {
      translate([10,0,0]) cylinder(r=spacerBarHt,h=4);
      translate([blTouchMountOffX+blTouchDist+blTouchDia/2-1,0,0]) cylinder(r=spacerBarHt,h=4);
   }
}

module blTouchMount() {
   translate([0,blTouchMountOffY,0]) difference() {
      union() {
         hull() {
            scale([1,0.9,1]) cylinder(d=blTouchDia+2,h=blTouchHt);
            translate([blTouchDist,0,0]) scale([1,0.9,1])
               cylinder(d=blTouchDia+2,h=blTouchHt);

            translate([-(blTouchDia+2)/2,-blTouchMountOffY,0])
               cube([blTouchDist+blTouchDia+2,blTouchMountOffY,blTouchHt]);
         }
      }
      translate([0,0,-1]) cylinder(d=3.3,h=blTouchHt+2);
      translate([blTouchDist,0,-1]) cylinder(d=3.3,h=blTouchHt+2);
      translate([blTouchDist/2,0,-1]) cylinder(d=blTouchDia,h=blTouchHt+2);
      translate([blTouchDist/2-blTouchDia/2,0,-1])
         cube([blTouchDia,blTouchDia,blTouchHt+2]);
   }
}

module heatsinkSpacer() {
   difference() {
      union() {
         singleSpacer();
         translate([spacerDist,0,0]) singleSpacer();
         translate([-spacerDia/2,-spacerBarHt,0])
            cube([spacerDist+spacerDia, spacerBarHt, spacerLen]);
      }
   }
}

module singleSpacer() {
   difference() {
      union() {
         translate([0,-spacerHt,0]) cylinder(d=spacerDia, h=spacerLen);
         translate([-spacerDia/2,-spacerHt,0])
            cube([spacerDia,spacerHt, spacerLen]);
      }
      translate([0,-spacerHt,-1]) cylinder(d=3.2, h=spacerLen+2);
   }
}

if (0) {
cylinder(d=spacerDia, h=spacerLen);
translate([spacerDist,0,0]) cylinder(d=spacerDia, h=spacerLen);
translate([-spacerDia/2,0,0]) cube([spacerDist+spacerDia/2+15,spacerDia/2,spacerLen]);
translate([spacerDist+15-7,0,0]) cube([7,spacerDia/2,spacerLen+20]);
translate([15,0,20]) cube([spacerDist,spacerDia/2,spacerLen]);
translate([15,0,20+spacerLen/2]) rotate([-90,0,0]) cylinder(d=spacerLen, h=spacerDia/2);
}

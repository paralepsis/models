spacerLen  = 10;
spacerDia  = 8;
spacerDist = 32;

$fn=40;

cylinder(d=spacerDia, h=spacerLen);
translate([spacerDist,0,0]) cylinder(d=spacerDia, h=spacerLen);
translate([-spacerDia/2,0,0]) cube([spacerDist+spacerDia/2+15,spacerDia/2,spacerLen]);
translate([spacerDist+15-7,0,0]) cube([7,spacerDia/2,spacerLen+20]);
translate([15,0,20]) cube([spacerDist,spacerDia/2,spacerLen]);
translate([15,0,20+spacerLen/2]) rotate([-90,0,0]) cylinder(d=spacerLen, h=spacerDia/2);

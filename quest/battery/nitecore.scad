xId = 122;
yId = 59.5;
zOd = 10;

wallThick = 1.7;
botThick  = 0.9;

xOd = xId + 2*wallThick;
yOd = yId + 2*wallThick;

difference() {
   union() {
      translate([-xOd/2, -yOd/2, ]) cube([xOd, yOd, zOd]);
      translate([12,-yOd/2,0]) cube([5, yOd, 14]);
      translate([12+5+13,-yOd/2,0]) cube([5, yOd, 14]);
      mirror([1,0,0]) translate([12,-yOd/2,0]) cube([5, yOd, 14]);
      mirror([1,0,0]) translate([12+5+13,-yOd/2,0]) cube([5, yOd, 14]);
   }
   union() /* diff */ {
      translate([-xId/2, -yId/2, botThick]) cube([xId, yId, 20]);
      translate([-xOd/2-3, -(yOd-10)/2,-1]) cube([5, yOd-10, 20]);
      hull() {
         translate([xId/2-10,yId/2-12,-1]) cylinder(r=2,h=22);
         translate([-xId/2+10, yId/2-12,-1]) cylinder(r=2,h=22);
         translate([-xId/2+10,-yId/2+12,-1]) cylinder(r=2,h=22);
         translate([xId/2-10, -yId/2+12,-1]) cylinder(r=2,h=22);
      }
   }
}

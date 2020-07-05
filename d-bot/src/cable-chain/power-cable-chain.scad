partHt = 40;
outerWallThick = 8; /* this is how far we go from center towards outside
                       of the printer */
boltHoleDist = 19; /* distance between the holes on the cable chain */

module chainMountHoles() {
   translate([0,-11,20]) rotate([0,90,0]) union() {
      translate([0,0,-20]) cylinder($fn=6,r=4.2,h=20);
      translate([0,0,0.2]) cylinder($fn=30,r=2.1,h=20);

      translate([0,-1*boltHoleDist,-20]) cylinder($fn=6,r=4.2,h=20);
      translate([0,-1*boltHoleDist,0.2]) cylinder($fn=30,r=2.1,h=20);
   }
}


if (1) difference() {
   linear_extrude(height=partHt) {
      polygon(points=[[-9,0],[-4.5,0],[-3.5,1],[3.5,1],[4.5,0],
                      [outerWallThick,0], [outerWallThick,-40],
                      [0,-40],[-9,-10]]);
   }

   /* bolts to mount to printer */
   translate([0,-4,partHt/5]) rotate([90,0,0])
      capBoltHole();
   translate([0,-4,4*partHt/5]) rotate([90,0,0])
      capBoltHole();

   /* bolts to mount cable chain */
   chainMountHoles();
}

module capBoltHole() {
   translate([0,0,-60.2]) cylinder($fn=30,d=5.2,h=60);
   cylinder($fn=30,d=9.2,h=60);
}

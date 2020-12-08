screenDimX = 85.5;
screenDimY = 57;
bezelWid   = 9;
boltOffX   = 3.5;
boltOffY   = 3.0;
depth      = 3.0;
bezelRad   = 3;

standoffHt = 12;

$fn=60;

// topPlate();
midPlate();

module topPlate() {
   difference() {
      plateForm();
      boltHoles();
      screenHole();
      solderVoid();
   }
}

module midPlate() {
   difference() {
      union() {
         plateForm(h=2.0);
         standoffs();
      }
      connectorVoid();
      boltHoles();

      translate([0,27,-0.1]) cube([55,28,20]);
      translate([-2,7,-0.1]) cube([30,15,20]);
   }
}

module connectorVoid() {
   translate([screenDimX+1.2, 1, -0.1]) cube([bezelWid-1.2+0.1, screenDimY-2, 20]);
}



module plateForm(h=depth) {
   translate([-bezelWid, -bezelWid, 0]) hull() {
      translate([bezelRad,bezelRad,0]) cylinder(r=bezelRad,h=h);
      translate([screenDimX + 2*bezelWid - bezelRad,bezelRad,0])
         cylinder(r=bezelRad,h=h);
      translate([screenDimX + 2*bezelWid - bezelRad,
                 screenDimY + 2*bezelWid - bezelRad,0])
         cylinder(r=bezelRad,h=h);
      translate([bezelRad,
                 screenDimY + 2*bezelWid - bezelRad,0])
         cylinder(r=bezelRad,h=h);
   }
}

module boltHoles() {
   translate([boltOffX, -boltOffY, -0.1]) cylinder(d=3.2, h=20);
   translate([screenDimX - boltOffX, -boltOffY, -0.1]) cylinder(d=3.2, h=20);
   translate([boltOffX, screenDimY + boltOffY, -0.1]) cylinder(d=3.2, h=20);
   translate([screenDimX - boltOffX, screenDimY + boltOffY, -0.1])
      cylinder(d=3.2, h=20);
}

module standoffs() {
   translate([boltOffX, -boltOffY, -0.0]) simpleStandoff();
   translate([screenDimX - boltOffX, -boltOffY, -0.0]) simpleStandoff();
   translate([boltOffX, screenDimY + boltOffY, -0.0]) simpleStandoff();
   translate([screenDimX - boltOffX, screenDimY + boltOffY, -0.0])
      simpleStandoff();
}

module screenHole() {
   translate([0,0,-0.1]) cube([screenDimX, screenDimY, 20]);
}

module solderVoid() {
   translate([screenDimX+1.2, 1, 1.5]) cube([bezelWid-1.2+0.1, screenDimY-2, 20]);
}

module heatsetStandoff() {
   difference() {
      cylinder(d=7, h=standoffHt);
      translate([0,0,standoffHt-5+0.1]) cylinder(d2=3.65, d1=3.4, h=5);
   }
}

module simpleStandoff() {
      cylinder(d=7, h=standoffHt);
}

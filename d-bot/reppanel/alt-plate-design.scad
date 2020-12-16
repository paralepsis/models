/* This is a "plate" style "enclosure" for the RepPanel with PCB from PCR.
 * Typically seen for keyboards, I guess.
 *
 * Using M2 screws for assembly b/c that's what I have around.
 * - M2 x 10mm (len) x 3.5mm (dia) heat set inserts.
 *
 * Note to self: see this for M2 heat set nut void:
 *   ../../keyboards/minimacro5/enclosure-3+1+oled.scad
 *
 * Bottom needs 10mm clearance near controller.
 */
screenDimX  = 85.5;
screenDimY  = 57;
bezelWid    = 9;
boltOffX    = 3.75;
boltOffY    = 3.0;
depth       = 3.6;
bezelRad    = 3;
boltHoleRad = 1.15; // M2 with some slop

standoffHt = 11.5;

$fn=60;

topPlate();
// midPlate();
// bottomPlate();

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

module bottomPlate() {
   difference() {
      union() {
         plateForm(h=2.0);
         simpleStandoffs(ht=10);
      }
      boltHoles();
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
   translate([boltOffX, -boltOffY, -0.1]) cylinder(r=boltHoleRad, h=20);
   translate([screenDimX - boltOffX, -boltOffY, -0.1]) cylinder(r=boltHoleRad, h=20);
   translate([boltOffX, screenDimY + boltOffY, -0.1]) cylinder(r=boltHoleRad, h=20);
   translate([screenDimX - boltOffX, screenDimY + boltOffY, -0.1])
      cylinder(r=boltHoleRad, h=20);
}

module simpleStandoffs(ht=10) {
   translate([boltOffX, -boltOffY, -0.0]) simpleStandoff(ht=ht);
   translate([screenDimX - boltOffX, -boltOffY, -0.0]) simpleStandoff(ht=ht);
   translate([boltOffX, screenDimY + boltOffY, -0.0]) simpleStandoff(ht=ht);
   translate([screenDimX - boltOffX, screenDimY + boltOffY, -0.0])
      simpleStandoff(ht=ht);
}

module standoffs() {
   translate([boltOffX, -boltOffY, -0.0]) heatsetStandoff();
   translate([screenDimX - boltOffX, -boltOffY, -0.0]) heatsetStandoff();
   translate([boltOffX, screenDimY + boltOffY, -0.0]) heatsetStandoff();
   translate([screenDimX - boltOffX, screenDimY + boltOffY, -0.0])
      //simpleStandoff();
      heatsetStandoff();
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
      translate([0,0,standoffHt-10.5+0.1]) cylinder(d2=3.65, d1=3.4, h=10.5);
   }
}

module simpleStandoff(ht=standoffHt) {
   difference() {
      cylinder(d=7, h=standoffHt);
      translate([0,0,-0.1]) cylinder(r=boltHoleRad, h=standoffHt+0.2);
   }
}


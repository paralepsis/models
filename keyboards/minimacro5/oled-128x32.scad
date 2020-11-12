bodyWid     = 12;
bodyLen     = 38;
bodyDep     = 3;
windowLen   = 26;
windowOff   = 5;
windowDep   = 0.5;

epsilon     = 0.1;

$fn=20;

oled128x32 =[[0,4], [0,2.8], [1,2.8], [1,0.5], [8,0.5], [8,0], [33.5, 0], [33.5,2.8], [34.5, 2.8], [34.5, 0.5], [43, 0.5], [43,4]];


/* old version */
if (0) difference() {
   simpleForm();
   window();
}

difference() {
   simpleForm();
   translate([-1,bodyWid,0]) rotate([90,0,0]) linear_extrude(height=bodyWid) polygon(points=oled128x32);
}
   
// window();

module simpleForm(h=4) {
   hull() {
      translate([-2,-2,0]) cylinder(r=2,h=h);
      translate([-2,2+bodyWid,0]) cylinder(r=2,h=h);
      translate([2+bodyLen,2+bodyWid,0]) cylinder(r=2,h=h);
      translate([2+bodyLen,-2,0]) cylinder(r=2,h=h);
   }
}

module window() {
   translate([-1,0,2.8]) cube([bodyLen+7,bodyWid,2.8]); /* space for PCB */
   // translate([0,0,windowDep]) cube([windowLen+6.5,bodyWid,bodyDep-windowDep]);
   translate([0,0,windowDep]) cube([windowLen+6.5,bodyWid,bodyDep-windowDep]);
   translate([windowLen+7.5,0,windowDep]) cube([bodyLen,bodyWid,bodyDep-windowDep]);
   translate([7,0,-epsilon]) cube([windowLen,bodyWid,windowDep+2*epsilon]); /* opening for viewing */
}


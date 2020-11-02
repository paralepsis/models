bodyWid     = 26;
bodyLen     = 25.4;
bodyDep     = 3;
windowLen   = 25;
windowOff   = 5;
windowDep   = 0.5;

epsilon     = 0.1;

$fn=20;

oled128x32 =[[0,4], [0,2.8], [1,2.8], [1,0.5], [8,0.5], [8,0], [33.5, 0], [33.5,2.8], [34.5, 2.8], [34.5, 0.5], [43, 0.5], [43,4]];


difference() {
   simpleForm();
//   translate([-1,bodyWid,0]) rotate([90,0,0]) linear_extrude(height=bodyWid) polygon(points=oled128x32);
   rough();
}
   
module simpleForm(h=3.5) {
   hull() {
      translate([-2,-2,0]) cylinder(r=2,h=h);
      translate([-2,2+bodyWid,0]) cylinder(r=2,h=h);
      translate([2+bodyLen,2+bodyWid,0]) cylinder(r=2,h=h);
      translate([2+bodyLen,-2,0]) cylinder(r=2,h=h);
   }
}

module rough() {
   translate([0,0,1.5]) cube([bodyLen, bodyWid, bodyDep]);
   translate([0,1.5,0.5]) cube([bodyLen, 20.5, bodyDep]);
   translate([1,8.5,-0.1]) cube([bodyLen-2, 12.5, bodyDep]);
   translate([0,23,0.5]) cube([bodyLen, bodyWid-22, bodyDep]);
}

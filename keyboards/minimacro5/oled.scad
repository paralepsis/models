bodyWid     = 12;
bodyLen     = 38;
bodyDep     = 3;
windowLen   = 26;
windowOff   = 5;
windowDep   = 0.5;

epsilon     = 0.1;

$fn=20;

difference() {
   simpleForm();
   window();
}

module simpleForm(h=2.2) {
   hull() {
      translate([-2,-2,0]) cylinder(r=2,h=h);
      translate([-2,2+bodyWid,0]) cylinder(r=2,h=h);
      translate([2+bodyLen,2+bodyWid,0]) cylinder(r=2,h=h);
      translate([2+bodyLen,-2,0]) cylinder(r=2,h=h);
   }
}

module window() {
   translate([0,0,windowDep+1.2]) cube([bodyLen+5,bodyWid,bodyDep-windowDep]);
   translate([0,0,windowDep]) cube([windowLen+5,bodyWid,bodyDep-windowDep]);
   translate([windowLen+6,0,windowDep]) cube([bodyLen,bodyWid,bodyDep-windowDep]);
   translate([5,0,-epsilon]) cube([windowLen,bodyWid,windowDep+epsilon]);
}


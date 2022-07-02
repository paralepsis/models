panelCaseWid         = 203;
panelCaseToHoleMidPt = 13.5;
panelCaseHoleDistX   = 76;

$fn=50;

difference() {
   base();
   rotate([-40,0,0]) translate([0,0,5]) cutoutForm();
}

module cutoutForm() {
   translate([-panelCaseWid/2,-30,0]) cube([panelCaseWid, 30, 50]);
   for(i=[-1,0,1]) {
      translate([i*panelCaseHoleDistX,-panelCaseToHoleMidPt,0]) hull() {
         translate([0,-1,-15]) cylinder(h=20,d=5.5);
         translate([0,1,-15]) cylinder(h=20,d=5.5);
      }
      translate([i*panelCaseHoleDistX,-panelCaseToHoleMidPt,0]) hull() {
         translate([0,-1,-30]) cylinder(h=25,d=10.5);
         translate([0,1,-30]) cylinder(h=25,d=10.5);
      }
   }
}

module base() {
   // translate([-178/2,-20,0]) cube([178,55,23]);
   hull() {
      translate([-178/2+1,-20+1,0]) cylinder(d=1,h=23);
      translate([178/2-1,-20+1,0]) cylinder(d=1,h=23);

      translate([-178/2+1,19,0]) cylinder(d=1,h=23);
      translate([178/2-1,19,0]) cylinder(d=1,h=23);

      translate([-178/2+1,55,0]) cylinder(d=1,h=5);
      translate([178/2-1,55,0]) cylinder(d=1,h=5);
   }
}



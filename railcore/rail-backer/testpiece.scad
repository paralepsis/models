include <./polyround.scad>

// L bracket form
wid_mm = 19.05;
ht_mm = 19.05;
len_mm = 150;
thk_mm = 3.17; // 1/8"

points = [[0,0,0.2],[wid_mm,0,0.2],[wid_mm,thk_mm,0.2],[thk_mm,thk_mm,0.2],[thk_mm,ht_mm,0.2],[0,ht_mm,0.2]];

// Hole info
holedim_mm = 3;
holespace_mm = 25; // center to center
htoff_mm = 10; // measured from angle side
widoff_mm = 10; // measured from "front" side

if (1) {
   rotate([0,-90,0])
   bracket();
   translate([0,0,0]) cylinder(r=4,h=0.3,$fn=40);
   translate([wid_mm,0,0]) cylinder(r=4,h=0.3,$fn=40);
   translate([0,len_mm,0]) cylinder(r=4,h=0.3,$fn=40);
   translate([wid_mm,len_mm,0]) cylinder(r=4,h=0.3,$fn=40);
}

module bracket() {
   difference() {
      rotate([-90,0,0]) translate([0,0,0]) linear_extrude(height=len_mm) polygon(polyRound(points,20));
      for (i=[0:20]) {
         translate([-1,widoff_mm+i*holespace_mm,-htoff_mm]) rotate([0,90,0]) cylinder(h=5,d=holedim_mm,$fn=40);
      }
   }
}

ringID=95;
ringOD=95+2*1.7;

topID=85;
topOD=85+2*1.7;

$fn=60;

difference() {
   union() {
      cylinder(d=ringOD, h=120);
      translate([0,-topOD/2,0]) cube([100,topOD,50]);
   }
   union() /* remove */ {
      translate([0,0,0.9]) cylinder(d=ringID, h=140);
      translate([ringOD/2+2,-topID/2,0.9]) cube([47,topID,60]);
      translate([0,60,30]) rotate([90,0,0]) hull() {
         cylinder(d=40,h=120);
         translate([-20,0,0]) cube([40,100,120]);
      }
   }
}


/* parameters related to mounting to block */
widY = 22.6;
offX = 4.75;

/* parameters related to mounting to fan */
topOffY = -8;
topOffZ = 9;

$fn=30;

/* block mount */
translate([0,-widY/2-1.5,0]) {
   difference() {
      union() {
         translate([0,-3,0]) cube([6,3,10]);
         translate([0,-0.1,0]) cube([3,widY+0.2,10]);
         translate([0,widY,0]) cube([6,3,10]);
      }
      translate([-1,widY/2,offX]) rotate([0,90,0]) cylinder(d=3.1,h=10);
   }
}

/* fan mount */
difference() {
   union() {
      hull() {
         translate([-topOffZ+1.5, topOffY, 0]) cylinder(r=5,h=3);
         translate([-topOffZ-1, topOffY, 0]) cylinder(r=5,h=3);
      }
      translate([-topOffZ, topOffY-5, 0]) cube([topOffZ, 8,3]);
   }
   hull() {
      translate([-topOffZ+1.5,topOffY,-1]) cylinder(d=3.2,h=10);
      translate([-topOffZ-1,topOffY,-1]) cylinder(d=3.2,h=10);
   }
}

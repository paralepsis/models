use <woodwall.scad>
use <corrugatedwall.scad>
use <containerwall.scad>
use <dooropening.scad>
use <hole-1.scad>

bHeight=55;
$fn=20;

// % cube([120,100,bHeight]);

/* cornerposts */
translate([0,0,0]) cube([8,8,bHeight+9]);
translate([112,0,0]) cube([8,8,bHeight+9]);
translate([0,92,0]) cube([8,8,bHeight+5]);
translate([112,92,0]) cube([8,8,bHeight+5]);

/* left wall */
translate([2,98,0]) rotate([0,0,-90]) woodWall(length=96,height=bHeight-1);

/* right wall */
difference() {
   translate([120,0,0]) rotate([0,0,90])
      containerWall2(length=100,height=bHeight-0.75);
   translate([119,30,20]) rotate([1,0,0]) cube([5,23,20]);
}
translate([118.0,0,40]) rotate([2,0,0]) cube([2,100,7]);
translate([118.0,0,8]) rotate([-1,0,0]) cube([2,100,7]);

/* back wall */
translate([0,100,0]) {
   difference() {
      translate([0,2,0]) corWall(length=120,height=bHeight);
      translate([70,-1,0]) cube([50,5,30]);
      rotate([90,0,0]) translate([30,2,-3]) scale([0.4,0.5,1]) hole1();
   }
   translate([70,2,0]) containerWall(length=50,height=30,flat=5);
   translate([9,1,0]) difference() {
      rotate([0,2,0]) cube([43,2,20]);
      translate([0,-1,-3]) cube([45,5,3]);
   }
}

/* front wall */
difference() {
   simpleContainerWall(length=120,height=bHeight+3);
   translate([22,0,0]) doorOpening(cutout=1);

   /* bullet holes */
   translate([82,-2,32]) rotate([90,0,0]) cylinder(r=0.75,h=5);
   translate([89,-2,33]) rotate([90,0,0]) cylinder(r=0.75,h=5);
   translate([96,-2,35]) rotate([90,0,0]) cylinder(r=0.75,h=5);
   translate([109,-2,36]) rotate([90,0,0]) cylinder(r=0.75,h=5);
}
translate([22,1.5,0]) doorOpening(cutout=0,angle=3);


/* top */
translate([-10,-10,bHeight+9]) rotate([-92.5,0,0]) {
   difference() {
      corWallFlat(length=140,height=120);
      rotate([90,0,0]) translate([90,70,-1]) scale([0.4,0.5,1]) hole1();
   }
   translate([70,-0.9,43]) rotate([90,25,0]) linear_extrude(height=2.7)
      plank(length=60,seed=3);
   translate([75,-0.9,33]) rotate([90,32,0]) linear_extrude(height=2.7)
      plank(seed=3);
   translate([61,-0.9,53]) rotate([90,25,0]) linear_extrude(height=2.7)
      plank(length=63,seed=3);
}


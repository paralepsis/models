use <woodwall.scad>
use <corrugatedwall.scad>
use <containerwall.scad>
use <dooropening.scad>

bHeight=55;

// % cube([120,100,bHeight]);


/* cornerposts */
translate([0,0,0]) cube([8,8,bHeight+7]);
translate([112,0,0]) cube([8,8,bHeight+7]);
translate([0,92,0]) cube([8,8,bHeight+5]);
translate([112,92,0]) cube([8,8,bHeight+5]);

translate([2,98,0]) rotate([0,0,-90]) woodWall(length=96,height=bHeight-1);

translate([0,102,0]) corWall(length=120,height=bHeight);

difference() {
   simpleContainerWall(length=120,height=bHeight);
   translate([22,0,0]) doorOpening(cutout=1);
}
translate([22,1.5,0]) doorOpening(cutout=0,angle=3);

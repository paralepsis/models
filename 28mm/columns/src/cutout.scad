// % import("../products/doric-column.stl");

$fn=50;
slop = 0.1;

intersection() {
   import("../products/doric-column.stl");
   bottomCut();
}

/* bottomCut() -- intersect this with the column to get the bottom portion
 */
module bottomCut() {
   difference() {
      translate([0,0,-0.5]) cylinder(h=114.83+0.5,r=30);
      // translate([0,0,-0.5]) cylinder(r=7,h=120);
      translate([0,0,3]) cylinder(r=7,h=120);
   }
}

/* topCut() -- intersect this with the column to get the top portion
 */
module topCut() {
   translate([0,0,114.83]) cylinder(h=25,r=30);
   translate([0,0,114.83-5]) cylinder(r=7-slop,h=7);
}

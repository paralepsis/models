include <greg-frost-bevel-extrude.scad>

// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;

module window() {
   /* body of window */
   difference() {
      bevel_outline(3);
      translate([0,0,1.7]) poly_insidecutout(5);
   }

   /* cover slats */
   for (i=[0:13]) {
      translate([-9,-13 + 1.9*i,0]) cube([18,1.5,2]);
   }

   /* bolts on corners */
   translate([-9.5,-12,0]) cylinder(r=0.5,h=3.3, $fn=10);
   translate([-9.5,-14,0]) cylinder(r=0.5,h=3.3, $fn=10);
   translate([9.5,-12,0]) cylinder(r=0.5,h=3.3, $fn=10);
   translate([9.5,-14,0]) cylinder(r=0.5,h=3.3, $fn=10);
   translate([-9.5,12,0]) cylinder(r=0.5,h=3.3, $fn=10);
   translate([-9.5,14,0]) cylinder(r=0.5,h=3.3, $fn=10);
   translate([9.5,12,0]) cylinder(r=0.5,h=3.3, $fn=10);
   translate([9.5,14,0]) cylinder(r=0.5,h=3.3, $fn=10);

   difference() {
      translate([-5,11,0]) rotate([0,90,0]) cylinder(r=5,h=10,$fn=30);
      translate([-10,0,-6]) cube([20,20,6]);
      translate([-10,0,0]) cube([20,12,6]);
      translate([-10,0,2]) rotate([-10,0,0]) cube([20,12,6]);
   }
}

/* MODULES BELOW -- NOTHING TO EDIT */

module poly_insidecutout(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-28.346456,-42.519705],[28.346457,-42.519705],[28.346457,42.519625],[-28.346456,42.519625],[-28.346456,-42.519705]]);
  }
}


module bevel_outline(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    bevel_extrude(height=h,bevel_depth=2,$fn=10)
      polygon([[-35.433070,35.433025],[-42.519685,42.519625],[-42.519685,56.692925],[-28.346456,56.692925],[-21.259842,49.606325],[21.259843,49.606325],[28.346457,56.692925],[42.519685,56.692925],[42.519685,42.519625],[35.433071,35.433025],[35.433071,-35.433085],[42.519685,-42.519705],[42.519685,-56.692925],[28.346457,-56.692925],[21.259843,-49.606315],[-21.259842,-49.606315],[-28.346456,-56.692925],[-42.519685,-56.692925],[-42.519685,-42.519705],[-35.433070,-35.433085]]);
  }
}
module poly_outline(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-35.433070,35.433025],[-42.519685,42.519625],[-42.519685,56.692925],[-28.346456,56.692925],[-21.259842,49.606325],[21.259843,49.606325],[28.346457,56.692925],[42.519685,56.692925],[42.519685,42.519625],[35.433071,35.433025],[35.433071,-35.433085],[42.519685,-42.519705],[42.519685,-56.692925],[28.346457,-56.692925],[21.259843,-49.606315],[-21.259842,-49.606315],[-28.346456,-56.692925],[-42.519685,-56.692925],[-42.519685,-42.519705],[-35.433070,-35.433085]]);
  }
}

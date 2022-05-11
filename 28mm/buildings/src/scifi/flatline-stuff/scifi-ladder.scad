
// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;


hull() {
   translate([-4,0,0]) cube([8,3,62]);
   translate([-7,0,0]) cube([14,0.5,62]);
}
ladder();


module ladder(mult=2) {
   for (i=[0:mult-1]) {
      translate([0,0,30*i]) {
         translate([-10,-3,20]) scale([1,1,2.5]) rotate([0,90,0]) difference() { 
            cylinder($fn=6,r=3,h=1.5);
            translate([0,-0.5,0]) cylinder($fn=6,r=1.4,h=1.6);
         }
         translate([8.5,-3,20]) scale([1,1,2.5]) rotate([0,90,0]) difference() { 
            cylinder($fn=6,r=3,h=1.5);
            translate([0,-0.5,0]) cylinder($fn=6,r=1.4,h=1.6);
         }
         difference() {
            ladderOutline(h=3);
            for (j=[0:6]) {
               translate([0,0.5,j*5 + 2.3]) rotate([90,0,0]) {
                  hull() {
                     translate([-4,0,3]) cylinder($fn=6,r=1.5,h=1);
                     translate([4,0,3])  cylinder($fn=6,r=1.5,h=1);
                     translate([-4,-0.8,0]) scale([1,0.3,1]) cylinder($fn=6,r=1.5,h=0.5);
                     translate([4,-0.8,0])  scale([1,0.3,1]) cylinder($fn=6,r=1.5,h=0.5);
                  }
               }
            }
         }
      }
   }
}

module ladderOutline(h)
{
   translate([0,0,16]) rotate([90,0,0]) scale([0.9 * 25.4/90, -25.4/90, 1])
      linear_extrude(height=h)
	 polygon([[-28.346456,21.259835],
                  [-42.519684,14.173235],
                  [-42.519684,-42.519705],
                  [-28.346456,-49.606315],
                  [-28.346456,-56.692935],
                  [28.346457,-56.692935],
                  [28.346457,-49.606315],
                  [42.519685,-42.519705],
                  [42.519685,14.173235],
                  [28.346457,21.259835],
                  [28.346457,56.692935],
                  [-28.346456,56.692935]]);
}

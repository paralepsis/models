
// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;

$fn=30;

translate([20,,0]) {
   difference() {
      translate([0,0,-2]) rotate([73,0,0]) scale([1,1,1]) exhaust();
      translate([-15,-15,-5]) cube([30,30,5]);
   }
   translate([0,-7,0]) scale([1,2,1]) cylinder(r=4.5,h=0.3);
}
translate([10,0,0]) {
   difference() {
      translate([0,0,-2]) rotate([73,0,0]) scale([0.9,0.9,0.9]) exhaust();
      translate([-15,-15,-5]) cube([30,30,5]);
   }
   translate([0,-6,0]) scale([1,2,1]) cylinder(r=4,h=0.3);
}

translate([5.5,-10,0]) {
   scale([0.9,0.9,0.9]) scale([0.065,0.085,.1]) box();
   translate([-4.8,-2.5,0]) cylinder(h=0.3,r=5);
} 

translate([-1,0,0]) { 
   scale([0.030,0.030,0.1]) wrench(h=30);
   translate([2.0,0,0]) cylinder(h=0.3,r=5);
}

module exhaust() {
   difference() {
      union() { 
         cylinder(r=3,h=12);
         translate([0,0,11.9]) cylinder(r=2,h=3.5);
      }

      translate([0,0,11.9]) cylinder(r=1.3,h=3.9);
      for (j=[0:5]) {
         for (i=[0:5]) {
            rotate([0,0,60*i + 30*j]) translate([2,0,2*j]) rotate([0,90,0]) cylinder(r=0.75,h=2);
         }
      }
   }
}

module box(h=40)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-550.204980,17.391630],[-54.141990,17.391630],[-54.141990,159.123930],[-125.008129,159.123930],[-550.204980,52.824730]]);
  }

  translate([-7,0,0]) scale([0.92* 25.4/90, 0.92*-25.4/90, 1]) union()
  {
    linear_extrude(height=0.85*h)
      polygon([[-550.204980,52.824730],[-550.204980,265.423230],[-54.141990,265.423230],[-54.141990,159.123930],[-125.008129,159.123930]]);
  }
}

module wrench(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[158.456440,-584.970530],[87.590290,-584.970530],[-18.708920,-478.671320],[-16.724150,-267.472240],[158.749150,-119.785670],[158.749150,582.985730],[372.746910,584.970530],[368.777380,-119.785670],[550.204980,-265.487480],[548.220210,-478.671320],[441.921000,-584.970530],[371.054860,-584.970530],[371.054860,-372.372110],[158.456440,-372.372110]]);
  }
}



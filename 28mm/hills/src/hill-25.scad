use <hillpolygon.scad>
use <hill-2.scad>
use <hill-5.scad>
use <hill-4.scad>

% translate([0,0,155/2]) cube(size=[240, 153, 155], center=true); 

// cube([35,35,35,]);

scale([.85,1,1]) hill2Polyhedron(height=15, angle=30);

translate([-60,7,15]) scale([.4,.35,1]) rotate([0,0,110]) hillFromPolygon(angle=50,height=15) hill5Polygon();
translate([55,-5,15]) rotate([0,0,90]) scale([.35,.35,1]) hillFromPolygon(angle=50,height=15) hill5Polygon();

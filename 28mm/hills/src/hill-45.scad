use <hillpolygon.scad>
use <hill-5.scad>
use <hill-4.scad>

% translate([0,0,155/2]) cube(size=[240, 153, 155], center=true); 

// cube([35,35,35,]);

hillFromPolygon(angle=30, height=15) hill4Polygon();


translate([35,8,15]) rotate([0,0,40]) scale([.45,.3,1]) hillFromPolygon(angle=50,height=15) hill5Polygon();

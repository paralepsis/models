use <hillpolygon.scad>
use <hill-5.scad>

% translate([0,0,155/2]) cube(size=[240, 153, 155], center=true);

hillFromPolygon(angle=25, height=15) hill5Polygon();
translate([0,0,15]) scale([.4,.4,1]) rotate([0,0,23]) hillFromPolygon(angle=45, height=15) hill5Polygon();

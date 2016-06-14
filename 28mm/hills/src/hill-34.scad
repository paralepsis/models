use <hillpolygon.scad>
use <hill-3.scad>
use <hill-4.scad>

% translate([0,0,155/2]) cube(size=[240, 153, 155], center=true);

hillFromPolygon(angle=25,height=15) hill3Polygon();
translate([-4,7,15]) scale([.45, .45, 1]) rotate([0,0,195]) hillFromPolygon(angle=35,height=15) hill4Polygon();

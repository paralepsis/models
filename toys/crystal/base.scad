$fn=40;

module form() {
   hull() translate([0,0,4]) rotate_extrude($fn=120) translate([27.5,0]) scale([1,1.2]) circle(r=5);
   hull() translate([0,0,11]) rotate_extrude($fn=120) translate([28.5,0]) scale([1,1.2]) circle(r=2);
}

difference() {
   form();
   translate([0,0,-10]) cube([200,200,20], center=true);
}

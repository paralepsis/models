$fn=80;

translate([0,0,8]) rotate([-90,0,0]) difference() {
   cube([8,8,85]);
   translate([13.5,0,0]) rotate([0,0,40]) translate([0,4,-1]) cube([8,8,90]);
   translate([0,0,-1]) cylinder(r=7.0,h=90);
}

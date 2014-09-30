$fs=0.5;
$fa=2.0;

difference() {
	union() {
		rotate_extrude(r=5) translate([11,0,0])	circle(r=4);
		cylinder(r=11,h=3);
	}
	translate([0,0,3]) cylinder(r=11,h=2.5);
	translate([0,0,-5]) cube([30,30,10],center=true);
}

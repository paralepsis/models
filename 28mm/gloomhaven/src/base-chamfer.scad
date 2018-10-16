$fs=0.5;
$fa=2.0;

cylinder(r=8.8,h=3.5);

difference() {
	union() {
		scale([1,1,1.1]) rotate_extrude(r=5) translate([9.5,0,0]) circle(r=3);
		cylinder(r=10,h=2.5);
	}
	translate([0,0,2]) cylinder(r=9.5,h=2.5);
	translate([0,0,-5]) cube([30,30,10],center=true);
}

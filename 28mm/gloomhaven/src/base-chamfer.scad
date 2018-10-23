$fs=0.25;
$fa=2.0;

cylinder(r=20.6/2-4.5,h=2.85);

difference() {
	union() {
		scale([1,1,1.3]) rotate_extrude(r=5) translate([20.6/2-4,0,0])
                   circle(r=2);
  		cylinder(r=20.6/2-4.0,h=2.6);
	}
	translate([0,0,2]) cylinder(r=20.6/2-4.15,h=2.5);
	translate([0,0,-5]) cube([30,30,10],center=true);
}

height=6;
rear_offset=25; // From diagonal edge to center of tire



hull() {	
	translate([-23/2,0,0]) cube([23,1,2]);
	translate([0,rear_offset,0]) cylinder(r=10,h=2);
}
translate([0,rear_offset,0]) cylinder(r=10,h=height);

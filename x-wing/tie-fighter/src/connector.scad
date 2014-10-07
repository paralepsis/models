/* 
	2.14 little dia
	4.48 big dia
	4.32 ht
*/
littleRad = 2.14/2;
littleHt  = 4.32;
bigRad    = 4.48/2;
bigHt     = 3.3; // was 4 originally

$fn=20;

difference() {
	cylinder(r1=bigRad+0.4,r2=bigRad+0.8,h=littleRad+littleHt + bigHt + 1);
	internals();
}

module internals() {
	translate([0,0,bigHt]) {
		translate([0,0,littleHt]) sphere(r=littleRad);
		cylinder(r=littleRad, h=littleHt);
		translate([0,0,-1*bigHt]) cylinder(r=bigRad, h = bigHt);
	}
}

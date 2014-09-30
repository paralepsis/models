use <holeCutout.scad>
use <holeCutout2.scad>

wallBreach();

module wallBreach() {
	difference() {
		rotate([90,0,0]) color("grey") cylinder(h=10,r=80,center=true);
		rotate([0,30,0]) translate([-40,-10,-90]) holeCutout();
		translate([-20,-10,-90]) holeCutout2();
		rotate([0,60,0]) translate([-50,-10,-118]) holeCutout2();
		rotate([0,190,0]) translate([-45,-10,-92]) holeCutout2();
		rotate([180,260,0]) translate([-50,-10,-122]) holeCutout2();
		rotate([180,30,0]) translate([-40,-10,-90]) holeCutout();
	}
}
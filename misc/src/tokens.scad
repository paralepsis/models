tokenRad = 6;
tokenHt  = 3;

for (i = [ 0 : 5 ] ) {
	for (j = [ 0 : 2 ]) {
		translate([3 * tokenRad * i, 3 * tokenRad * j, 0])
			cylinder(r=tokenRad, h=tokenHt,center=false,$fn=30);
	}
}

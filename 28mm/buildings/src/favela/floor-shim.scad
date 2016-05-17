/* floor-shim.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

color("red") secFloorShim([152.4, 100, 65, 7, 4, 1]);

/* floorShim()
 */
module floorShim(bDims) {
	translate([0,0,-2]) hull() {
		translate([5 + 1.5 + bDims[3],5 + 1.5 + bDims[3], 1]) cylinder(r=5,h=2,center=true);
		translate([bDims[0] - 5 - 1.5 - bDims[3],5 + 1.5 + bDims[3], 1]) cylinder(r=5,h=2,center=true);
		translate([5 + 1.5 + bDims[3], bDims[1] - 5 - 1.5 - bDims[3], 1]) cylinder(r=5,h=2,center=true);
		translate([bDims[0] - 5 - 1.5 - bDims[3], bDims[1] - 5 - 1.5 - bDims[3], 1]) cylinder(r=5,h=2,center=true);
	}
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */

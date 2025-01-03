/* Memoir '44 Tile Set: Hills
 *
 * This file defines modules to build three types of hills:
 * - simpleHillTile - simple, one-tile hill
 * - connectedHillTile - one side is designed to abut another 
 *                       connectedHillTile or doubleConnectedHillTile
 * - doubleConnectedHillTile - two sides designed to abut others
 *
 * Obviously one could simply use the freestanding version.
 *
 * All three follow the same approach, which is basically to use a hull() of
 * a blank tile in conjunction with an extruded polygon (the fooPolyhedron()
 * call) to create a base, followed by the same polygon extruded with an
 * angled side to create the sides of the hill and hilltop.
 *
 * In case you are interested, the polyhedron code was generated by drawing
 * the polygon in Inkscape and then using a perl script that parses the
 * output of the Inkscape SCAD output routines. These polyhedrons are kept
 * in separate SCAD files in case I need to regenerate them.
 *
 * Dimensions of a tile (as a reminder):
 * - point to point, tile is 62mm
 *   - center to center of edge is 26.847mm
 * - stock, cardboard tiles in Memoir are approx. 1.5mm tall
 */

include <hill-polyhedron.scad>

simpleMtnTile();

module mtnBlankTile(height=1.5) {
    cylinder(r = 62/2, h = height, $fn = 6, center = [0,0]);
}

module simpleMtnTile(height=12) {
    hull() {
	mtnBlankTile();
	scale([0.80,0.80,1]) hillPolyhedron(height=4.5,angle=0);
    }

    translate([-4,-9.0,1.5]) scale([0.65,0.65,1]) rotate([0,0,40])
	hillPolyhedron(height=height-1.5,angle=40);
    translate([10.0,0,1.5]) scale([0.65,0.65,1])
	hillPolyhedron(height=height-1.5,angle=40);
    translate([-5.0,8.5,1.5]) scale([0.65,0.65,1])
	hillPolyhedron(height=height-1.5,angle=40);
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 */

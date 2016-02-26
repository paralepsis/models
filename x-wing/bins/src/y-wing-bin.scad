/* y-wing-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the GNU General Public License
 * Version 3.
 */

$fn=40;

include <./bintools.scad>

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[0,0,0.1], [0,0,-90]]];

/* Note: Scaling by just a bit in the Z dimension to make up for
 *       inconsistencies in the s-foils on my X-Wings.
 */
harborFreightMediumHalfHt(locations=locations)
   scale([1,1,15/15]) import("../orig/y-wing-blank.stl");

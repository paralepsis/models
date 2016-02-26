/* e-wing-bin.scad
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
locations = [[[6,-14,0.0], [0,0,-90]],
             [[-6, 14, 0.0],[0,0,90]]];

harborFreightMediumHalfHt(locations=locations)
   scale([1,1,15/15]) import("../orig/e-wing-blank.stl");

/* z-95-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the GNU General Public License
 * Version 3.
 */

include <./bintools.scad>

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[3.5,-14,0.0], [0,0,-90]],
             [[-3.5, 14, 0.0],[0,0,90]]];

harborFreightMediumHalfHt(locations=locations)
   scale([1,1,15/15]) import("../orig/z-95-blank.stl");

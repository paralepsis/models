/* x-wing-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the GNU General Public License
 * Version 3.
 */

include <./bintools.scad>

/* locations is a pair of triples, translate : rotate pairs
 */
locations = [[[1.1,-15.66,0.0], [0,0,0]],
             [[1.1, 15.66, 0.0],[0,0,180]]];

/* Note: Scaling by just a bit in the Z dimension to make up for
 *       inconsistencies in the s-foils on my X-Wings.
 *
 * Note: I scaled in Z by 19/18 at one point, don't really need to?
 */
harborFreightMediumHalfHt(locations=locations) scale([1,1,19/18])
   import("../orig/x-wing-blank.stl");

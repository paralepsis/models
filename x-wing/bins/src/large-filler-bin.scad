/* large-filler-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <./bintools.scad>

/*
 * See above for description of locations variable
 *
 * Dimensions (from Kariko83)
 *   46.5mm tall
 *   48.6mm tall with legs
 *   109.25mm wide
 *   80mm length
 */
roundShapedBox(xDimTop=80,
               yDimTop=109.25,
               xDimBottom=74,
               yDimBottom=104,
               ht=97-46.5,
               wallThick=2);
roundBoxBottom(xDim=74,yDim=104,ht=1.5);

translate([0,0,17.5]) cube(center=true,size=[74,2,35]);

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 3
 *  c-basic-offset: 3
 * End:
 *
 * vim: ts=8 sts=3 sw=3 expandtab
 */

/* huge-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

$fn=40;

include <bintools.scad>

/* Harbor Freight Large
 * 46.5mm tall
 * 48.6mm tall with legs
 * 109.3mm wide
 * 80mm length
 *
 * Note: doubling this, half height
 */

roundShapedBox(xDimTop=160, yDimTop=109.3, xDimBottom=160,
               yDimBottom=109.3, ht=46.5/2, wallThick=2.0);
roundBoxBottom(xDim=160,yDim=109.3,ht=1.5);

translate([8,-109.3/2,0]) cube([2,109.3,46.5/2]);

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */

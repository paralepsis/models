/* huge-bin.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

include <bintools.scad>

/* Harbor Freight Large
 * 46.5mm tall
 * 48.6mm tall with legs
 * 109.3mm wide
 * 80mm length
 */

roundShapedBox(xDimTop=160, yDimTop=109.3, xDimBottom=158,
               yDimBottom=107.3, ht=46.5, wallThick=2.0);
roundBoxBottom(xDim=158,yDim=107.3,ht=1.5);

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 3
 *  c-basic-offset: 3
 * End:
 *
 * vim: ts=8 sts=3 sw=3 expandtab
 */

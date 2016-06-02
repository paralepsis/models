/* brimgenerator.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

$fn=60;

/* brimGenerator() - extrudes an outline (enclosing form) of children()
 *                   to a given height.
 *
 */
module brimGenerator(height=0.3,scale=3) {
   slices = floor(height/.3);

   for (i=[0:slices-1]) {
      translate([0,0,i*height/slices])
      linear_extrude(height=height/slices + 0.01)
      outline(outlineScale=scale-(scale-1)*i/slices) projection(cut=false) children();
   }
}

/* outline() - generates an outline of an object
 *
 * Note: This is intended to be used on a 2D shape, such as one created
 *       using the projection() operator.
 */
module outline(outlineIterations = 60,outlineScale=1.4) {
   for (i=[0:outlineIterations]) {
      translate([outlineScale*cos(360*i/outlineIterations),
                 outlineScale*sin(360*i/outlineIterations),0]) children();
   }
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 3
 *  c-basic-offset: 3
 * End:
 *
 * vim: ts=8 sts=3 sw=3 expandtab
 */

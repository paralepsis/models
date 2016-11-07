/* Partial Rotate Extrude by "CarryTheWhat", published Nov. 8, 2012.
 * http://www.thingiverse.com/thing:34027
 *
 * Licensed under GNU LGPL.
 */

module pie_slice(radius, angle, step) {
   for(theta = [0:step:angle-step]) {
      rotate([0,0,0]) linear_extrude(height = radius*2, center=true)
      polygon(points = [[0,0],[radius*cos(theta+step),radius*sin(theta+step)],
                        [radius*cos(theta),radius*sin(theta)]]);
   }
}

module partial_rotate_extrude(angle, radius, convex) {
   intersection () {
      rotate_extrude(convexity=convex) translate([radius,0,0]) children(0);
      pie_slice(radius*2, angle, angle/5);
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

/* corrugatedwall.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

/* NOTE: Two functions: corWall() and corWallFlat(). Former creates a two-
 *       sided corrugated wall, while the second is flat on the back.
 *
 *       Walls are placed with the "back left bottom" corner at the origin.
 */

// corWall();
corWallFlat(length=120);

module corWall(length=100,height=100,period=4, thick=1.6) {
   // NOTE: 0.16 is a fudge. Not sure why it is needed. Too lazy to track.
   translate([0,-thick+0.16,0]) linear_extrude(height=height) for (i=[0:(length/period)-1])
      translate([i*period,0,0]) scale([period,0.8,1])
         wave(thick=thick);
}

/* wave() -- one sine wave
 */
module wave(thick=1) {
   slices=15;

   scale([1/slices,1,1]) translate([0,-0.5*thick,0]) {
      for (i=[0:slices]) {
         polygon(points=[[i,sin(360*i/slices)+thick],
                         [(i+1),sin(360*(i+1)/slices)+thick],
                         [(i+1),sin(360*(i+1)/slices)],
                         [i,sin(360*i/slices)]]);
      }
   }
}

/* corWallFlat() -- generate an angled corrogated roof
 *
 * Note, angle is in the Y dimension.
 */
module corWallFlat(length = 102, height = 80, angle = 0) {
   xDim = length;
   yDim = height;
   corRad = 1;
   $fn = 30;
   height = tan(angle) * yDim;
   topLength = yDim / cos(angle);

   /* zOff is an offset such that the cutout cylinders will leave some 
    * material near the x axis. The "+ 1" leaves approximately 1mm of
    * height at x=0.
    */
   zOff = -1 * (0.7 * corRad * cos(angle)) - 1;

   // NOTE: Not sure why the 0.15 is there further down, but it is...
   translate([0,zOff+0.15,0]) rotate([90,0,0])
   difference() {
      intersection() {
         union() {
            translate([xDim, 0, 0.15]) rotate([0,-90,0])
            linear_extrude(height=xDim)
	       polygon(points = [[zOff,0], [zOff,yDim], [height, yDim], [0,0]],
	               paths = [[0,1,2,3,0]]);

            for (i = [0 : 2 : xDim / (corRad*2)]) {
               translate([(2*i+1) *corRad, 0, 0]) rotate([-90+angle,0,0])
	          scale([1,0.7,1]) cylinder(r=corRad,h = topLength);
	    }
         }
         /* clean up end in event that cylinders don't quite match up. */
         translate([0,0,-12]) cube([xDim,yDim,20]);
      }

      /* difference out the troughs */
      for (i = [1 : 2 : xDim / (corRad*2)]) {
         translate([(2*i+1)*corRad, 0, 0]) rotate([-90+angle,0,0])
	    scale([1,0.7,1]) cylinder(r=corRad,h = topLength);
      }
   }
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */

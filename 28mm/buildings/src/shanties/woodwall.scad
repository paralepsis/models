/* woodwall.scad
 *
 * Copyright (C) Robert B. Ross, 2016
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

myWidth=7;

// woodWall(height=50,crossPiece=1,supports=1);

woodLadder();


/* woodLadder()
 * length - length (height when stood up) of the ladder
 * width  - width of rungs
 */
module woodLadder(length=70,width=24)
{
   startSpace=8; // from center of crosspiece to center of crosspiece

   /* do a quick adjustment to achieve desired length */
   count = floor(length / (startSpace+1));
   actSpace = startSpace + (length/(startSpace+1)) / (count-1);

   /* rungs */
   linear_extrude(height=2) for (i=[1:count]) {
      translate([i*actSpace,0,0])
      rotate([0,0, rands(min_value=-10,max_value=10,value_count=1,
                 seed_value=13*i+2)[0]])
      translate([-2,-1*width/2,0]) plank(width=4,length=width,seed=11*i);
   }

   /* sides */
   translate([0,width/2-3,2]) rotate([0,0,-90]) linear_extrude(height=2)
   translate([-2,0,0]) plank(width=4,length=length,seed=145);

   translate([0,-1*width/2+3,2]) rotate([0,0,-90]) linear_extrude(height=2)
   translate([-2,0,0]) plank(width=4,length=length,seed=148);
}


/* woodWall()
 *
 * NOTE: Back of wall is at y=0, bottom is at z=0, left at x=0.
 */
module woodWall(height=60,length=90,crossPiece=0,supports=1,
                missing1=-1, missing2=-1)
{
   /* work out plank widths from length */
   count = length / (myWidth + 0.5);

   // +1 on Z translation is to account for random perturbations of planks.
   translate([0,-4,height+1]) rotate([-90,0,0]) union() {
      linear_extrude(height=2.0) for (i=[0:count]) {
         if (i != missing1 && i != missing2) {
            translate([i*(myWidth+0.5),0,0]) plank(width=myWidth,
                                                   length=height,seed=i);
         }
      }

      if (supports) {
         translate([myWidth/2,.95*height,1.99]) rotate([0,0,-90])
            linear_extrude(height=2.0) plank(length=count*(myWidth+0.5)-2,width=myWidth,seed=101);
         translate([myWidth/2,10,1.99]) rotate([0,0,-90])
            linear_extrude(height=2.0) plank(length=count*(myWidth+0.5)-2,width=myWidth,seed=101);
      }

      if (crossPiece) {
         cAngle = atan((height - 5*myWidth)/((count-2)*(myWidth+0.5)));

         //translate([2,17,1.99]) rotate([0,0,-65])

         translate([myWidth/2,.3*height,1.99]) rotate([0,0,cAngle-90])
            linear_extrude(height=2.0)
               plank(length=count*(myWidth+0.5),width=myWidth,seed=101);
      }
   }
}

/* plank() -- generates a 2D plank outline of specified width and length
 *
 * NOTES:
 * - Intention is that you linear_extrude this to the desired height.
 * - The seed parameter can be used to generate different rough ends.
 */
module plank(width=7,length=70,seed=1) {
   widthPoints=7; // cannot modify without editing code

   rough = rands(min_value=-1,max_value=1,value_count=2*(widthPoints+1),
                 seed_value=seed);

   polygon(points=[[0,0+rough[0]], [0,length+rough[1]],
                   [width/widthPoints,length+rough[2]],
                   [2*width/widthPoints,length+rough[3]],
                   [3*width/widthPoints,length+rough[4]],
                   [4*width/widthPoints,length+rough[5]],
                   [5*width/widthPoints,length+rough[6]],
                   [6*width/widthPoints,length+rough[7]],
                   [7*width/widthPoints,length+rough[8]],
                   [7*width/widthPoints,rough[9]],
                   [6*width/widthPoints,rough[10]],
                   [5*width/widthPoints,rough[11]],
                   [4*width/widthPoints,rough[12]],
                   [3*width/widthPoints,rough[13]],
                   [2*width/widthPoints,rough[14]],
                   [width/widthPoints,rough[15]]]);
}

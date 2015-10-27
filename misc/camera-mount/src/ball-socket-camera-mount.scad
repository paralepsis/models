/* ball-socket-camera-mount.scad
 *
 * Copyright (C) Robert B. Ross, 2015
 *
 * This software is released under the GNU LGPL version 2.1.
 *
 * A portion of this design is based off Mason Stone's Customizable
 * Ball-and-Socket Mount as downloaded on Oct. 21, 2015. That design was
 * made available under the Creative Commons - Attribution license.
 *
 * This design also borrows from the MCAD package, which is licensed under
 * the LGPL.
 *
 *
 */

// Diameter of Ball
ballSize = 15;

// Oversize for Socket
ballSlop = 1;

// Thickness of socket walls
socketThickness = 1.8;

// Thickness of Flange
flangeThickness = 4;

// Diameter of Flange
flangeDiameter = 40;

// Length of neck extension
neckLength = 10;

flangeMountFactor=.27; // placement for flange holes

$fn=30;

mountPortion();
translate([67, 13, 0]) socket();
// translate([0,6.0,0]) lensHood();



/* MODULES */

/* CAMERA MOUNT MODULES */
module lensHood(raft=1) {
   protrusionLen = 19;

   /* base */
   difference() {
      translate([0,-1,0]) plate(width=40,height=8);
      translate([6.5,3,-0.1]) cylinder(r=1.5,h=8);
      translate([6.5+28.2,3,-0.1]) cylinder(r=1.5,h=8);
   }

   /* vertical component */
   translate([15.5,-1.0,0]) cube([10,3.5,protrusionLen-7]);

   /* curved section */
   translate([15.5,-4.0,protrusionLen-8.8]) scale([1,1,1.35])
      rotate([0,90,0]) intersection()
      {
         difference() {
            scale([0.97,1,1]) cylinder(r=7,h=10);
            translate([0,0,-0.25]) scale([1.6,1,1]) cylinder(r=3.1,h=10.5);
         }
         translate([-6.5,0,0]) cube([6.5,6.5,10.0]);
      }

   /* hood component (the wide end piece) */
   translate([13.5,-10,protrusionLen-2]) {
      linear_extrude(height=2)
         polygon(points=[[0,0], [0,4], [2,6.05], [12,6.05], [14,4], [14,0]]);
   }

   /* raft */
   if (raft == 1) {
      translate([11.5,-10.9,0]) plate(width=18,height=10,depth=0.3);
   }
}

module mountPortion() {
   translate([0,-1,0]) plate(width=40,height=8);
   translate([0,0,0]) plate(width=5,height=40);
   translate([36,0,0]) plate(width=5,height=40);

   translate([34.65,8.9,0])rotate([0,0,-90]) smallHole();
   translate([6.5,37.1,0]) rotate([0,0,90]) smallHole();
   translate([34.65,37.1,0])rotate([0,0,-90]) smallHole();

   /* add the ball to the mount */
   translate([10,-7,0]) ball();
}

/* smallHole() -- place a hole with surrounding material for screw to
 *                pass through.
 */
module smallHole() {
   difference() {
      union() {
         cylinder(h=4,r=3);
         translate([-3,0,0]) cube([6,3.1,4]);
      }
      translate([0,0,-0.05]) cylinder(h=4.1,r=1.3);
   }
}

/* plate() -- basically just a quick way to make rounded rectangles
 */
module plate(width=35,height=35,depth=4) {
   hull() {
      translate([2,2,0]) cylinder(r=2,h=depth);
      translate([width-2,2,0]) cylinder(r=2,h=depth);
      translate([2,height-2,0]) cylinder(r=2,h=depth);
      translate([width-2,height-2,0]) cylinder(r=2,h=depth);
   }
}

/* holeLocations() -- just a reference for location of holes on camera
*/
module holeLocations() {
   /* locations of holes */
   translate([6.5,8.9,-0.1]) {
      translate([0,0,0]) color("green") cylinder(r=1.2,h=8);
      translate([28.2,0,0]) color("green") cylinder(r=1.2,h=8);
      translate([0,28.2,0]) color("green") cylinder(r=1.2,h=8);
      translate([28.2,28.2,0]) color("green") cylinder(r=1.2,h=8);
   }
}

/* BALL AND SOCKET CODE BELOW */

module ball()
{
   translate([0,0,flangeThickness+neckLength]) sphere(d=ballSize);
   translate([-1*flangeDiameter/4,0,0])
      cube([flangeDiameter/2, flangeDiameter/4, flangeThickness]);

   hull() {
      translate([0,0,flangeThickness/2])
         cylinder (d=flangeDiameter/2,h=flangeThickness,center=true);
      translate([0,0,flangeThickness/2+neckLength-ballSize*.3])
         cylinder(d=ballSize/2,h=.1,center=true);
   }
}

module socket()
{
   difference() {
      union() {
         base();
        
         // outer ball
         translate([0,0,flangeThickness+neckLength-ballSize*.25])
            sphere(d=ballSize+(socketThickness*2));
      }
        
      // cut off top of ball
      translate([0,0,flangeThickness+neckLength])
         cylinder(d=2*ballSize,h=2*ballSize);
        
      // add socket hole
      translate([0,0,flangeThickness+neckLength-ballSize*.25])
         sphere(d=ballSize+ballSlop);
        
      // second sphere to bevel the lip
      translate([0,0,flangeThickness+neckLength+ballSize*.15])
         sphere(d=ballSize+ballSlop);
        
      // add notches for easier insertion
      for (i=[0,90])
         rotate([0,0,i]) translate([0,0,flangeThickness+neckLength])
            cube([socketThickness,
                  ballSize + (socketThickness*2) + .1,
                  allSize*.6], center=true);
        
      // make sure bottom stays flat
      translate([0,0,-flangeDiameter]) cube(flangeDiameter*2,center=true);
   }
}


module base()
{
   difference() {
      union() {
         // flange base
         translate([0,0,flangeThickness/2])cylinder (d=flangeDiameter,h=flangeThickness,center=true);
            
         // neck
         hull() {
            translate([0,0,flangeThickness/2])cylinder (d=flangeDiameter/2,h=flangeThickness,center=true);
            translate([0,0,flangeThickness/2+neckLength-ballSize*.3]) cylinder(d=ballSize/2,h=.1,center=true);
         }
      }
        
      // flange holes
      for (i=[-1,1],j=[-1,1]) {
         translate ([i*(flangeDiameter*flangeMountFactor),j*(flangeDiameter*flangeMountFactor),-.1])
             std1032BoltHole();
       }
   }
}

// Approach taken from MCAD.
//
// Modified for #10-32 machine screw and nut
//   http://www.smithfast.com/msthreaddims.html
//   http://www.mcfeelys.com/tech/dimensions.htm
//
module std1032BoltHole(length=30, tolerance = +0.0001)
{
    radius = 4.78/2 + tolerance; // listed tolerance is .0028 in
    capHeight = 4.82 + tolerance;
    capRadius = 7.82/2 + tolerance;

    translate([0, 0, -capHeight+tolerance]) cylinder(r= capRadius, h=capHeight);
    cylinder(r = radius, h = length);
}

$fn=80;

import("./hummer-v15.stl");

translate([13,0,45]) rotate([180,0,-90]) scale([0.45,0.45,0.45]) import("../orig/KHERES_ASSAULT_CANNON.stl");

translate([-30,-40,0]) import("/Users/rross/personal/3dprint/marine/marine-on-base.stl");

translate([-5,0,29.9]) scale([0.6,0.6,0.6]) hatch();

replacementExhaust();

module replacementExhaust() {
   difference()
   {
      translate([-19.6,24.4,0]) rotate([0,-22.7,0]) {
         cylinder(r=1.5,h=30);
         translate([0,0,2]) portedExhaust(rad=1.9,ht=26);
         rotate([90,0,0]) cylinder(r=1.5,h=5);
         sphere(r=1.5);
         translate([0,0,30]) {
            rotate([75,0,-125]) cylinder(r=1.5,h=3);
            sphere(r=1.5);
         }
      }
      translate([-40,-20,-5]) cube([50,50,5]);
   }
}

module hatch() {
   /* main body */
   difference() {
      union() {
         cylinder(r=40/2, h=1.5);
         translate([0,0,1.49]) cylinder(r1=40/2, r2=37/2, h=2);
      }
      difference() {
         translate([0,0,1.5]) cylinder(r=35/2, h=2.5);   
         translate([0,0,1.4]) cylinder(r=34/2, h=2.7);   
      }
      translate([-34.05/2,-0.25,1.5]) cube([34.1,0.5,2.5]);
   }
   
   /* cubes on sides that attach hatch doors */
   translate([0,-18,2.5]) cube([8,6,5], center=true);
   translate([0,18,2.5]) cube([8,6,5], center=true);

   /* offshoot that mounts weapon */
   translate([22,0,0]) {
      difference() {
         union() {
            translate([0,0,1.49]) rotate([0,0,45]) cylinder(r1=10,r2=8,h=2, $fn=4);
            translate([0,0,1.5/2]) cube([10*sqrt(2),10*sqrt(2),1.5],center=true);
         }
         translate([-7,0,1.5]) cube([5,15,6],center=true);
      }
   }
}

module portedExhaust(rad=3,ht=12) {
   difference() {
      union() {
         cylinder(r=rad,h=ht);
      }

      for (j=[0:11]) {
         for (i=[0:3]) {
            rotate([0,0,60*i + 30*(j%2)]) translate([rad-1,0,2*j+2]) rotate([0,90,0]) cylinder(r=0.5,h=2);
         }
      }
   }
}

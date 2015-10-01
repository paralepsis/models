% translate([0,153/2-10,155/2]) cube(size=[240, 153, 155], center=true);

include <scifi-hex-door.scad>
include <scifi-window.scad>
include <scifi-big-door.scad>

import("/Users/rross/personal/3dprint/marine/marine-on-base.stl");
// translate([-100,25,0]) color("red") cube([200,1,80]);

/* front door */

translate([-80,0,0]) { 
   cube([50,30,55]);
   translate([0,-0.5, 47]) boltedPanel(width=50);
   translate([50.6,0,47]) rotate([0,0,90]) boltedPanel(width=20);
}
translate([-30,20,0]) {
   cube([80,10,55]);
   translate([0,-0.5, 47]) boltedPanel(width=80);
}

translate([10,21.1,21]) rotate([90,0,0]) scale([0.7,0.7,1]) hexDoor();

translate([-44,1,0]) myWindow();
translate([-67,1,0]) myWindow();
// translate([70,11,0]) myWindow();

/* another wall */
translate([40,20,0]) {
   cube([10,97,55]);
   translate([10.6,0,47]) rotate([0,0,90]) boltedPanel(width=97, spacing=97/4);
}
rotate([0,0,-90]) {
   translate([-95,50,0]) tankPipe(pipeRad=4,pipeHt=10);
   translate([-80,50,0]) tankPipe(pipeRad=4,pipeHt=10);
   translate([-65,50,0]) tankPipe(pipeRad=4,pipeHt=10);
}

/* another wall */
translate([-80,0,0]) {
   cube([50,75,55]);
   translate([40,75.6,47]) rotate([0,0,180]) boltedPanel(width=40);
   translate([-0.6,75,47]) rotate([0,0,-90]) boltedPanel(width=75,spacing=75/4);
}
translate([-40,75,0]) {
   cube([10,42,55]);
   translate([-0.6,42,47]) rotate([0,0,-90]) boltedPanel(width=42);
}

translate([-79,61,0]) rotate([0,0,-90]) {
   myWindow();
   translate([23,0,0]) myWindow();
   translate([46,0,0]) myWindow();
}

/* back wall */
translate([-40,107,0]) {
   cube([90,10,55]);
   translate([90,10.6,47]) rotate([0,0,180]) boltedPanel(width=90, spacing=90/4);
}

translate([-8,85,55]) tower();

/* lookout tower top */

module tower() {
   /* bottom of angled part */
   difference() {
      translate([0,0,15]) linear_extrude(height=30,scale=1.4) square([60,60],center=true);
      translate([-50,-50,20]) cube([100,100,30]);
   }

   /* majority of angled part */
   difference() {
      translate([0,0,15]) linear_extrude(height=30,scale=1.4) square([60,60],center=true);
      difference() {
         scale([0.8,1.1,1]) translate([0,0,15])
            linear_extrude(height=25,scale=1.4) square([60,60],center=true);
         translate([-3.5,-50,0]) cube([7,100,45]);
      }
      difference() {
         scale([1.1,0.8,1]) translate([0,0,15])
            linear_extrude(height=25,scale=1.4) square([60,60],center=true);
         translate([-50,-3.5,0]) cube([100,7,45]);
      }
   }

   /* vertical sided bottom component */
   translate([-30,-30]) cube([60,60,15.5]);

   /* fill in the angled component interior */
   scale([0.97, 0.97, 1]) translate([0,0,15])
      linear_extrude(height=30,scale=1.4) square([60,60],center=true);
}

/* MODULES */

module myWindow() {
   translate([0,0,25]) rotate([90,0,0]) scale([0.8,0.9,1]) window();
}

module tankPipe(pipeRad=8, pipeHt=20) {
   translate([0,pipeHt-1,0]) {
      translate([0,-1 * pipeHt,pipeHt]) rotate([-90,0,0]) {
         cylinder(r=1.4 * pipeRad, h=4, center=true);
         for (i = [0 : 8]) {
            rotate([0,0,45 * i]) translate([1.2 * pipeRad, 0, 0])
               cylinder($fn=6,r=1, h=2 + 0.6);
            }
         }
      cylinder(r=pipeRad, h=pipeHt);
      translate([0,0,pipeHt]) sphere(r=pipeRad);
      translate([0,0,pipeHt]) rotate([90,0,0]) cylinder(r=pipeRad, h=pipeHt);
   }
}

module boltedPanel(width=40, depth=0.65, height=8, spacing=20) {
   cube([width, depth, height]);

   /* end bolts */
   translate([2, 0, 2]) sphere(r=depth, $fn=20);
   translate([2, 0, height - 2]) sphere(r=depth, $fn=20);
   translate([width - 2, 0, 2]) sphere(r=depth, $fn=20);
   translate([width - 2, 0, height - 2]) sphere(r=depth, $fn=20);

   /* middle bolts (if any) */

   if ((width-4)/spacing > 0.99 ) {
      for (i=[1:(width-4)/spacing]) {
         translate([i * spacing - (width % spacing)/2, 0, 2]) sphere(r=depth, $fn=20);
         translate([i * spacing - (width % spacing)/2, 0, height - 2]) sphere(r=depth, $fn=20);
      }
   }
}

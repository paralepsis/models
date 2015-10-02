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

   translate([36,1,0]) myWindow();
   translate([13,1,0]) myWindow();

   translate([0, 0, 0]) rotate([0,0,0]) footing();
   translate([50, 0, 0]) rotate([0,0,90]) footing();
}

translate([-30,20,0]) {
   cube([90,10,65]);
   translate([-10,-0.5, 57]) boltedPanel(width=100);

   translate([40,1.1,25]) rotate([90,0,0]) scale([0.7,0.7,1]) hexDoor();
   translate([-45/2 + 40,-8.9,0]) cube([45,10,4]);

   translate([90, 0, 0]) rotate([0,0,90]) footing();
}


/* another wall */
translate([50,20,0]) {
   cube([10,97,65]);
   translate([10.6,0,57]) rotate([0,0,90]) boltedPanel(width=97, spacing=97/4);

   rotate([0,0,-90]) {
      translate([-75,10,0]) tankPipe(pipeRad=4,pipeHt=10);
      translate([-60,10,0]) tankPipe(pipeRad=4,pipeHt=10);
      translate([-45,10,0]) tankPipe(pipeRad=4,pipeHt=10);
   }

   translate([10, 97, 0]) rotate([0,0,180]) footing();
}

/* another wall (left side from front) */
translate([-80,0,0]) {
   cube([50,75,55]);
   translate([40,75.6,47]) rotate([0,0,180]) boltedPanel(width=40);
   translate([-0.6,75,47]) rotate([0,0,-90]) boltedPanel(width=75,spacing=75/4);
   translate([0, 75, 0]) rotate([0,0,-90]) footing();
}
translate([-40,20,0]) {
   cube([10,97,65]);
   translate([-0.6,97,57]) rotate([0,0,-90]) boltedPanel(width=97, spacing=97/4);
}

translate([-79,61,0]) rotate([0,0,-90]) {
   myWindow();
   translate([23,0,0]) myWindow();
   translate([46,0,0]) myWindow();
}

/* back wall */
translate([-40,107,0]) {
   cube([100,10,65]);
   translate([100,10.6,57]) rotate([0,0,180]) boltedPanel(width=100);

   translate([0 + 19,30,0]) rotate([0,0,180]) angledSupport(height=57);
   translate([35 + 19,30,0]) rotate([0,0,180]) angledSupport(height=57);
   translate([70 + 19,30,0]) rotate([0,0,180]) angledSupport(height=57);

   translate([0, 10, 0]) rotate([0,0,-90]) footing();
}

/* tower */
translate([-9,86,65]) tower();

/* roof */
translate([-30,20,55]) {
   cube([80,97,10]);

   translate([-10,0,10]) railing(width=100, spacing=20);
   translate([90,0,10]) rotate([0,0,90]) railing(width=97, spacing=22);
   translate([-10,34,10]) rotate([0,0,-90]) railing(width=34, spacing=15);
   translate([90,97,10]) rotate([0,0,180]) railing(width=37, spacing=17);
}


module footing() {
   translate([-1, -1,0]) linear_extrude(height=7,scale=0.5) square([5.1,5.1]);
}

/* MODULES */

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

module railing(width=50, depth=5, height=20, spacing=15) {
   cube([width, depth, 1.2]);
   translate([0,0,height-1.2]) cube([width, depth, 1.2]);

   railingEndSupport(height=height, left=true);
   translate([width-3, 0,0]) railingEndSupport(height=height, left=false);

   if ((width-6)/spacing >= 1) {
      for (i=[1:(width-6)/spacing]) {
         translate([i * spacing - (width % spacing)/2, 0, 0])
            railingSupport(height=height);
      }
   }
}

module railingSupport(height=14) {
   translate([-1.5,0,0]) cube([3,1.2,height]);
   translate([-0.6,0,0]) cube([1.2,3,height]);
}

module railingEndSupport(height=14, left=true) {
   cube([3,1.2,height]);

   if (left) {
      cube([1.2, 3, height]);
   }
   else {
      translate([1.8, 0, 0]) cube([1.2, 3, height]);
   }
}

/* angled support */
module angledSupport(height=60) {
   difference() {
      union() {
         translate([0,height*cos(80),height*sin(80)-5]) cube([8,20,5]);
         rotate([-10,0,0]) {
            cube([8,30,height]);
            translate([8,-0.6,0]) rotate([0,-90,0]) boltedPanel(width=height);
         }
      }
      translate([-0.1,0,-20]) cube([8.2,50,20]);
      translate([-0.1,20.5,-0.5]) cube([8.2,30,height+0.5]);
   }
   translate([8,height*cos(80),height*sin(80)+0.6]) rotate([-90,0,90])
      boltedPanel(width=20 - height*cos(80));
}

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

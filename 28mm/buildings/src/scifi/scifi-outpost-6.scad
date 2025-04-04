/* scifi-outpost-6.scad
 *
 * Copyright (C) Robert B. Ross
 */

// % translate([0,153/2-10,155/2]) cube(size=[240, 153, 155], center=true);

include <scifi-hex-door.scad>
include <scifi-window.scad>
include <scifi-ladder.scad>

translate([0,-10,0]) import("/Users/rross/personal/3dprint/marine/marine-on-base.stl");
// translate([-100,25,0]) color("red") cube([200,1,80]);

/* TWO BASIC VIEWS */
// wholeOutpost();
explodedView();

/* VERSIONS FOR CREATING SEPARATE STL FILES */
// printAnnexWalls();
// printAnnexRoof();
// printMainWalls();
// printMainRoof();
// printTowerWalls();
// printTowerRoof();
// rotate([0,-90,0]) printRailings(nr=1);
// rotate([90,0,0]) printRailings(nr=2);
// rotate([-90,0,0]) printRailings(nr=3);
// rotate([0,90,0]) printRailings(nr=4);

/* COMPLETE CONFIGURATION OPTIONS */

module wholeOutpost() {
   wholeMain();
   wholeAnnex();
   wholeTower();
   wholeRailings();
}

module explodedView() {
  translate([-10,-10,0]) printAnnexWalls();
  translate([-10,-10,10]) printAnnexRoof();
  printMainWalls();
  translate([0,0,10]) printMainRoof();
  translate([0,0,20]) printTowerWalls();
  translate([0,0,40]) printTowerRoof();
  translate([0,0,10]) printRailings();
}

/* PRINT VERSIONS OF COMPONENTS */

module printRailings(nr=0) {
   if (nr==0 || nr==1) translate([-10,0,0]) intersection() { 
      difference() {
         wholeRailings();
         translate([22,38,64]) cube([40,90,22]);
      }
      translate([-40,20,64]) rotate([0,0,45]) cube([40,40,22]);
   }
      
   if (nr==0 || nr==2) translate([0,-10,0]) difference() { 
      difference() {
         wholeRailings();
         translate([22,38,64]) cube([40,90,22]);
      }
      translate([-40,20,64]) rotate([0,0,45]) cube([40,40,22]);
   }

   if (nr==0 || nr==3) translate([0,10,0]) intersection() { 
      intersection() {
         wholeRailings();
         translate([22,38,64]) cube([40,90,22]);
      }
      translate([33,93,64]) rotate([0,0,45]) cube([40,40,22]);
   }

   if (nr==0 || nr==4) translate([10,0,0]) difference() { 
      intersection() {
         wholeRailings();
         translate([22,38,64]) cube([40,90,22]);
      }
      translate([33,93,64]) rotate([0,0,45]) cube([40,40,22]);
   }
}

module printTowerWalls() {
   difference() {
      wholeTower();
      translate([-9,87,65+8]) {
         translate([-25.5,-25.5,-1-8]) cube([51,51,17+8]);
         scale([0.85, 0.85, 1]) translate([0,0,15])
            linear_extrude(height=30,scale=1.4) square([60,60],center=true);
         translate([-30*1.4 -1.5,-30*1.4-1.5,42-0.05]) cube([60*1.4+3,60*1.4+3 ,70]);
      }
   }
}

module printTowerRoof() {
   intersection() {
      wholeTower();
      translate([-57,37,42+65+8]) cube([100,100,70]);
   }
}

module printMainWalls() {
   difference() {
      wholeMain();
      translate([-37,23,-1]) cube([94,94,61-9]);
      translate([94/2 -37,94/2 + 23,61-10.1])
         linear_extrude(scale=0.90,height=9.1) translate([-94/2,-94/2])
            square([94,94]);
      translate([-35,25,60]) cube([90,90,10]); // top, where roof fits
   }
}

module printMainRoof() {
   intersection() {
      wholeMain();
      translate([-35,25,60]) cube([90,90,10]);
   }
}

module printAnnexWalls() {
   difference() {
      wholeAnnex();

      /* corner cutout to make room for main building */
      translate([-40,20,-1]) cube([11,57,60]);

      /* hollow it out */
      translate([-77,3,-1]) cube([35,69,60]);
      translate([-45,3,-1]) cube([12,15,60]);

      /* chop the top */
      translate([-90, -2, 47]) cube([65,80,15]);
   }
}

module printAnnexRoof() {
   difference() {
      wholeAnnex();

      /* corner cutout to make room for main building */
      translate([-40,20,-1]) cube([11,57,60]);

      /* cut off the bottom */
      translate([-93, -5, -1]) cube([71,90,48]);
   }
}

/* WHOLE COMPONENTS */

module wholeAnnex() {
   translate([-80,0,0]) {
      cube([50,75,55]);
      translate([40,75.6,47]) rotate([0,0,180]) boltedPanel(width=40);
      translate([-0.6,75,47]) rotate([0,0,-90])
         boltedPanel(width=75,spacing=75/4);
      translate([0,-0.5, 47]) boltedPanel(width=50);
      translate([50.6,0,47]) rotate([0,0,90]) boltedPanel(width=20);

      translate([0, 0, 0]) rotate([0,0,0]) footing();
      translate([50, 0, 0]) rotate([0,0,90]) footing();
      translate([0, 75, 0]) rotate([0,0,-90]) footing();

      translate([36,1,0]) myWindow();
      translate([13,1,0]) myWindow();

      translate([1,61,0]) rotate([0,0,-90]) {
         myWindow();
         translate([23,0,0]) myWindow();
         translate([46,0,0]) myWindow();
      }

      /* rooftop decorations */
      translate([17,35,54.9]) cube([10,17,2.1]);
      translate([26,40,55]) rotate([0,90,0]) cylinder(r=1,h=17,$fn=10);
      translate([26,43,55]) rotate([0,90,0]) cylinder(r=1,h=17,$fn=10);
      translate([26,46,55]) rotate([0,90,0]) cylinder(r=1,h=17,$fn=10);

      translate([13,58,54.9]) cube([12,6,2.0]);
      translate([21,60,55.1]) rotate([90,0,0]) cylinder(r=0.7,h=17,$fn=10);
      translate([19,60,55.1]) rotate([90,0,0]) cylinder(r=0.7,h=17,$fn=10);

      translate([20,13,54.9]) cube([8,10,1.6]);
      translate([24,36,55.1]) rotate([90,0,0]) cylinder(r=0.7,h=17,$fn=10);
      translate([22,36,55.1]) rotate([90,0,0]) cylinder(r=0.7,h=17,$fn=10);
   }
}

module wholeMain() {
   /* fill it in */
   translate([-30,30,0]) cube([85,85,53]);

   /* front door */
   translate([-30,20,0]) {
      cube([90,10,65]);
      translate([-10,-0.5, 57]) boltedPanel(width=100);

      translate([40,1.1,25]) rotate([90,0,0]) scale([0.7,0.7,1]) hexDoor();
      translate([-45/2 + 40,-8.9,0]) cube([45,10,4]);

      translate([90, 0, 0]) rotate([0,0,90]) footing();
   }

   /* another wall (right side from front) */
   translate([50,20,0]) {
      cube([10,97,65]);
      translate([10.6,0,57]) rotate([0,0,90])
         boltedPanel(width=100, spacing=100/4);

      rotate([0,0,-90]) {
         translate([-75,10,0]) tankPipe(pipeRad=4,pipeHt=10);
         translate([-60,10,0]) tankPipe(pipeRad=4,pipeHt=10);
         translate([-45,10,0]) tankPipe(pipeRad=4,pipeHt=10);
      }

      translate([10, 100, 0]) rotate([0,0,180]) footing();
      translate([9.5,17,0]) rotate([0,0,90]) ladder(mult=2);
   }

   translate([-40,20,0]) {
      cube([10,97,65]);
      translate([-0.6,100,57]) rotate([0,0,-90])
         boltedPanel(width=100, spacing=20);
   }

   /* back wall */
   translate([-40,110,0]) {
      cube([100,10,65]);
      translate([100,10.6,57]) rotate([0,0,180]) boltedPanel(width=100);

      translate([0 + 19,30,0]) rotate([0,0,180]) angledSupport(height=57);
      translate([35 + 19,30,0]) rotate([0,0,180]) angledSupport(height=57);
      translate([70 + 19,30,0]) rotate([0,0,180]) angledSupport(height=57);

      translate([0, 10, 0]) rotate([0,0,-90]) footing();
   }

   /* roof */
   translate([-30,20,55]) {
      cube([80,97,10]);

      translate([-5,5,10]) plates();
      translate([25,5,10]) plates();
      translate([55,5,10]) plates();
      translate([55,35,10]) plates();
      translate([55,65,10]) plates();
   }
}

module wholeRailings() {
   translate([-30,20,55]) {
      translate([-10,0,10]) railing(width=100, spacing=20);
      translate([90,30,10]) rotate([0,0,90]) railing(width=70, spacing=28);
      translate([-10,34,10]) rotate([0,0,-90]) railing(width=34, spacing=15);
      translate([90,100,10]) rotate([0,0,180]) railing(width=37, spacing=17);
   }
}

/* BUILDING BLOCK MODULES */

module footing() {
   translate([-1, -1,0]) linear_extrude(height=7,scale=0.5) square([5.1,5.1]);
}


module wholeTower() {
   translate([-9,87,65+8]) tower(open=0); // "+8" is due to new tower height 
}

module tower(open=0) {
   /* bottom of angled part */
   difference() {
      translate([0,0,15]) linear_extrude(height=30,scale=1.4) square([60,60],center=true);
      translate([-50,-50,20]) cube([100,100,30]);
   }

   translate([-30*1.4,-30*1.4,42]) { 
      cube([60*1.4,60*1.4,7]);
      translate([0,-0.5,0]) boltedPanel(width=60*1.4,height=7, spacing=84/4);
      translate([-0.5,60*1.4,0]) rotate([0,0,-90]) boltedPanel(width=60*1.4,height=7, spacing=84/4);
      translate([60*1.4,60*1.4+0.5,0]) rotate([0,0,180]) boltedPanel(width=60*1.4,height=7, spacing=84/4);
      translate([60*1.4+0.5,0,0]) rotate([0,0,90]) boltedPanel(width=60*1.4,height=7, spacing=84/4);
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

   /* fill in the angled component interior */
   if (!open) {
      scale([0.97, 0.97, 1]) translate([0,0,15])
            linear_extrude(height=30,scale=1.4) square([60,60],center=true);
   }

   /* vertical sided bottom component */
   // translate([-30,-30,0]) towerBottom(tbHeight=15.5);
   translate([-30,-30,-8]) towerBottom(tbHeight=23.5);

   /* antenna array */
   translate([5, -5, 48.8]) {
      translate([0,0,0]) cylinder(r=3,h=20, $fn=20);
      translate([4,0,0]) cylinder(r=2.5,h=41, $fn=20);
      translate([3,3,0]) cylinder(r=1.4,h=63, $fn=20);
      translate([4,0,0]) rotate([30,90,0]) cylinder(r=1,h=19,$fn=10);
      translate([0,0,0]) rotate([150,90,0]) cylinder(r=1,h=23,$fn=10);
      translate([3,0,0]) rotate([270,90,0]) cylinder(r=1,h=25,$fn=10);

      rotate([0,0,-30]) translate([20,-1,0]) cube([5,5,1.2]);
      rotate([0,0,90]) translate([22,-5,0]) cube([7,5,1.6]);
      rotate([0,0,-150]) translate([22,-5,0]) cube([6,8,1.3]);
   }
}

module towerBottom(tbHeight=15.5) {
   cube([60,60,tbHeight]);
   translate([61.9,4,2]) rotate([0,0,90]) vent(width=50,height=tbHeight-4);

   translate([7,-0.5,0]) rotate([0,-90,0]) boltedPanel(height=7,width=tbHeight, spacing=30);
   translate([7+53/2,-0.5,0]) rotate([0,-90,0]) boltedPanel(height=7,width=tbHeight, spacing=30);
   translate([60,-0.5,0]) rotate([0,-90,0]) boltedPanel(height=7,width=tbHeight, spacing=30);

   translate([-0.5,0,0]) rotate([-90,-90,0]) boltedPanel(height=7,width=tbHeight, spacing=30);
   translate([-0.5,53/2,0]) rotate([-90,-90,0]) boltedPanel(height=7,width=tbHeight, spacing=30);

   translate([-0.5,53,0]) rotate([-90,-90,0]) boltedPanel(height=7,width=tbHeight, spacing=30);

   translate([7,60.5,tbHeight]) rotate([0,90,180]) boltedPanel(height=7,width=tbHeight, spacing=30);
   translate([7+53/2,60.5,tbHeight]) rotate([0,90,180]) boltedPanel(height=7,width=tbHeight, spacing=30);
   translate([60,60.5,tbHeight]) rotate([0,90,180]) boltedPanel(height=7,width=tbHeight, spacing=30);
}


/* VENT */
module vent(width=20,depth=2,height=13) {
   difference() {
      cube([width, depth, height]);
      translate([0.5,-0.1,0.5]) cube([width-1,0.4, height-1]);
      for (i=[0:(height-1)]) {
         translate([0.5,0.45,0.5+i*1.]) rotate([-30,0,0]) rotate([0,90,0]) cylinder($fn=3,h=width-1, r=0.4);
      }
   }
}

/* FLOOR PLATES */
module plates() {
      translate([15,15]) linear_extrude(height=1,scale=0.95)
         translate([-15,-15]) square([30,30]);

      for (i=[0:13]) {
         translate([1.7,1.7 + 2*i,0.4]) cube([26.8, 0.8, 1]);
      }
      for (j=[0:13]) {
         translate([1.7 + 2*j,1.7,0.4]) cube([0.8, 26.8, 1]);
      }
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
         cylinder(r=1.4 * pipeRad, h=4, center=true, $fn=30);
         for (i = [0 : 8]) {
            rotate([0,0,45 * i]) translate([1.2 * pipeRad, 0, 0])
               cylinder($fn=6,r=0.7, h=2 + 0.6);
            }
         }
      cylinder(r=pipeRad, h=pipeHt, $fn=30);
      translate([0,0,pipeHt]) sphere(r=pipeRad, $fn=30);
      translate([0,0,pipeHt]) rotate([90,0,0]) cylinder(r=pipeRad, h=pipeHt, $fn=30);
   }
}

/* BOLTED PANEL */
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

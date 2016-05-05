mmToIn = 25.4;
$fn=180;

intersection() {
   union() { 
      bottomRing();
      centralRing();
      topRing();
   }

   cutBox();
}

module cutBox(angle=30) {
   difference() {
      cube([20*mmToIn,20*mmToIn,6*mmToIn]);
      rotate([0,0,angle]) translate([0,0,-0.5]) cube([40*mmToIn,20*mmToIn,7*mmToIn]);
   }
}

module centralRing() {
   translate([0,0,16]) difference() {
      union() {
         linear_extrude(height=80-16) difference() {
            circle(r=15*mmToIn + 8);
            circle(r=15*mmToIn+4);
         }
         for (i=[0:2]) { // replace 2 with 35 for full ring 
            rotate([0,0,10*i + 5 + 270]) translate([0,15*mmToIn+3,0]) fancyArch();
         }
      }

      union() /* stuff to difference() out */ {
         for (i=[0:2]) { // replace 2 with 35 for full ring
            rotate([0,0,10*i + 5 + 270]) translate([0,15*mmToIn+6.5,0]) arch();
         }
      }
   }
}

module bottomRing() {
   linear_extrude(height=4) difference() {
      circle(r=15*mmToIn + 30);
      circle(r=15*mmToIn);
   }

   linear_extrude(height=8) difference() {
      circle(r=15*mmToIn + 28);
      circle(r=15*mmToIn);
   }

   linear_extrude(height=16) difference() {
      circle(r=15*mmToIn + 26);
      circle(r=15*mmToIn + 3);
   }
}

module topRing() {
   translate([0,0,80]) {
      linear_extrude(height=5) difference() {
         circle(r=15*mmToIn + 20);
         circle(r=15*mmToIn);
      }

      linear_extrude(height=10) difference() {
         circle(r=15*mmToIn + 12);
         circle(r=15*mmToIn + 7);
      }
   }
}

module fancyArch() {
   archThick = 2;

   rotate([0,0,180]) difference() {
      rotate([-90,0,0]) linear_extrude(height=archThick) translate([0,-40,0]) {
         circle(r=20);
         translate([-20,0,0]) square([40,40]);
      }

      translate([0,1,0]) rotate([-90,0,0]) linear_extrude(height=archThick) translate([0,-40,0]) {
         circle(r=18);
         translate([-18,0,-2]) square([36,40]);
      }
   }
}

module arch() {
   archThick = 2;

   rotate([-90,0,0]) linear_extrude(height=archThick) translate([0,-40,0]) {
      circle(r=20);
      translate([-20,0,0]) square([40,40]);
   }
}


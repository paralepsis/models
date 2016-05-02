include <bintools.scad>

$fn=100;

// % import("/Users/rross/git/models/x-wing/upsilon-shuttle/products/engines.stl");

replacementEngines();

module replacementEngines() {
   block();
   mirror([1,0,0]) engine();
   mirror([0,0,0]) engine();
   centerFin();
}

module centerFin() {
   translate([0,-5.75,0]) rotate([90,0,0]) {
      rotate([0,180,0]) linear_extrude(height=2.8,scale=0.7)
         polygon(points=[[-2.35,0],[-2.35,5.9],[-0.55,8.8],[-0.55,9.5],
                         [0.55,9.5],[0.55,8.8], [2.35,5.9],[2.35,0]]);
      linear_extrude(height=0.8) polygon(points=[[-2.35,0],[-2.35,5.9],
                                                 [-0.55,8.8],[-0.55,9.5],
                                                 [0.55,9.5],[0.55,8.8],
                                                 [2.35,5.9],[2.35,0]]);
   }
}

module block() {
   difference() {
      hull() {
         linear_extrude(height=0.65)
            polygon(points=[[-11.5,6.6], [-11.5,-6.6], [11.5,-6.6],
                            [11.5,6.6]]);

         translate([0,0,4.4]) linear_extrude(height=0.1)
            polygon(points=[[-6.3,0.2], [-6.3,-6.6], [6.3,-6.6], [6.3,0.2]]);
      }
      translate([0,0,0.6]) linear_extrude(height=10)
         polygon(points=[[-5.15,-6.65], [-5.15,-5.95],
                         [-5.96,-4], [5.96,-4],
                         [5.15,-5.95], [5.15,-6.65]]);
   }
}

module engine() {
   dia=6.6;

   translate([3.6,-1.65]) {
      difference() {
         union() {
            cylinder(r=dia/2,h=6.67);
            translate([0,0,6.67]) scale([1,1,2.2]) sphere(r=dia/2);
         }
         translate([0,0,-0.1]) cylinder(r=1.25,h=15);
         translate([-10,-10,11.95]) cube([20,20,20]);
         translate([-10,-10,-20]) cube([20,20,20]);
      }
   }

}

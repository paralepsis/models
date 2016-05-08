difference() {
   union() {
      frame();
      surround();
   }

   translate([-1,-1,-2]) cube([50,50,2]);
}

module surround() {
   translate([3,34,0]) rotate([0,0,-56.5]) rotate([-10,0,0]) {
      /* front */
      difference() {
         cube([35,2,22]);
         translate([(35-9)/2,-0.25,-0.25]) cube([9,2.5,23]);
      }

      /* back */
      translate([(35-20)/2+5,-8.5,0]) cube([10,2,22]);
   
      /* surroundBase */
      surroundBase();
   }
}

module surroundBase() {
   linear_extrude(height=2) polygon(points=[[0,0], [0,2], [35,2], [35,0], 
                                            [27.5,-8.5], [7.5,-8.5]]);
}

module frame() {
   /* bottom */
   linear_extrude(height=2) bottomPoly();

   /* back sides */
   difference() {
      linear_extrude(height=15) bottomPoly();
      translate([2,2,2]) cube([50,50,20]);
   }
}

module bottomPoly() {
   polygon(points=[[7,7],[0,7],[0,42],[28,0],[7,0]]);
}


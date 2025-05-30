difference() {
   union() {
      frame();
      surround();
      linear_extrude(height=1) projection(cut=true) translate([0,0,-0.5]) surround();
   }

   translate([-1,-1,-2]) cube([50,50,2]);
}

translate([20,40,0]) rotate([0,0,-57]) surroundBase();

module surround() {
   translate([7,34,0]) rotate([0,0,-56.5-2]) rotate([-10,0,0]) {

   % translate([0.5,-7,0]) cube([34,8,20]); // rough camera location/space
      /* front */
      difference() {
         cube([35,2,22]);
         translate([(35-9)/2,-0.25,-0.25]) cube([9,2.5,23]);
      }

      /* back */
      translate([(35-20)/2+5,-8.5,0]) cube([10,2,22]);
      translate([(35-20)/2+9,-11.5,0]) cube([2,5,22]);
   
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
   difference() {
      linear_extrude(height=2) bottomPoly();
      translate([7,7,-0.5]) cylinder(r2=4,r1=2,h=5,$fn=50);
   }

   /* back sides */
   difference() {
      linear_extrude(height=25) bottomPoly();
      translate([2,2,-0.5]) cube([50,50,30]);
   }
}

module bottomPoly() {
   polygon(points=[[7,7],[0,7],[0,42],[28,0],[7,0]]);
}


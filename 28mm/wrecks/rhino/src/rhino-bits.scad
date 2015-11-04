% import("../orig/da5id-rhino/rhino-complete-repaired.stl");

// translate([-20,47.5,10]) rotate([74,0,0]) backHatch();
// translate([-20,-10,10]) compartmentFloor(len=56);
// compartmentWalls();

sideDoorOpenings();

module backHatch() {
   difference() {
      cube([40,33,2],center=false);

      backHatchInset();
      translate([20,0,0]) backHatchInset();
   }
}

module backHatchInset() {
   translate([0,0,1.2]) difference() {
      linear_extrude(height=5)
         polygon([[2,2], [18,2], [18,25], [16, 27], [4,27], [2,25]]);
      gridwork();
   }
}

module sideDoorOpenings() {
   translate([18,-8,13.5]) hull() {
      translate([0,1.5,0]) cube([20,16,26]);
      translate([0,0,1.5]) cube([20,19,23]);
   }
   translate([-38,-8,13.5]) hull() {
      translate([0,1.5,0]) cube([20,16,26]);
      translate([0,0,1.5]) cube([20,19,23]);
   }
}

module compartment() {
   translate([-20,-10,10]) compartmentFloor(len=56);
}

module compartmentWalls(len=56) {
   translate([-22,-10,10]) rotate([90,0,90]) linear_extrude(height=2) polygon([[0,0], [len,0], [len+33*cos(74), 33*sin(74)], [0,33*sin(74)]]);
   translate([20,-10,10]) rotate([90,0,90]) linear_extrude(height=2) polygon([[0,0], [len,0], [len+33*cos(74), 33*sin(74)], [0,33*sin(74)]]);
}

module compartmentFloor(len = 56) {
   difference() {
      cube([40,len,2]);

      for (j=[0:18]) {
         translate([1.7 + 2*j,2,1.6]) cube([0.8, len-4, 0.5]);
      }
   }
}

/* gridwork() -- derived from plates() from the outpost
 *
 * Note: The gridwork in the plates() in the outpost were ~0.4mm tall,
 *       I think.
 */
module gridwork() {
  translate([10,-10,0]) rotate([0,0,45]) {
      for (i=[0:20]) {
         translate([1.7,1.7 + 2*i,-0.1]) cube([40, 0.8, 0.5]);
      }
      for (j=[0:20]) {
         translate([1.7 + 2*j,1.7,-0.1]) cube([0.8, 40, 0.5]);
      }
   }
}


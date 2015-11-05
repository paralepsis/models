// % import("../orig/da5id-rhino/rhino-complete-repaired.stl");

translate([0, 35, 12]) rotate([0,0,80]) color("red")
   import("/Users/rross/personal/3dprint/marine/marine-on-base.stl");

$fn=10;

// translate([-20,47.5,10]) rotate([74,0,0]) backHatch();
translate([-20.5,-10,10]) compartmentFloor(len=56);
compartmentWalls();



translate([-19.45,14,11]) seats();
translate([19.45,45.4,11]) rotate([0,0,180]) seats();

module seats() {
   for(i=[0:2]) {
      translate([0,11.2*i,0]) scale([1.2,1.3,1]) {
         /* seat */
         hull() {
            translate([0,0.5,8]) cylinder(r=1,h=2);
            translate([7,0,8]) cylinder(r=1,h=2);
            translate([7,7,8]) cylinder(r=1,h=2);
            translate([0,6.5,8]) cylinder(r=1,h=2);
            translate([-1,0.5,0]) cube([5,6,3]);
         }
   
         /* back */
         translate([-1.2,0,10.8]) rotate([0,-5,0]) hull() {
            translate([0,0.5,0]) rotate([0,90,0]) cylinder(r=1,h=1.5);
            translate([0,6.5,0]) rotate([0,90,0]) cylinder(r=1,h=1.5);
            translate([0,1.25,8]) rotate([0,90,0]) cylinder(r=1,h=1.5);
            translate([0,5.75,8]) rotate([0,90,0]) cylinder(r=1,h=1.5);
         }
      }
   }
}

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

module sideDoorClosed(thick=2) {
   difference() { 
      hull() {
         translate([0,1.5,0]) cube([thick,16,25.6]);
         translate([0,0,1.5]) cube([thick,19,22.6]);
      }
      translate([1.4,9.5,13]) sideDoorCut();
      translate([-9.4,9.5,13]) sideDoorCut();
   }
}
module sideDoorOpenings(thick=20) {
   translate([18,-8,13.9]) hull() {
      translate([0,1.5,0]) cube([thick,16,25.6]);
      translate([0,0,1.5]) cube([thick,19,22.6]);
   }
   translate([-38,-8,13.9]) hull() {
      translate([0,1.5,0]) cube([thick,16,25.6]);
      translate([0,0,1.5]) cube([thick,19,22.6]);
   }
}

module compartment() {
   translate([-20,-10,10]) compartmentFloor(len=56);
}

module compartmentWalls(len=56, doors=0) {
   /* side walls, with door cutouts */
   difference() {
      union() {
         translate([-22.5,-10,10]) rotate([90,0,90]) linear_extrude(height=2)
            polygon([[0,0], [len,0], [len+34*cos(74), 34*sin(74)],
                     [0,34*sin(74)]]);
         translate([20.5,-10,10]) rotate([90,0,90]) linear_extrude(height=2)
            polygon([[0,0], [len,0], [len+34*cos(74), 34*sin(74)],
                     [0,34*sin(74)]]);
         translate([21,-10,10]) cube([10,30,30]);
         translate([-31,-10,10]) cube([10,30,30]);

      }
      sideDoorOpenings();
   }

   if (doors) {
      translate([25.1,-8,13.9]) sideDoorClosed();
      translate([-27.1,-8,13.5]) sideDoorClosed();
   }

   /* wall between drivers and passengers */
   translate([-22,-11,10]) cube([44,2,33]);

   translate([1.05,-8,15]) rotate([90,0,0]) {
      difference() {
         hull() {
            translate([0,0,0]) cylinder(r=2,h=2);
            translate([15,0,0]) cylinder(r=2,h=2);
            translate([0,24,0]) cylinder(r=2,h=2);
            translate([15,24,0]) cylinder(r=2,h=2);
         }
         translate([0,0,-1]) hull() {
            translate([2,2,0]) cylinder(r=2,h=2);
            translate([13,2,0]) cylinder(r=2,h=2);
            translate([2,22,0]) cylinder(r=2,h=2);
            translate([13,22,0]) cylinder(r=2,h=2);
         }
      }

      difference() {
         translate([4,16,0.5]) cube([7,3,1]);
         translate([5.5,17,0.4]) cube([4,1,1.1]);
      }
   }
}

module compartmentFloor(len = 56) {
   difference() {
      cube([41,len,2]);

      for (j=[0:18]) {
         translate([1.7 + 0.25 + 2*j,4,1.6]) cube([0.8, len-6, 0.5]);
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

module sideDoorCut(h) {
   rotate([90,0,90])
   scale([0.018, 0.026, 0.1]) linear_extrude(height=h)
         polygon([[-48.291345,-513.779525],[-48.291345,-442.913385],[58.007875,-407.480315],[58.007875,-301.181095],[-48.291345,-265.748025],[-48.291345,-88.582675],[58.007875,-53.149605],[58.007875,53.149625],[-48.291345,88.582725],[-48.291345,265.748025],[58.007875,301.181125],[58.007875,407.480325],[-48.291345,442.913425],[-48.291345,513.779525],[-58.007875,513.779525],[-58.007875,440.913425],[-58.007875,438.913425],[48.291335,403.480325],[48.291335,305.181125],[-58.007875,269.748025],[-58.007875,84.582725],[48.291335,49.149625],[48.291335,-49.149605],[-58.007875,-84.582675],[-58.007875,-269.748025],[48.291335,-305.181095],[48.291335,-403.480315],[-58.007875,-438.913385],[-58.007875,-513.779525]]);
}


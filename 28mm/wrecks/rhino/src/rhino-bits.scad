// % import("../orig/da5id-rhino/rhino-complete-repaired.stl");
// % import("../orig/da5id-rhino/back-door.stl");

/*
translate([0, 35, 12]) rotate([0,0,80]) color("red")
   import("/Users/rross/personal/3dprint/marine/marine-on-base.stl");
*/

$fn=6;

// translate([-18.5,47.5,10]) rotate([74,0,0]) backHatch();
// translate([-18.5,55.5,8.4]) rotate([74,0,0]) backHatchDiff();

backHatchRedux();

module backHatchRedux() {
   // difference() {
      import("./back-door.stl");
      translate([-19.5,48.3,10]) rotate([74,0,0]) {
          backHatch();
         // backHatchInset();
         // translate([19,0,0]) backHatchInset();
      }
  // }
}

/* REGION TO DIFF OUT OF ORIGINAL MODEL */
// translate([-21,-9,12]) cube([42,69,31]);

/* INTERIOR */
//completeInterior();

/*
translate([25.1,-8,13.9]) sideDoorClosed();
translate([-27.1,-8,13.5]) sideDoorClosed();
*/
//sideDoorOpenings();

// interiorHull();

/* interiorHull() -- cutout for interior that captures all the space that
 *                   we want to fill with the interior. May need to be
 *                   shrunk some to be applied appropriately in Blender.
 */
module interiorHull() {
   difference() {
      hull() difference() {
         union() {
            compartmentWalls(holes=0,doors=0);
            // translate([0.3,-11.5,12]) rotate([0,0,90]) commandControls();
            translate([-21.5,-10,10]) compartmentFloor(len=56.5);
         }
         translate([-40,-20,6.25])cube([80,80,5]);
      }
      translate([30,20,40]) rotate([0,45,0]) cube([30,80,10],center=true);
      translate([-30,20,40]) rotate([0,-45,0]) cube([30,80,10],center=true);
   }
}

module completeInterior() {
   difference() {
      union() {
         translate([-21.5,-10,10]) compartmentFloor(len=56.5);
         compartmentWalls();
         translate([-20.45,14,11]) seats();
         translate([20.45,45.4,11]) rotate([0,0,180]) seats();
         translate([0.3,-11.5,12]) rotate([0,0,90]) commandControls();
      }
      translate([-40,-20,6.25])cube([80,80,5]);
   }
}

/* MODULES */
module seats() {
   for(i=[0:2]) {
      translate([0,11.2*i,0]) scale([1.05,1.3,1]) {
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

module backHatchDiff() {
   cube([37,32.5,10],center=false);
}

module backHatch(inset=1) {
   difference() {
      translate([1,0,0.5]) cube([37,33,1.5],center=false);

      if (inset) {
         backHatchInset();
         translate([19,0,0]) backHatchInset();
      }
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

/* compartmentWalls()
 * holes -- should the model include the component of the body capturing the
 *          holes from the interior out the side doors?
 * doors -- should the (interior) side doors be included in the model?
 */
module compartmentWalls(len=56,holes=1,doors=0) {
   /* side walls, with door cutouts */
   difference() {
      union() {
         translate([-22.4,-10,10]) rotate([90,0,90]) linear_extrude(height=0.9)
            polygon([[0,0], [len,0], [len+34*cos(74), 34*sin(74)],
                     [0,34*sin(74)]]);
         translate([21.4,-10,10]) rotate([90,0,90]) linear_extrude(height=0.9)
            polygon([[0,0], [len,0], [len+34*cos(74), 34*sin(74)],
                     [0,34*sin(74)]]);
         if (holes == 1) {
            translate([22,-10,10]) cube([10.05,30,30]);
            translate([-32,-10,10]) cube([10.05,30,30]);
         }
      }
      if (holes == 1) {
         sideDoorOpenings();
      }
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
         translate([4,18,0.5]) cube([7,3,1]);
         translate([5.5,19,0.4]) cube([4,1,1.1]);
      }
   }
}

module commandControls() {
   translate([0,0,10]) {
      translate([2.5,4,4]) rotate([0,-14,0]) rotate([90,0,90]) {
         translate([-1.5,-2.5,-1.6]) cube([18,5.75,2.75],center=false);

         for (i = [0:14]) {
            for (j = [0:3]) {
               translate([1.1*i - 0.25,1.1*j - 1.5,0])
                  cube([0.75,0.75,3.5],center=true);
            }
         }
      }
   }

   translate([1.7,2,19]) rotate([0,5,5]) cube([1.8,9,7]);
   translate([1.0,12,19]) rotate([0,5,-5]) cube([1.8,9,7]);
}

module compartmentFloor(len = 56) {
   difference() {
      translate([0,0,1.25]) cube([44.,len,0.75]);

      for (j=[0:18]) {
         translate([3.3 + 2*j,4,1.6]) cube([0.8, len-6, 0.5]);
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


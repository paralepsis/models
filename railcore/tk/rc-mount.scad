$fn=80;

if (1) difference() {
   union() {
      horizontal_form();
      vertical_form();
   }
   cutouts();
}

//orig();


module orig() {
   translate([-0.1,0.1,0]) import("./tk-mount-jslaker.stl");
}

module vertical_form() {
   hull() {
      translate([13.89,0,25.35]) rotate([0,90,0]) cylinder(d=7.8,h=3.51);
      translate([13.39,0,25.35]) rotate([0,90,0]) cylinder(d=6.8,h=4.01);

      translate([13.89,7.5,3.5]) rotate([0,90,0]) cylinder(d=7.8,h=3.51);
      translate([13.39,7.5,3.5]) rotate([0,90,0]) cylinder(d=6.8,h=4.01);

      translate([13.89,-7.5,3.5]) rotate([0,90,0]) cylinder(d=7.8,h=3.51);
      translate([13.39,-7.5,3.5]) rotate([0,90,0]) cylinder(d=6.8,h=4.01);

      translate([13.39+3/2+.25+.5,0,5.55+4.1/2]) cube([3.5,24,4.1],center=true);
      translate([13.39+4/2,0,5.55+4.1/2]) cube([4,23,4.1],center=true);
   }

   // bevels
   difference() {
      translate([13.5,0,5.1+5/2]) cube([4.5,20,10],center=true);
      translate([10.9,0,2.6]) rotate([90,0,0]) translate([0,0,-15]) cylinder(d=5,h=30);
      translate([10.9,0,12.6]) rotate([90,0,0]) translate([0,0,-15]) cylinder(d=5,h=30);
   }
}



module cutouts() {
   // center hole
   cylinder(d=4.5,h=11);
   translate([0,0,5.075]) cylinder(d1=5.5,d2=4.5,h=.5);
   translate([0,0,9.61]) cylinder(d2=5.5,d1=4.5,h=.5);

   // hotend mounting holes
   for (i=[0:3]) {
      rotate([0,0,i*90+45]) translate([8,0,0]) cylinder(d=3.4,h=11);
      rotate([0,0,i*90+45]) translate([8,0,5.075]) cylinder(d1=4.5,d2=3.4,h=0.5);
   }

  // mount to toolhead
  translate([10,0,25.35]) rotate([0,90,0]) cylinder(d=3.4,h=8);
  translate([10,-7.5,3.5]) rotate([0,90,0]) cylinder(d=3.4,h=8); // 7.6?
  translate([10,7.5,3.5]) rotate([0,90,0]) cylinder(d=3.4,h=8);
  translate([9,-7.5,3.5]) rotate([0,90,0]) cylinder(d=6.0,h=4.39);
  translate([9,7.5,3.5]) rotate([0,90,0]) cylinder(d=6.0,h=4.39);
}

module horizontal_form() {
   hull() {
      translate([0,0,5.55]) cylinder(d=24,h=4.1);
      translate([0,0,5.1]) cylinder(d=23,h=5.0);
      translate([14.9,0,5.55+4.1/2]) cube([5,24,4.1],center=true);
      translate([14.9,0,5.1+5/2]) cube([5,23,5],center=true);
   }
}

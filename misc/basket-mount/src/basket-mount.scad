$fn=50;

// % v0();

rotate([180,0,0]) difference() {
   linear_extrude(height=11.5) projection() hull() {
      translate([0,0,0]) cylinder(d=18,h=5);
      translate([0,-5,4]) rotate([78,0,0]) cylinder(d=10, h=15);
   }
   union() {
     translate([0,0,4.3]) cylinder(d=9.0,h=10);
      translate([0,0,0]) cylinder(d=4.4,h=4.1);
      // translate([0,0,-0.15]) cylinder(d=4.4,h=1.4);

      /* cutout for the drywall mount's top... */
      translate([0,0,-0.1]) cylinder(d=13,h=1.4);

      translate([0,-7,4]) rotate([78,0,0]) cylinder(d=5, h=17);
   }
}

module v0() {
   difference() {
      linear_extrude(height=11) projection() hull() {
         translate([0,0,0]) cylinder(d=18,h=5);
         translate([0,-5,4]) rotate([80,0,0]) cylinder(d=10, h=17);
      }
      union() {
        translate([0,0,3.3]) cylinder(d=8.2,h=10);
         translate([0,0,1.4]) cylinder(d=3.6,h=5);
         translate([0,0,-0.1]) cylinder(d=3.6,h=1.4);
   
         /* cutout for the drywall mount's top... */
         translate([0,0,-0.1]) cylinder(d=12.6,h=1.4);
   
         translate([0,-7,4]) rotate([80,0,0]) cylinder(d=5, h=17);
      }
   }
}


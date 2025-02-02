$fn=120;

difference() {
   hull() union() {
      if (1) difference() {
         translate([0,10,0])scale([1,0.65,.07]) sphere(r=60);
         translate([0,-45,0]) cube([141,80,30], center=true);
      }

      if (1) intersection() {
         union() {
            translate([-35,-5,0]) scale([1,0.45,.2]) sphere(r=35);
            translate([35,-5,0]) scale([1,0.45,.2]) sphere(r=35);
         }
         translate([0,-20,0]) cube([141,40,30], center=true);
      }
   }
   translate([0,0,-20]) cube([200,200,40],center=true);
   translate([0,-7,6]) rotate([-4,0,0]) cube ([120,2,10],center=true);
}


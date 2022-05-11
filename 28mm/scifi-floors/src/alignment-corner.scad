$fn=40;

difference() {
   hull() {
      cylinder(r=2,h=82);
      translate([40,0,0]) cylinder(r=2,h=82);
      translate([40,40,0]) cylinder(r=2,h=82);
      translate([0,40,0]) cylinder(r=2,h=82);
   }
   translate([0,0,2]) cube([50,50,90]);
}


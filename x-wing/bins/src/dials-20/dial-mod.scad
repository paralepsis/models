$fn=80;

if (1) {
   hull() {
      color("red") translate([-55,26,-1]) cylinder(d=12,h=5);
      color("red") translate([55,26,-1]) cylinder(d=12,h=5);
   }

   hull() {
      color("red") translate([-55,-26,-1]) cylinder(d=12,h=5);
      color("red") translate([55,-26,-1]) cylinder(d=12,h=5);
   }
}

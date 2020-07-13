$fn=30;


difference() {
   hull() {
      translate([25.4 * 7.70 -2.4, 2.4,0]) cylinder(r=2.4,h=25.4 * 5.0);
      translate([25.4 * 7.70 - 2.4, 25.4 * 12 - 2.4,0]) cylinder(r=2.4,h=25.4 * 5.0);
      translate([2.4, 2.4,0]) cylinder(r=2.4,h=25.4 * 5.0);
      translate([2.4, 25.4 * 12 - 2.4,0]) cylinder(r=2.4,h=25.4 * 5.0);
   }

   translate([2.4,2.4,2]) cube([25.4 * 6.125, 25.4 * 12 - 4.8, 25.4 * 5.5]);
   translate([25.4 * 6.125 + 2.4 + 2.4,2.4,2]) cube([25.4 * 1.3, 25.4 * 12 - 4.8, 25.4 * 5.5]);
}

if (0) hull() {
   translate([25.4 * 6.125 + 2.4, 2.4,0]) cylinder(r=2.4,h=25.4 * 5.0);
   translate([25.4 * 6.125 + 2.4, 25.4 * 12 - 2.4,0]) cylinder(r=2.4,h=25.4 * 5.0);
   translate([2.4, 2.4,0]) cylinder(r=2.4,h=25.4 * 5.0);
   translate([2.4, 25.4 * 12 - 2.4,0]) cylinder(r=2.4,h=25.4 * 5.0);
}

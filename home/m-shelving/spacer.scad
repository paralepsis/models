$fn=40;

difference() {
   hull() {
      translate([-6,-6,0]) cylinder(r=1.5,h=20);
      translate([-6,6,0]) cylinder(r=1.5,h=20);
      translate([6,-6,0]) cylinder(r=1.5,h=20);
      translate([6,6,0]) cylinder(r=1.5,h=20);
   }
   translate([0,0,-1]) cylinder(d=5,h=22);
}

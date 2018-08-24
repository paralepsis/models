$fn=120;

difference() {
   union() {
      cylinder(d=52,h=4);
      cylinder(d1=41.25,d2=40.25,h=29);
   }
   translate([0,0,-0.5]) cylinder(d1=36, d2=35.5, h=30);
}

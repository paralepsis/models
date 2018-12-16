$fn=80;

difference() {
   union() { 
      translate([0,0,1.0]) cylinder(r1=20.6/2, r2=18.6/2, h=3);
      cylinder(r=20.6/2, h=1.05);
   }
   translate([0,0,2.5]) cylinder(r=12,h=4);
}

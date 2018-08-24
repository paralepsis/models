$fn=80;

difference() {
   cylinder(h=5,d1=9,d2=7);
   translate([0,0,1.2]) cylinder(h=5,d=3.4);
   translate([0,0,-0.1]) cylinder(h=1.1,d=2.1);
}

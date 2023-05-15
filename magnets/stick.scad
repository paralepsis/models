$fn=100;

difference() {
   cylinder($fn=6,d=10,h=50);
   translate([0,0,-0.01]) cylinder(d=5,h=2.01);
   translate([0,0,1.99]) cylinder(d1=5,d2=0.1,h=2);
   translate([0,0,50-1.99]) cylinder(d=5,h=2);
}

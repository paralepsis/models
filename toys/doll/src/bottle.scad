// calico critter bottle

$fn=40;

if (1) {
   for (i=[0:3]) {
      for (j=[0:3]) {
         translate([10*i,10*j,0]) bottle();
      }
   }
}
else {
   bottle();
}

module bottle() {
   cylinder(h=10.1, d1=8, d2=8);
   translate([0,0,10]) cylinder(h=1.02,d1=8,d2=6);
   translate([0,0,11]) cylinder(h=1.02,d1=6,d2=8);
   translate([0,0,12]) cylinder(h=2.02,d1=8,d2=5.5);
   translate([0,0,14]) cylinder(h=1,d=4.5);
   translate([0,0,14]) cylinder(h=3.02,d1=4,d2=2.4);
   translate([0,0,17]) cylinder(h=1.8,d=2.4);
   translate([0,0,18.5]) sphere(r=1.2);
}

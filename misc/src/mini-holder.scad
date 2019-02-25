$fn=80;

difference() {
   cylinder(d=35,h=35);
   translate([0,0,3]) cylinder(d=25,h=40);

   for (i=[0:11]) {
      rotate([0,0,360*i/12]) translate([35/2+2,0,-1]) cylinder(h=50,r=3);
   }
}

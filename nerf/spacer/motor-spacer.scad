difference() {
   intersection() {
      cylinder($fn=40,d=20.5,h=1);
      translate([-22/2,-15/2,-0.1]) cube([22,15,1]);
   }

   translate([0,0,-0.1]) cylinder($fn=40,d=7,h=1.2); // center
   for (i=[0:1]) rotate([0,0,180*i]) hull() {
      rotate([0,0,14]) translate([15.5/2,0,-0.1]) cylinder($fn=40,d=2.5,h=1.2); // center
      rotate([0,0,16]) translate([15.5/2,0,-0.1]) cylinder($fn=40,d=2.5,h=1.2); // center
   }
}

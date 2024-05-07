translate([15,0,0]) difference() {
   union() {
      translate([-10/2,-7/2,0]) cube([10,7,1.5]);
      cylinder($fn=40,d=5,h=3);
   }
   translate([0,0,-0.1]) cylinder($fn=40,d=3.2,h=2.1);
}

difference() {
   union() {
      cylinder($fn=40,d=8,h=1.2);
      cylinder($fn=40,d=5,h=2.2);
   }
   translate([0,0,0.2]) cylinder($fn=40,d=3.2,h=2.1);
}

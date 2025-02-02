difference() {
   union() {
      cylinder(d=60,h=3);
      translate([-10,0,0]) cylinder($fn=80,d=10,h=50);
      translate([-10,0,0]) cylinder($fn=80,d1=20,d2=10,h=5);
   }
   translate([-10,0,-0.5]) cylinder($fn=80,d=8,h=51);
}

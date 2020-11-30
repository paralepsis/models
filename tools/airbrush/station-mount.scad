$fn=60;

gasket();

// gasket() -- the "bottom" piece, also a template for a foam gasket
//
module gasket(ht=4.5) {

   difference() {
      cylinder(d=170,h=ht);
      translate([0,0,-0.1]) cylinder(d=125,h=ht+0.2);
      for(i=[0:3]) {
         rotate([0,0,i*90+45]) boltGap(ht=ht);
      }
   }
}

// boltGap -- used by gasket() 
//
module boltGap(ht=3) {
   translate([148/2,0,-0.1]) {
      hull() {
         cylinder(d=15,h=ht+0.2);
         translate([-13,-7.5,0]) cube([1,15,ht+0.2]);
      }
   }
}

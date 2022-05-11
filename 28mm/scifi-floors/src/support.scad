for (i=[0:3]) {
   rotate([0,0,90*i]) side();
}

module side() {
   difference() {
      translate([0,-10,0]) cube([50,20,67]);
      translate([50,15,33.5]) scale([1,1,1.2]) rotate([90,0,0]) cylinder($fn=4,d=45,h=30);
   }
}

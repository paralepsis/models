difference() {
   union() {
      for(i=[-1,1]) translate([7*i,0,0]) cylinder($fn=40,d=8,h=8);
      translate([-7,-1,0]) cube([14,5,8]);
   }

   for(i=[-1,1]) translate([7*i,0,-1]) {
      cylinder(d=2.8,h=12,$fn=20);
      translate([0,0,8]) cylinder(d=4,h=4, $fn=30);
   }

   translate([-3,-5,-1]) cube([6,10,3]);
   translate([0,-5,2]) rotate([-90,0,0]) cylinder($fn=40,d=6,h=10);
}

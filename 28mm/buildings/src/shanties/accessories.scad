$fn=100;

module waterStoreBottom() {
   scale([1,1,1]) {
      cylinder(r2=28/2,r1=26/2,h=7);
      translate([0,0,6.95]) cylinder(r2=33/2,r1=30/2,h=7);
   }
}

module waterStoreTop() {
   scale([1,1,1]) {
      cylinder(r1=35/2,r2=34/2,h=1);
      translate([0,0,0.95]) cylinder(r1=34/2,r2=10/2,h=3);
   }
}

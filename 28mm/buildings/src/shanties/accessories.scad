$fn=100;

translate([40,0,13.95]) rotate([180,0,0]) waterStoreBottom();
waterStoreTop();

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
      translate([0,0,2.95]) cylinder(r=10/2,h=2);

      for (i=[0:5]) {
         rotate([0,0,360/6*i]) translate([0,0.5,0]) rotate([90,0,0])
         linear_extrude(height=1)
         polygon(points=[[0,0], [34/2,0], [34/2,1.25], [10/2,4.95], [10/2,0]]);

      }
   }
}

$fn=80;
thick=13;

mirror([0,1,0]) difference() {
   union() {
      translate([-8,0,0]) cube([40,15,thick]);
      translate([-8,0,0]) cube([40, 51,5]);

      translate([27,0,0]) rotate([90,0,90]) linear_extrude(height=5)
         polygon(points=[[15,0], [15,thick],[51,5], [51,0]]);
   }

   translate([18,23,-0.5]) cylinder(d=4.2,h=10);
   translate([18,43,-0.5]) cylinder(d=4.2,h=10);

   translate([-9,-1,4]) cube([50,10,5]);

   translate([5,4,-1]) cylinder(d=3.2,h=20);
   translate([15,4,-1]) cylinder(d=3.2,h=20);

}


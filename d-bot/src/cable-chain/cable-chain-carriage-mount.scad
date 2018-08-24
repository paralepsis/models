$fn=80;
thick=14;

mirror([0,1,0]) difference() {
   union() {
      translate([-8,0,0]) cube([40,19,thick]);
      hull() {
         translate([-8+20,0,0]) cube([20, 55,5]);
         translate([-8,0,0]) cube([20, 31,5]);
         translate([-3,55-5,0]) cylinder(h=5,r=5);
      }

      translate([27,0,0]) rotate([90,0,90]) linear_extrude(height=5)
         polygon(points=[[19,0], [19,thick],[55,5], [55,0]]);
   }

   // translate([18,23,-0.5]) cylinder(d=4.2,h=10);
   translate([18,29,-0.5]) cylinder(d=4.2,h=10);
   translate([18,48,-0.5]) cylinder(d=4.2,h=10);

   // cutout for carriage wall
   translate([-9,-1,4]) cube([50,10,5.5]);

   translate([5,4,-1]) cylinder(d=3.2,h=20);
   translate([15,4,-1]) cylinder(d=3.2,h=20);

}


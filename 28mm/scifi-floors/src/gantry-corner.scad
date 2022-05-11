translate([-400,-320,0]) import("./walkway-width-grid-top-3.5mm.stl");

difference() {
   linear_extrude(height=3.5) translate([-71.04,46.967,0])
      polygon(points=[[133.04,-46.967],[78.041,-46.967],[71.04,-53.943],
                      [71.04,-108.94],[91.54,-108.94],[133.04,-67.461]]);

   translate([0,0,2.6]) linear_extrude(height=3.5) translate([-71.04,46.967,0])
      polygon(points=[[133.04-1.5,-46.967-1.5],[78.041+1.5,-46.967-1.5],
                      [71.04+1.5,-53.943-1.5],
                      [71.04+1.5,-108.94+1.5],[91.54-1.5,-108.94+1.5],
                      [133.04-1.5,-67.461+1.5]]);

   translate([22,-55,0.5]) rotate([0,0,45]) for (i=[0:16]) translate([2.8*i,0,0.4]) cube([1.8,7.3,5]);

   translate([20,-10.5,0.5]) for (i=[-1:10]) translate([2.8*i,0,0.4]) cube([1.8,7.3,5]);

   translate([10.5,-39,0.5]) rotate([0,0,90]) for (i=[-4:7]) translate([2.8*i,0,0.4]) cube([1.8,7.3,5]);

   translate([3.3,-58.8,0.5]) cube([7.3,7.3,5]);
   translate([51.5,-10.5,0.5]) cube([7.3,7.3,5]);

   translate([16,-34,0.5]) scale([1.1,1.1,1.0]) centerpiece();
}

translate([11.5,-61.5,0]) cube([2.8,60,3.15]);
translate([1.5,-14.6,0]) cube([60,2.8,3.15]);

translate([14,-50,0]) rotate([0,0,45]) cube([50,2.8,3.15]);

module centerpiece() {
   cube([7.3,7.3,5]);
   // translate([7.3+1.8,0,0]) cube([7.3,7.3,5]);
   translate([7.3+1.8,7.3+1.8,0]) cube([7.3,7.3,5]);
   translate([0,7.3+1.8,0]) cube([7.3,7.3,5]);
}

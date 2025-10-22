$fn=80;

difference() {
   union() {
      hull() {
         translate([0,0,2]) scale([1.00,.4,.2]) sphere(d=60);
         translate ([0,30,]) cube([38,60,4], center=true);
      }
      translate([0,0,3]) scale([1.0,.4,.3]) sphere(d=60);
   }
   translate([0,0,-10]) cube([140,140,20],center=true);
   translate([0,-2,0]) for(i=[0:2]) translate([15*i-15,60,-2]) {
      cylinder(d=3.5,h=5);
      translate([-1.75,0,0]) cube([3.5,3,5]);
   }
}


$fn=30;

translate([1,3.5,0]) jaw();
translate([-1,-3.5,0]) mirror([0,1,0,]) jaw();

cylinder(r=6,h=1);
cylinder(r=4,h=5);
for (i=[0:7]) {
   rotate([0,0,360/8*i]) translate([5,0,1]) sphere(r=0.5);
}

module jaw() { 
   difference() {
      union() { 
         for (i=[0:7]) {
            rotate([0,0,i*22.5+11]) translate([9.7,0,4]) rotate([0,-90,0])
               scale([1.3,1,1]) cylinder($fn=3, h=2,r=3);
         }

         difference() {
            cylinder(r1=10.0,r2=10,h=4);
            translate([0,0,-0.5]) cylinder(r=8,h=5);
         }
      }

      translate([0,-15,0]) cube([30,30,30],center=true);
   }
}

module foo() {
   rotate_extrude() translate([12,0,0]) circle(r=6);
   linear_extrude(scale=2,height=30) difference() { 
      circle(r=8);
      circle(r=6);
   }
}

difference() {
   cylinder(r1=12,r2=21,h=30);
   translate([0,0,-0.5]) cylinder(r=6,h=31);
   hull() translate([0,0,30]) scale([1,1,1])
      rotate_extrude() translate([9,0,0]) circle(r=9.0);
}

translate([0,0,30]) difference() {
   cylinder(r=21,h=30);
   translate([0,0,-0.5]) cylinder(r=18,h=31);
}


w=10;

difference() {
   hull() {
      translate([2,2,0]) cylinder(r=2,h=0.9);
      translate([200,2,0]) cylinder(r=2,h=0.9);
      translate([2,200,0]) cylinder(r=2,h=0.9);
      translate([198,200,0]) cylinder(r=2,h=0.9);
   }

   for (i=[0:15]) {
      for (j=[0:15]) {
         translate([(w+2.4)*i + 2.4,(w+2.4)*j + 2.4,-0.5]) cube([w,w,5]);
      }
   }
}

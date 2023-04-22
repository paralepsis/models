$fn=80;

module bottom(r1=13,r2=15,r3=18.5,r4=21.5) {
   intersection() {
      difference() {
         difference() {
            union() {
               cylinder (r=r2,h=20);
               cylinder (r=r4,h=10);
            }
            translate([0,0,2]) cylinder (r=r1,h=31);
         }
         translate([0,0,2]) difference() {
            cylinder (r=r3,h=40);
            cylinder (r=r2,h=41);
         }
      }
      translate([0,0,-1]) cube([30,30,20],center=false);
   }
}


module moreform() {
   translate([-100,13,0]) cube([100,2,19]);
   translate([-100,13-50,0]) cube([100,8.5+50,2]);
   translate([-100,18.5,0]) cube([100,3,10]);

   translate([13,-100,0]) cube([2,100,19]);
   translate([13-50,-100,0]) cube([8.5+50,100,2]);
   translate([18.5,-100,0]) cube([3,100,10]);
}

difference() {
   union() {
      translate([0,0,0]) bottom();
      translate([0,0,0]) moreform();
   }
   translate([-48,-48,-1]) cylinder(d1=120,d2=116,h=4);
}

$fn=100;

cupD1 = 47;
cupD2 = 57;
cupH  = 27;


difference() {
   union() {
      hull() {
         translate([-cupD2/2-5,0,0]) cylinder(d1=80,d2=60,h=29);
         translate([cupD2/2+5,0,0]) cylinder(d1=80,d2=60,h=29);
      }
      difference() {
         hull() {
            translate([-33,0,0]) cylinder(d1=95,d2=97,h=4);
            translate([33,0,0]) cylinder(d1=95,d2=97,h=4);
         }
         hull() {
            translate([-33,0,1]) cylinder(d1=90,d2=92,h=4);
            translate([33,0,1]) cylinder(d1=90,d2=92,h=4);
         }
      }
   }
   translate([-cupD2/2-5,0,2.1]) cylinder(d1=cupD1,d2=cupD2,h=27);
   translate([cupD2/2+5,0,2.1]) cylinder(d1=cupD1,d2=cupD2,h=27);
   translate([0,-20,-0.10]) cylinder(d=20,h=25);
   translate([0,20,-0.10]) cylinder(d=20,h=25);

   if (0) translate([0,0,24]) cube([100,100,50]);
}



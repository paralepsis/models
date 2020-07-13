$fn=120;
rad = 25/2+0.0;
ht  = 4.75;
angle = 25;

% translate([0,0,3.0]) ring2();
elite();

module elite() {
   union() {
      cylinder(h=3.0,r=rad+1.6);
      translate([0,0,2.9]) cylinder(h=0.75,r1=rad-1.6, r2=rad-1.7);
   }
}

module ring2() {
   if (1) difference() {
      union() {
         hull() {
            for (i=[0:1]) {
               rotate([0,0,i*180]) translate([rad+1,-3.5,-1.0]) rotate([0,-1*angle,0]) cube([2,7,0.91+1.5]);
            }
            // cylinder(h=0.91+1.5, r=rad+1.6);
            cylinder(h=0.91+1.5, r=rad+1.6);
         }

         for (i=[0:1]) {
            rotate([0,0,i*180]) translate([rad+1,-3.5,-1.0]) rotate([0,-1*angle,0]) cube([2,7,ht+2]);
         }
         cylinder(h=0.91+1.5, r=rad+1.6);
      }

      /* cut down to base shape */
      translate([0,0,0.91]) cylinder(h=10,r=rad+0.4);
      translate([0,0,-0.1]) cylinder(h=10,r=rad-1.5);
      translate([0,0,ht]) cylinder(h=10,r=rad+5);
      translate([0,0,-2]) cylinder(h=2,r=rad+5);
   }

   // add back in the posts
   intersection() {
      for (i=[0:1]) {
         rotate([0,0,i*180-11]) translate([rad+1,0,0]) rotate([0,-4,0]) cylinder(r=1,h=ht+1);
         rotate([0,0,i*180+11]) translate([rad+1,0,0]) rotate([0,-4,0]) cylinder(r=1,h=ht+1);
         rotate([0,0,i*180]) translate([rad+1.75,-3.5,-0.5]) rotate([0,-1*angle,0]) cube([1,7,ht+3]);
      }
      translate([0,0,0.91+1.5]) cylinder(r=rad+0.5,h=ht-0.91-1.5);
   }

   difference() {
      intersection() {
         for (i=[0:1]) {
            rotate([0,0,i*180-11]) translate([rad+2,0,0]) rotate([0,-24,0]) cylinder(r=1,h=ht+1);
            rotate([0,0,i*180+11]) translate([rad+2.0,0,0]) rotate([0,-24,0]) cylinder(r=1,h=ht+1);
         }
         cylinder(r=rad+1,h=10);
      }
      translate([0,0,2.41]) cylinder(r=rad+5,h=10);
      translate([0,0,-2]) cylinder(r=rad+5,h=2);
   }
}

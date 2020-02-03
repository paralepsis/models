$fn=120;
rad = 25/2+0.0;
ht  = 4.75;
angle = 25;

//% eliteDDAS();
//translate([0,0,3.5]) ringLitko();
tool();

module tool() {
   translate([0,0,50]) rotate([0,180,0]) difference() {
      cylinder(r=rad+3,h=50);
      cube([50,8,6], center=true);
      translate([0,0,-1]) cylinder(r=9,h=60);
   }
}

module ringLitko() {

   /* nice hull body */
   difference() {
      union() {
         for (i=[0:1]) {
            rotate([0,0,i*180]) translate([rad+1.6,-3.5,-1.0]) rotate([0,-1*angle,0]) translate([1,0,0]) cube([1,7,6]);
         }
         hull() {
            for (i=[0:1]) {
               rotate([0,0,i*180]) translate([rad+1.6,-3.5,-1.0]) rotate([0,-1*angle,0]) cube([2,7,0.91+1.5]);
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

      /* magnets? */
      for (i=[0:1]) {
         rotate([0,0,i*180]) translate([rad+1.45,0,-0.1]) cylinder(h=1.3,d=2.2);
      }
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

ddas_ht  = 4;

module eliteDDAS() {
   difference() {
      linear_extrude(height=3.0) projection() ringDDAS();

      /* magnets? */
      for (i=[0:1]) {
         rotate([0,0,i*180]) translate([rad+1.45,0,1.8]) cylinder(h=5,d=2.2);
      }
   }
}

module ringDDAS() {
   difference() {
      union() {
         hull() {
            for (i=[0:1]) {
               rotate([0,0,i*180]) translate([rad+1.6,-3.5,-1.0]) rotate([0,-1*angle,0]) cube([2,7,ddas_ht+1]);
            }
            cylinder(h=ht, r=rad+1.6);
         }
      }

      /* cut down to base shape */
      /* note: thicker inner ring than ring-2, trying magnet idea */
      translate([0,0,1.21]) cylinder(h=10,r=rad+0.4);
      translate([0,0,-0.1]) cylinder(h=10,r=rad-1.5);
      translate([0,0,ht]) cylinder(h=10,r=rad+5);
      translate([0,0,-2]) cylinder(h=2,r=rad+5);

   }
}

$fn=120;
ht  = 4.75;
angle = 25;
litkoRad = 25.0/2; /* used a lot of places, probably should not tweak */

/* parameters for tweaking fit */
litkoSlop = 0.4; /* makes opening for Litko base slightly larger */
postSlop  = 0.8; /* shifts little posts further from center */
magnetRad = 2.2/2;
magnetHt  = 1.3;
moreHt    = 0.15; /* add additional height on bottom of base (fit magnet) */

translate([0,0,moreHt]) ringLitko(myPostSlop=postSlop);
linear_extrude(height=moreHt+0.001) projection(cut=true)
   translate([0,0,-0.001]) ringLitko(myPostSlop=postSlop);

/* search the parameter space */
if (0) for (i=[0:3]) {
   slop = 0.5 + 0.15*i;
   translate([0,40*i,0]) {
      translate([0,0,moreHt]) ringLitko(myPostSlop=slop);
      linear_extrude(height=moreHt+0.001) projection(cut=true)
         translate([0,0,-0.001]) ringLitko(myPostSlop=slop);
      label(labelText=str(slop));
   }
}

module label(labelText="Hi") {
   difference() {
      translate([4,13,0]) hull() {
         translate([0,0,0]) cylinder(r=2,h=0.9);
         translate([21,0,0]) cylinder(r=2,h=0.9);
         translate([0,8,0]) cylinder(r=2,h=0.9);
         translate([21,8,0]) cylinder(r=2,h=0.9);
      }
      translate([5,13.5,0.3]) scale([0.75,0.75,1]) linear_extrude(height=1) text(text=labelText);
   }

}

module ringLitko(myPostSlop = postSlop) {
   /* nice hull body */
   difference() {
      union() {
         for (i=[0:1]) {
            rotate([0,0,i*180]) translate([litkoRad+1.6,-3.5,-1.0]) rotate([0,-1*angle,0]) translate([1,0,0]) cube([1,7,6]);
         }
         hull() {
            for (i=[0:1]) {
               rotate([0,0,i*180]) translate([litkoRad+1.6,-3.5,-1.0]) rotate([0,-1*angle,0]) cube([2,7,0.91+1.5]);
            }
            // cylinder(h=0.91+1.5, r=litkoRad+1.6);
            cylinder(h=0.91+1.5, r=litkoRad+1.6);
         }

         for (i=[0:1]) {
            rotate([0,0,i*180]) translate([litkoRad+1,-3.5,-1.0]) rotate([0,-1*angle,0]) cube([2,7,ht+2]);
         }
         cylinder(h=0.91+1.5, r=litkoRad+1.6);
      }

      /* cut down to base shape */
      translate([0,0,0.91]) cylinder(h=10,r=litkoRad+litkoSlop); /* interior cutout */
      translate([0,0,-0.1]) cylinder(h=10,r=litkoRad-1.5); /* through bottom */
      translate([0,0,ht]) cylinder(h=10,r=litkoRad+5);     /* clean top */
      translate([0,0,-2]) cylinder(h=2,r=litkoRad+5);      /* clean bottom */

      /* magnets? */
      for (i=[0:1]) {
         rotate([0,0,i*180]) translate([litkoRad+1.45,0,-0.1]) cylinder(h=magnetHt,r=magnetRad);
      }
   }

   /* add back in the posts */
   intersection() {
      for (i=[0:1]) {
         rotate([0,0,i*180-11]) translate([litkoRad+myPostSlop,0,0]) rotate([0,-4,0]) cylinder(r=1,h=ht+1);
         rotate([0,0,i*180+11]) translate([litkoRad+myPostSlop,0,0]) rotate([0,-4,0]) cylinder(r=1,h=ht+1);
         rotate([0,0,i*180]) translate([litkoRad+1.75,-3.5,-0.5]) rotate([0,-1*angle,0]) cube([1,7,ht+3]);
      }
      translate([0,0,0.91+1.5]) cylinder(r=litkoRad+0.5,h=ht-0.91-1.5); /* cut top again */
   }

   /* angled posts on interior to help grip */
   difference() {
      intersection() {
         for (i=[0:1]) {
            rotate([0,0,i*180-11]) translate([litkoRad+myPostSlop+1,0,0]) rotate([0,-24,0]) cylinder(r=1,h=ht+1);
            rotate([0,0,i*180+11]) translate([litkoRad+myPostSlop+1,0,0]) rotate([0,-24,0]) cylinder(r=1,h=ht+1);
         }
         cylinder(r=litkoRad+1,h=10);
      }
      translate([0,0,2.41]) cylinder(r=litkoRad+5,h=10);
      translate([0,0,-2]) cylinder(r=litkoRad+5,h=2);
   }
}

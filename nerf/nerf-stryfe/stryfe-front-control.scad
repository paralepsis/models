$fn=40;

// % translate([0,-12.5,0]) import("./stryfe-bolter-grip2.stl");

if (1) {
   % translate([-11.5,0,0]) {
      rotate([00,90,90]) import("./Nerf_Stryfe_Foregrip/files//StryfeForeGripMK2-Plate.stl");
      rotate([0,90,90]) import("./Nerf_Stryfe_Foregrip/files//StryfeForeGripMK2.stl");
   }
}

translate([0,-35,22]) rotate([-40,0,0]) rotate([0,-90,0]) switch();

if (0) difference() {
   exterior();
   translate([0,0,-0.01]) cutout();
}

translate([0,-21,6]) rotate([0,90,180]) trigger();

module trigger() {
   translate([0,0,-5]) difference() {
      union() { 
         cylinder(r=5,h=10);

         translate([-1,1,0]) hull() {
            cube([5,30,10]);
            translate([2.5,30,0]) cylinder(d=5,h=10);
            translate([-1,0,1]) cube([7,30,8]);
            translate([2.5,30,1]) cylinder(d=7,h=8);
         }

        rotate([0,0,40]) translate([-15,-1,0]) cube([15,6,10]);
      }

      translate([0,0,-.1]) cylinder(r=1.6,h=11);
   }
}

module switch(cutout=1) {
   translate([0,0,-5]) color("red") difference() {
      union() {
         translate([27,4,0]) cube([11.5,1,10]);
         translate([27,9,0]) cube([11.5,1,10]);
         translate([15,-3,0]) cube([13.5,1,10]);
         translate([15,-3,0]) cube([1,4,10]);
         translate([6,15,3.5]) cube([3,3,3]);
         hull() {
            translate([1.5,13.5,0]) cylinder(r=1.5,h=10);
            translate([1.5,1.5,0]) cylinder(r=1.5,h=10);
            translate([28.5,13.5,0]) cylinder(r=1.5,h=10);
            translate([28.5,1.5,0]) cylinder(r=1.5,h=10);
         }
      }
      if (cutout) {
         translate([3.0,3.0,-0.1]) cylinder(d=3,h=11);
         translate([27,12,-0.1]) cylinder(d=3,h=11);
      }
   }
}

/* dimensions
 * 18.6mm outside of rail
 * 13.49 between edges going into rail
 * 3.07 thick piece going into rail
 * 3.27 under the rail clearance
 */


/* interior volume to cut out */
module cutout() {
   translate([-13.49/2,-38+6.34,0]) cube([13.49, 38, 82-13.49/2]);
   translate([0,6.34,82-13.49/2]) rotate([90,0,0]) cylinder(h=38,r=13.49/2);
   translate([-13.49/2,+6.34-4,0]) cube([13.49, 4, 82]);
   translate([-18.6/2,-38+6.34,0]) cube([18.6, 38, 27.5]);
   translate([-18.6/2,0,0]) cube([18.6, 3.27, 82]);
}

module exterior() {
   for (i=[0:5]) {
      translate([0,0,15.5*i]) grip(len=45,width=30);
   }
   translate([0,0,0]) grip(len=44,width=27,ht=85);
   translate([-27/2,-40+6.33,0]) cube([27,40,85]);
}

module grip(len=50,width=30,ht=6) {
   $fn=40;
   if (1) {
      linear_extrude(height=ht) translate([0,2-(len-8)/2+0.3,0]) minkowski() {
         square([(width-8),(len-8)],center=true);
         circle(r=4);
      }
   } else {
      /* bad idea */
      minkowski() {
         translate([0,2-(len-8)/2+0.3,0]) cube([width-8,len-8,1],center=true);
         sphere(r=4);
      }
   }
}

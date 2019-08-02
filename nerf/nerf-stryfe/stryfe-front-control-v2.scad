$fn=40;

// % translate([0,-12.5,0]) import("./stryfe-bolter-grip2.stl");

if (0) {
   % translate([-11.5,0,0]) {
      rotate([00,90,90]) import("./Nerf_Stryfe_Foregrip/files//StryfeForeGripMK2-Plate.stl");
      rotate([0,90,90]) import("./Nerf_Stryfe_Foregrip/files//StryfeForeGripMK2.stl");
   }
}

translate([-10.2,-15,17]) rotate([0,-90,0]) button();
translate([7,-17,10]) rotate([-15,0,0]) rotate([0,-90,90]) switch();

if (1) difference() {
   newExterior();
   cutout();
}

module button(cut=0) {
   myHt = 6;

   if (cut == 0) {
      for(i=[0:2]) {
         difference() {
            cylinder(d=8-i*2,h=myHt+0.2*i);
            translate([0,0,myHt-0.6+0.2*i]) cylinder(d=7-i*2,h=myHt);
         }
      }
      cylinder(d=8-6,h=myHt+0.6);
      cylinder(d=13,h=1.2);
   }
   else {
      cylinder(d=8+0.2,h=myHt+0.6);
      translate([0,0,-5]) cylinder(d=13+0.2,h=1.2+5);
   }
}

% sideCut();

module sideCut() {
   translate([6.5,0,0]) union() {
      rotate([90,0,-90])
      translate([0,0,-12.5]) linear_extrude(height=25)
      polygon(points=[[-7,-1],[-7,60],[9,60],
                      [27,11], [27,-1],[10,-1]]);
   }
}

module newExterior() {
   minkowski($fn=16) {
      union() {
         rotate([90,0,-90])
         translate([0,0,-12.5]) linear_extrude(height=25)
         polygon(points=[[-5,0],[-5,85],[10,85],
                      [37,10], [37,0],[10,0]]);
      }
      sphere(r=2);
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
   translate([0,0,-0.01]) {
//      translate([-13.49/2,-38+6.34,0]) cube([13.49, 38, 82-13.49/2]);
      hull() {
         translate([0,0,70]) rotate([90,0,0]) cylinder(h=6,r=11.5);
         translate([0,0,10]) rotate([90,0,0]) cylinder(h=25,r=11.5);
      }
      translate([-13.49/2,+6.34-4,0]) cube([13.49, 4, 100]);
      translate([-18.6/2,0,0]) cube([18.6, 3.27, 100]);

      /* this one gets the notch in the rail */
      translate([-18.6/2,-20+6.34,0]) cube([18.6, 20, 35]);
   }
   outsideSlice();
   translate([-10.75,-15,17]) rotate([0,-90,0]) button(cut=1);
}

module outsideSlice() {
   translate([20,0,0]) rotate([90,0,-90]) linear_extrude(height=40)
   if (1) {
      polygon(points=[[-6,0],[-6,87],[0,93],[0,100],[-10,100],[-10,-5],
                   [80,-5],[80,0],[30,0],[27.6,7.4],[11,7.4],[8.6,0]]);
   }
   else /* old shape */ {
      polygon(points=[[-6,0],[-6,87],[0,93],[0,100],[-10,100],[-10,-5],
                   [80,-5],[80,5],[28.37838,5],[27.6,7.4],[11,7.4],[8.6,0]]);
   }
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

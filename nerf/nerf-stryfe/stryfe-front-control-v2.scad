$fn=40;

if (0) {
   % translate([-11.5,0,0]) {
      rotate([00,90,90]) import("./Nerf_Stryfe_Foregrip/files//StryfeForeGripMK2-Plate.stl");
      rotate([0,90,90]) import("./Nerf_Stryfe_Foregrip/files//StryfeForeGripMK2.stl");
   }
}

// translate([-10.2,-15,17]) rotate([0,-90,0]) button();
// translate([7,-17.5-3,10.4]) rotate([-20,0,0]) rotate([0,-90,90]) switch();
// translate([0,23,0]) button();
// screws(cut=1);

// main();
door();

module door() {
   screws(cut=0,mat=1);

   intersection() {
      difference() {
         newExterior();
         cutout(side=0);
         screws(cut=1,mat=0);
         translate([7,-17.5-3,10.4]) rotate([-20,0,0]) rotate([0,-90,90]) switch(cutout=0,body=0,screws=1);
      }
      translate([0.25,0.25,-0.25]) sideCut();
   }

   translate([1.745+5,3.35,35.2]) cube([5,2.65,24.5]);
   translate([1.745+5,3.35,13.2]) cube([5,2.65,18.5]);
}

module main() {
   screws(cut=0,mat=1);

   difference() {
      newExterior();
      cutout(side=1);
      screws(cut=1,mat=0);
      translate([7,-17.5-3,10.4]) rotate([-20,0,0]) rotate([0,-90,90]) switch(cutout=0,body=0,screws=1);
      translate([1.745+4,3.25,35.25]) cube([5,2.9,24.75]); /* leftover */
   }
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
      translate([0,0,-8]) cylinder(d=13+0.2,h=1.2+8);
   }
}


module sideCut() {
   translate([6.5,0,0]) union() {
      rotate([90,0,-90])
      translate([0,0,-12.5]) linear_extrude(height=10)
      polygon(points=[[-7,-1],[-7,60],[15,60],
                      [33,11], [33,-1],[10,-1]]);
   }
}

module screws(cut=0,mat=1) {
   if (0) {
      translate([-13,-5,56]) rotate([0,90,0]) difference() {
         cylinder(h=24,d2=6,d1=9);
         translate([0,0,1]) cylinder(h=24,d=2.8);
      }
   }
   if (cut) {
      translate([-13,-5,56.5]) rotate([0,90,0]) {
         translate([0,0,3]) cylinder(h=22.7,d=2.8);
         translate([0,0,26]) cylinder(h=10,d=5.25);
      }
      translate([-13,-4,4]) rotate([0,90,0]) {
         translate([0,0,3]) cylinder(h=22.7,d=2.8);
         translate([0,0,26]) cylinder(h=10,d=5.25);
      }
      translate([-13,-29.5,10.5]) rotate([0,90,0]) {
         translate([0,0,3]) cylinder(h=22.7,d=2.8);
         translate([0,0,26]) cylinder(h=10,d=5.25);
      }
   }
}

module newExterior() {
   minkowski($fn=16) {
      union() {
         rotate([90,0,-90])
         translate([0,0,-12.5]) linear_extrude(height=25)
         polygon(points=[[-5,0],[-5,91],[8,91],
                      [37,10], [37,0],[10,0]]);
      }
      sphere(r=2);
   }

   /* bling */
   minkowski($fn=16) {
      union() {
         rotate([90,0,-90])
         translate([1,0,8.5]) linear_extrude(height=5)
         polygon(points=[[0,28],[0,80],[5,80], [23,28]]);
      }
      sphere(r=2);
   }
}

module switch(body=1,cutout=1,screws=1) {
   if (body) translate([0,0,-5]) color("red") difference() {
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
         translate([3.0,2.0,-0.1]) cylinder(d=3,h=11);
         translate([27,12,-0.1]) cylinder(d=3,h=11);
      }
   }
   if (screws) translate([0,0,-5]) {
      translate([3.0,2.0,0]) cylinder(d=2.8,h=18);
      translate([3.0,2.0,-25]) cylinder(d=5.5,h=25);
      translate([27,12,0]) cylinder(d=2.8,h=18);
      translate([27,12,-8]) cylinder(d=5.5,h=8);
   }
}

/* dimensions
 * 18.6mm outside of rail
 * 13.49 between edges going into rail
 * 3.07 thick piece going into rail
 * 3.27 under the rail clearance
 */

/* interior volume to cut out */
module cutout(side=0) {
   translate([0,0,-0.01]) {
      hull() {
         translate([-23/2,-7-3,53]) cube([23,13.5,0.6]) ;
         translate([-23/2,-25.3,8.7]) cube([23,29.0,3.6]);
      }
      translate([-13.49/2,+6.34-4,0]) cube([13.49, 4, 100]);
      translate([-18.6/2,0,0]) cube([18.6, 3.27, 100]);
      translate([-22.5/2,2.2,0]) cube([22.5, 4, 8]); // circular spots

      /* this one gets the notch in the rail */
      translate([-18.6/2,-10,8]) cube([18.6, 20, 35]);
   }
   outsideSlice();
   translate([-10.75,-18,17.5]) rotate([0,-90,0]) button(cut=1);


   if (side > 0) {
      sideCut();
   }
}

module outsideSlice() {
   translate([20,0,0]) rotate([90,0,-90]) linear_extrude(height=40)
   if (1) {
      polygon(points=[[-6,0],[-6,87],[-6,93],[0,100],[-10,100],[-10,-5],
                   [80,-5],[80,0],[30,0],[27.6,7.4],[11,7.4],[8.6,0]]);
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

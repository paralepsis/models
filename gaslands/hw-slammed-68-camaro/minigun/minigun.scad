$fn=30;

passSideArmor();
//driverSideArmor();

module minigun() {
   cylinder(d=4,h=1);
   cylinder($fn=6,d=2.5,h=10);
   translate([0,0,10]) cylinder(d=4,h=1);
   for(i=[0:5]) rotate([0,0,60*i]) translate([1.2,0,0]) cylinder(d=1,h=12);
}

module passSideArmor(hole=1) {
   pt1=[0,0,0];
   pt2=[5,6,0];
   pt3=[18,6,0];
   pt4=[22,1,0];
   pt5=[17,0,0];
   pthick=0.75;

   rpt1=[1.5,0.5,pthick];
   rpt2=[5.5,5,pthick];
   rpt3=[17,5,pthick];
   rpt4=[21,1.25,pthick];
   rpt5=[16.5,0.5,pthick];

   translate([-8,2.5,3]) rotate([0,91,0]) minigun();

   translate([-13.,-0.5,1.25]) rotate([7,0,0]) cube([4,2,3]);

   scale([0.95,0.95,0.95]) minkowski() { 
      hull() {
         translate([-13.9,0.2,0.3]) cube([6,4.5,5.3]);
         translate([-15.9,0,0.3]) cube([8,6,1]);
      }
      sphere(d=0.35);
   }

   mirror([1,0,0]) union() {
      /* plate */
      hull() {
         translate(pt1) cylinder(d=0.5,h=pthick);
         translate(pt2) cylinder(d=0.5,h=pthick);
         translate(pt3) cylinder(d=0.5,h=pthick);
         translate(pt4) cylinder(d=0.5,h=pthick);
         translate(pt5) cylinder(d=0.5,h=pthick);
      }
   
      /* rivets */
      translate(rpt1) sphere($fn=20,d=1);
      translate(rpt2) sphere($fn=20,d=1);
      translate(rpt3) sphere($fn=20,d=1);
      translate(rpt4) sphere($fn=20,d=1);
      translate(rpt5) sphere($fn=20,d=1);
   }
}

module driverSideArmor(hole=1) {
   pt1=[0,0,0];
   pt2=[5,6,0];
   pt3=[18,6,0];
   pt4=[22,1,0];
   pt5=[17,0,0];
   pthick=0.75;

   rpt1=[1.5,0.5,pthick];
   rpt2=[5.5,5,pthick];
   rpt3=[17,5,pthick];
   rpt4=[21,1.25,pthick];
   rpt5=[16.5,0.5,pthick];

   difference() {
      union() {
         /* plate */
         hull() {
            translate(pt1) cylinder(d=0.5,h=pthick);
            translate(pt2) cylinder(d=0.5,h=pthick);
            translate(pt3) cylinder(d=0.5,h=pthick);
            translate(pt4) cylinder(d=0.5,h=pthick);
            translate(pt5) cylinder(d=0.5,h=pthick);
         }
      
         /* rivets */
         translate(rpt1) sphere($fn=20,d=1);
         translate(rpt2) sphere($fn=20,d=1);
         translate(rpt3) sphere($fn=20,d=1);
         translate(rpt4) sphere($fn=20,d=1);
         translate(rpt5) sphere($fn=20,d=1);
      
         if (hole) translate([3.75,1,0]) cube([8,3.5,pthick+0.4]);
      }
      if (hole) translate([4.5,1.75,-0.1]) cube([6.5,2.,pthick+0.6]);
   }
}

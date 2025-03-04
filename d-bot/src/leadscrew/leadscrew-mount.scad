// % translate([27,50,0]) rotate([0,0,180]) import("./lead-screw-back.stl");

$fn=80;
backThick=6;
// disp=19.75; // original distance for the back, but also the new L/R
disp=20.75; // new back (Misumi)
// disp=20.75+15; // longer intended to move screw out of path of alt. carriage
nutRad=15.65/2;
nutTopRad=15.5;
screwRad=3.7/2;
screwOff=11.5;

slop = 0.5;

difference() {
   form();
   nutCuts();
   backCuts();
}



module form() {
   hull() {
      // back plate
      translate([0,50,35]) rotate([0,90,0]) cylinder(r=5,h=backThick);
      translate([0,5,35]) rotate([0,90,0]) cylinder(r=5,h=backThick);
      cube([backThick,55,5]);
   }

   hull() {
      // cylindrical front
      translate([disp+slop,27.5,0]) cylinder(r=nutTopRad+2,h=20);
      cube([backThick,55,25]);
      if (1) translate([0,5,0]) cube([backThick,45,28]);
   }

   if (0) hull() {
      translate([0,27.5-nutTopRad,0]) cube([backThick+5,2*nutTopRad,40]);
      translate([disp-backThick,27.5-nutTopRad,0]) cube([backThick,2*nutTopRad,12]);
   }

   translate([disp+slop,27.5,0]) cylinder(r=nutTopRad,h=12);

   rotate([0,-90,-90]) linear_extrude(height=55)
      polygon(points=[[0,0],[5.4,0],[6.4,-1.2],[13.6,-1.2],[14.6,0],
                            [25.4,0],[26.4,-1.2],[33.6,-1.2],[34.6,0],[35,1],[0,1]]);
}

module nutCuts() {
   translate([disp,27.5,0]) {
      hull() { 
         translate([0-slop,0,20]) cylinder(r=nutTopRad+0.01,h=50);
         translate([0+slop,0,20]) cylinder(r=nutTopRad+0.01,h=50);
      }
      hull() {
         translate([0-slop,0,-1]) cylinder(r=nutRad,h=100);
         translate([0+slop,0,-1]) cylinder(r=nutRad,h=100);
      }
      for (i=[0:3]) hull() {
         translate([0-slop,0,0]) rotate([0,0,45+90*i]) translate([screwOff,0,-1]) cylinder(r=screwRad,h=100);
         translate([0+slop,0,0]) rotate([0,0,45+90*i]) translate([screwOff,0,-1]) cylinder(r=screwRad,h=100);
      }
   }
}

module backCuts() {
   /* could be 2.0 instead of 2.5; these are the bolt holes in the back */
   translate([-3,55-7,10]) rotate([0,90,0]) cylinder(r=5.1/2,h=50);
   translate([backThick-2.5,55-7,10]) rotate([0,90,0]) cylinder(r=5.5,h=50);

   translate([-3,55-7,30]) rotate([0,90,0]) cylinder(r=5.1/2,h=50);
   translate([backThick-2.5,55-7,30]) rotate([0,90,0]) cylinder(r=5.5,h=50);

   translate([-3,7,10]) rotate([0,90,0]) cylinder(r=5.1/2,h=50);
   translate([backThick-2.5,7,10]) rotate([0,90,0]) cylinder(r=5.5,h=50);

   translate([-3,7,30]) rotate([0,90,0]) cylinder(r=5.1/2,h=50);
   translate([backThick-2.5,7,30]) rotate([0,90,0]) cylinder(r=5.5,h=50);
   
}

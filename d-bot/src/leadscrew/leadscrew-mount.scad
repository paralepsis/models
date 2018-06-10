// % translate([27,50,0]) rotate([0,0,180]) import("./lead-screw-back.stl");

$fn=80;
backThick=6;
disp=20.75;
nutRad=15.65/2;
nutTopRad=15.5;
screwRad=3.7/2;
screwOff=11.5;

difference() {
   form();
   cuts();
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
      translate([disp,27.5,0]) cylinder(r=nutTopRad+2,h=20);
      cube([backThick,55,27]);
   }

   if (0) hull() {
      translate([0,27.5-nutTopRad,0]) cube([backThick+5,2*nutTopRad,40]);
      translate([disp-backThick,27.5-nutTopRad,0]) cube([backThick,2*nutTopRad,12]);
   }

   translate([disp,27.5,0]) cylinder(r=nutTopRad,h=12);

   rotate([0,-90,-90]) linear_extrude(height=55)
      polygon(points=[[0,0],[5.3,0],[6.3,-1.2],[13.7,-1.2],[14.7,0],
                            [25.3,0],[26.3,-1.2],[33.7,-1.2],[34.7,0],[35,1],[0,1]]);
}

module cuts() {
   translate([disp,27.5,0]) {
      translate([0,0,20]) cylinder(r=nutTopRad+0.01,h=50);
      translate([0,0,-1]) cylinder(r=nutRad,h=100);
      for (i=[0:3]) {
         rotate([0,0,45+90*i]) translate([screwOff,0,-1]) cylinder(r=screwRad,h=100);
      }
   }

   /* could be 2.0 instead of 2.5 */
   translate([-3,55-7,10]) rotate([0,90,0]) cylinder(r=5.1/2,h=50);
   translate([backThick-2.5,55-7,10]) rotate([0,90,0]) cylinder(r=5.5,h=50);

   translate([-3,55-7,30]) rotate([0,90,0]) cylinder(r=5.1/2,h=50);
   translate([backThick-2.5,55-7,30]) rotate([0,90,0]) cylinder(r=5.5,h=50);

   translate([-3,7,10]) rotate([0,90,0]) cylinder(r=5.1/2,h=50);
   translate([backThick-2.5,7,10]) rotate([0,90,0]) cylinder(r=5.5,h=50);

   translate([-3,7,30]) rotate([0,90,0]) cylinder(r=5.1/2,h=50);
   translate([backThick-2.5,7,30]) rotate([0,90,0]) cylinder(r=5.5,h=50);
   
}

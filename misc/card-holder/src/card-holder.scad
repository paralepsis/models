$fn=80;

difference() {
   hull() for (i=[0:3]) {
      translate([(floor(i / 2)) ? 70/2 : -70/2, (i % 2) ? 99/2 : -99/2, 0])
          cylinder(r1=8,r2=3,h=68);
   }

   /* bottom cutout */
   hull() for (i=[0:3]) {
      translate([(floor(i / 2)) ? 30/2 : -30/2, (i % 2) ? 50/2 : -50/2, 0])
          translate([0,0,-1]) cylinder(r=8,h=5);
   }

   /* card space */
   translate([0,0,53]) cube([70,99,100], center=true);

   /* space for fingers to access */
   translate([0,0,18+3]) rotate([90,0,0]) cutout();
   translate([0,0,18+3]) rotate([0,0,90]) rotate([90,0,0]) cutout();
}


module cutout() {
   translate([0,30,0]) cube([36,60,140],center=true);
   translate([0,0,-70]) cylinder(r=18,h=140);
}

% cube([258, 258, 64]);

// cards are 62x93
// cardboard is 63x102

// 20mm of crisis cards
// 30mm of door cards

$fn=60;


if (0) {
translate([0,90,0]) tenCharBox();
resourceBox();
translate([0,45,0]) resourceBox();
translate([143,0,0]) rotate([0,0,90]) villianBox();
translate([108+34,0,0]) misc1();
}

translate([108+34,167,0]) misc2();

module misc2() {
   wid = 257-108-34;
   len = 257-167;
   rad = 45;

   difference() {
      cube([wid,len,63]);

      translate([1.61,1.61,0.9]) cube([wid-2*1.61-rad,len-2*1.61,63]);
      translate([1.61,1.61,rad+-.9]) cube([wid-2*1.61,len-2*1.61,63]);

      translate([wid-1.61-rad,1.61,0.9+rad]) rotate([-90,0,0]) cylinder(r=rad,h=len-2*1.61);
   }
}

module misc1() {
   wid = 257-108-34;
   len = 167;
   rad = 45;

   difference() {
      cube([wid,len,63]);

      translate([1.61,1.61,0.9]) cube([wid-2*1.61-rad,len-2*1.61,63]);
      translate([1.61,1.61,rad+-.9]) cube([wid-2*1.61,len-2*1.61,63]);

      translate([wid-1.61-rad,1.61,0.9+rad]) rotate([-90,0,0]) cylinder(r=rad,h=len-2*1.61);
   }
}


// 34 x 257 x 63
module villianBox() {
   difference() {
      cube([167+2*45,34,63]);

      translate([(108-93)/2,1.61,0.9]) cube([93,34-2*1.61,64]);
      translate([(108-68)/2,-1,40]) cube([68,180,60]);
      translate([(108-93)/2+103.25,1.61,0.9]) cube([93,34-2*1.61,64]);
      translate([(108-68)/2+103.25,-1,40]) cube([68,180,60]);
   }
}

// 108 x 167 x 63
module tenCharBox() {
   difference() {
      cube([108,167,63]);

      translate([15,-1,40]) cube([68,180,60]);
      for (i=[0:9]) {
         translate([2,2+i*16.5,1.2]) CharBoxCutout();
      }
   }
}

module CharBoxCutout() {
   translate([0,0,0.6]) {
      translate([0,9.9,0]) cube([104, 4, 64]);
      translate([0,0,1.2]) cube([93, 10, 64]);
   }
}

// 108 x 45 x 63
module resourceBox() {
   difference() {
      thick = 45;
      // cube([93+2*1.61, 45+2*1.61, 63]);
      cube([108, 45, 63]);

      translate([(108-93)/2,1.61,0.9]) cube([93,thick-2*1.61,64]);
      translate([(108-68)/2,-1,40]) cube([68,180,60]);
      translate([(108-68)/2+68/2,-1,42]) rotate([-90,0,0]) cylinder(d=68,h=10);
   }
}

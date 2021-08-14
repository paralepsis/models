% cube([258, 258, 64]);

// cards are 62x90
// cardboard is 63x102

// 20mm of crisis cards
// 30mm of door cards


//translate([0,90,0]) tenCharBox();

resourceBox();

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

module resourceBox() {
   difference() {
      thick = 45;
      // cube([93+2*1.61, 45+2*1.61, 63]);
      cube([108, 45, 63]);

      translate([(108-93)/2,1.61,0.6]) cube([93,thick-2*1.61,64]);
      translate([(108-68)/2,-1,40]) cube([68,180,60]);
      translate([(108-68)/2+68/2,-1,42]) rotate([-90,0,0]) cylinder(d=68,h=10);
   }
}

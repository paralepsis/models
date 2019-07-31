talonMag();
// foxfireMagwell();
// foxfireFront();
foxfireSemi();
// foxfireGrip();
% ar15Grip();
ar15Grip1911();
flywheelAssembly();
triggerAssembly();
// % scifiGun();
// % ext0();
// caliburnMagwell();

function XY(pt) = [pt[0], pt[1]];

module ar15Grip() {
   // translate([-133,0,-26])
   translate([-128,0,-26])
   rotate([180,0,-90]) import("./models/AR-15_Grip/AR15_GRIP-rotated.STL");
}

module ar15Grip1911() {
   translate([-170,-8,-147]) rotate([32,0,90]) import("./models/1911_AR_Grip/files/1911AS-V2.stl");
}

module caliburnMagwell() {
   color("red") {
      translate([9,0,-78])
      rotate([0,0,180]) 
      import("./models/caliburn-monolithic-magwell/MagWell_monoT.stl");
   }
}

module ext0() {
   barrel = 5; // at least 5

   mirror([0,1,0]) rotate([90,0,0]) linear_extrude(height=20)
      polygon(points = [[-172,0],[-172,27],[-144,27], [-144,35], [-139,40],[27,40],
         [32,45], [60,45], [65,40],
         [70 + barrel,40],[80 + barrel,30],[80 + barrel,0]]);

   mirror([0,1,0]) rotate([90,0,0]) linear_extrude(height=20)
     polygon(points=[[80 + barrel,0],[-172,0],[-172,-10], [-144,-10],
                     [-144,-16],[-134,-26],
                     [-41,-26],[-33,-34],[-33,-55], [-43,-65], [-43,-75],
                     [-38,-80],
                     [55,-80], [55,-80], [75,-60], [75,-40], [80,-35], 
                     [75 + barrel,-35], [80 + barrel,-30]]);
}

module scifiGun() {
   translate([-20,-1,-120]) scale([4,4,4]) import("./models/scifi-gun/scifi-gun-whole.stl");
}

module foxfireSemi() {
   //import("./models/foxfire-mbs-core_semi_v1_3/back_semi_v1_3-rail.stl");
   color("blue") {
      translate([-103.75,-25,1.00]) rotate([90,0,180]) import("./models/foxfire-mbs-core_semi_v1_3/back_semi_v1_3-base.stl");
   }
}
module foxfireGrip() {
   color("red") {
      translate([-102,-2,-77]) rotate([90,0,0]) import("./models/foxfire-mbs-core_semi_v1_3/handle_semi_v1_3-base.stl");
   }
}

module talonMag() {
   color("yellow") translate([-46.5/2, -20/2,-170.5]) import("./models/ez-talon-magazine/files/EZTalonBody.STL");
}

module foxfireMagwell(cover=0) {
   color("red") {
      if (cover) translate([-16.5,25,-34]) rotate([90,0,0]) import("./models/foxfire-mbs-receiver_talon_v1_3/receiver_talon_v1_3-cap.stl");
      translate([-17.5,-25,-34]) rotate([90,0,180]) import("./models/foxfire-mbs-receiver_talon_v1_3/receiver_talon_v1_3-base.stl");
   }
}

module foxfireFront(cover=0) {
   color("green") {
      translate([55.75,-32,1]) rotate([90,-90,180]) import("./models/foxfire-mbs-housing_p_v1_3/motor_P_v1_3-base.stl");
      if (cover) translate([55.75,25,1]) rotate([180,0,0]) rotate([90,-90,180]) import("./models/foxfire-mbs-housing_p_v1_3/motor_P_v1_3-cap.stl");
   }
}

module flywheelAssembly() {
   color("purple") {
      translate([73.0,-13,37]) {
         rotate([180,0,180]) import("./models/stryfe-rs-cage-43mm-morpheus.stl");
         translate([-26.25,0,-16]) rotate([90,0,0]) cylinder(r=11,h=19);
         translate([-26.25,0,-59]) rotate([90,0,0]) cylinder(r=11,h=19);
      }
   }
}

module triggerAssembly() {
//   import("./models/foxfire-mbs-core_semi_v1_3/back_semi_v1_3-triggers.stl");
}

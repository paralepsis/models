talonMag();
foxfireMagwell();
foxfireFront();
foxfireSemi();
foxfireGrip();
flywheelAssembly();
triggerAssembly();
% scifiGun();

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
      translate([73.0,-13,37]) rotate([180,0,180]) import("./models/stryfe-rs-cage-43mm-morpheus.stl");
   }
}

module triggerAssembly() {
//   import("./models/foxfire-mbs-core_semi_v1_3/back_semi_v1_3-triggers.stl");
}

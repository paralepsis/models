module back() {
   linear_extrude(height=1) projection() {
      import("./G18_ButtCap-20191115-white.stl");
   }
}

back();
translate([0,-21,79]) stock();

module stock() {
   linear_extrude(height=1) projection() {
      import("./SM_R_Shoulder_Butt_1st_with_screew_holes-samba-20190725-red.stl");
   }
}

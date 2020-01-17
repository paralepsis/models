$fn=50;

module back() {
   linear_extrude(height=1) projection() {
      import("./G18_ButtCap-20191115-white.stl");
   }
}

module top() {
   translate([0,22,0]) scale([1,1,0.95]) hull() import("./Top.stl");
}

back();
translate([0,-21,79]) stock();
top();

translate([0,6,-1]) cylinder(d=5.5,h=10);
translate([15.1,-19.5,-1]) cylinder(d=5.5,h=100);
translate([-15.1,-19.5,-1]) cylinder(d=5.5,h=100);

module stock() {
   linear_extrude(height=1) projection() {
      import("./SM_R_Shoulder_Butt_1st_with_screew_holes-samba-20190725-red.stl");
   }
}

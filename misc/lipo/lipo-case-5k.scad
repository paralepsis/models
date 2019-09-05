import("./reference/powerboost_1000c.stl");

$fn=20;

dimLen = 80;
dimThick = 10;

% bottom();
% middle();
top();

module middle() {
   translate([0,0,3]) difference() {
      fastForm(r=5.5,h=dimThick-6);
      translate([0,0,-0.1]) fastForm(r=4,h=dimThick-6+0.2);
   }
}

module top() {
   translate([0,0,dimThick -3]) difference() {
      hull() {
         fastForm(r=5.5);
         translate([0,0,2.9]) fastForm();
      }
      translate([0,0,-0.1]) fastForm(r=4,h=2);
      translate([0,0,-0.1]) fastSplitForm(r=1.5,h=5);
   }
}

module bottom() {
   difference() {
      hull() {
         fastForm();
         translate([0,0,2.9]) fastForm(r=5.5);
      }
      translate([0,0,0.9]) fastForm(r=4,h=5);
   }
}

module fastForm(r=4,h=0.1) {
   linear_extrude(height=h) hull() {
      translate([-20,-10 + dimLen,0]) circle(r=r);
      translate([20,-10 + dimLen,0]) circle(r=r);
      translate([-20,-10,0]) circle(r=r);
      translate([20,-10,0]) circle(r=r);
   }
}

module fastSplitForm(r=4,h=0.1) {
   linear_extrude(height=h) hull() {
      translate([-20,10,0]) circle(r=r);
      translate([20,10,0]) circle(r=r);
      translate([-20,-10,0]) circle(r=r);
      translate([20,-10,0]) circle(r=r);
   }
   linear_extrude(height=h) hull() {
      translate([-20,-10 + dimLen,0]) circle(r=r);
      translate([20,-10 + dimLen,0]) circle(r=r);
      translate([-20,20,0]) circle(r=r);
      translate([20,20,0]) circle(r=r);
   }
}

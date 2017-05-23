$fn=20;
translate([1,1,0]) linear_extrude(height=0.3) hull() {
   circle(r=1);
   translate([0,8,0]) circle(r=1);
   translate([8,8,0]) circle(r=1);
   translate([8,0,0]) circle(r=1);
}

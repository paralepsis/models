translate([-47.12,0,59.25]) import("/Users/rross/personal/3dprint-dbot//alternate-parts/D-Bot_Titian_Aero_Mod/bottom-duct-rework.stl");
$fn=40;

// rotate([-90,0,0]) translate([0,-50,0]) internals();
% external();

module external() {
   translate([0.5,-1,9]) cube(center=true,[26,20,18]);
   translate([0.5,11,10.4]) cube(center=true,[19.6,6,14.8]);
}

module internals(airVents=1) {
   rotate_extrude() translate([10,0,0]) circle(r=3);
   translate([0,9,0]) rotate([-90,0,0]) cylinder(r=3,h=30);

   if (airVents) {
      for(i=[0:10]) {
         rotate([0,0,36*i]) translate([7.5,0,-2]) sphere(r=1.5);
      }
   }
}

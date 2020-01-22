$fn=30;

% import("./sweet16-bottom-cut-hole.stl");

panel();

module panel() {
   difference() {
      rough();
      // translate([-48,-48,0]) cube([96,96,1.2]);
      translate([0,0,-0.1]) linear_extrude(height=5) projection(cut=true) translate([0,0,-13]) import("./sweet16-bottom-cut-hole.stl");

      /* holes */
      translate([-42.5,32,-1]) cylinder(d=3.2,h=5);
      translate([42.5,32,-1]) cylinder(d=3.2,h=5);
      translate([-42.5,-36.25,-1]) cylinder(d=3.2,h=5);
      translate([42.5,-36.25,-1]) cylinder(d=3.2,h=5);
   }
}

module rough(thick=1.6) {
   hull() {
      translate([-42.5,32,0]) cylinder(d=11,h=thick);
      translate([42.5,32,0]) cylinder(d=11,h=thick);
      translate([-42.5,-36.25,0]) cylinder(d=11,h=thick);
      translate([42.5,-36.25,0]) cylinder(d=11,h=thick);
   }
}

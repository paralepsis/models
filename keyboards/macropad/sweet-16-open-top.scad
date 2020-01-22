$fn=30;


translate([-50,0,0]) bottomPanel();
translate([50,0,0]) topPanel();

module topPanel() {
   postDia = 7;
   postHt = 5.5 + 1.5;

   difference() {
      panel(thick=1.5);
      switchHoles();
   }

// % import("./sweet16-top-thinner.stl");

   difference() {
      union() {
         /* holes */
         translate([-42.5,32,0]) cylinder(d=postDia,h=postHt);
         translate([42.5,32,0]) cylinder(d=postDia,h=postHt);
         translate([-42.5,-36.25,0]) cylinder(d=postDia,h=postHt);
         translate([42.5,-36.25,0]) cylinder(d=postDia,h=postHt);
      }

      /* holes */
      translate([-42.5,32,-1]) cylinder(d=3.2,h=postHt+2);
      translate([42.5,32,-1]) cylinder(d=3.2,h=postHt+2);
      translate([-42.5,-36.25,-1]) cylinder(d=3.2,h=postHt+2);
      translate([42.5,-36.25,-1]) cylinder(d=3.2,h=postHt+2);
   }
}

module bottomPanel() {
   postDia = 7;
   postHt = 6.5 + 1.5;
   difference() {
      panel(thick=1.5);
      translate([-11.75,8.5,-1]) cylinder(r=3.5,h=10);
   }

   // % import("./sweet16-bottom-cut-hole.stl")

   difference() {
      union() {
         /* holes */
         translate([-42.5,32,0]) cylinder(d=postDia,h=postHt);
         translate([42.5,32,0]) cylinder(d=postDia,h=postHt);
         translate([-42.5,-36.25,0]) cylinder(d=postDia,h=postHt);
         translate([42.5,-36.25,0]) cylinder(d=postDia,h=postHt);
      }

      /* holes */
      translate([-42.5,32,-1]) cylinder(d=3.2,h=postHt+2);
      translate([42.5,32,-1]) cylinder(d=3.2,h=postHt+2);
      translate([-42.5,-36.25,-1]) cylinder(d=3.2,h=postHt+2);
      translate([42.5,-36.25,-1]) cylinder(d=3.2,h=postHt+2);
   }
}

module panel(thick=1.6) {
   difference() {
      rough(thick=thick);
      // translate([-48,-48,0]) cube([96,96,1.2]);
      translate([0,0,-0.1]) linear_extrude(height=5) projection(cut=true) translate([0,0,-13]) import("./sweet16-bottom-cut-hole.stl");

      /* holes */
      translate([-42.5,32,-1]) cylinder(d=3.2,h=5);
      translate([42.5,32,-1]) cylinder(d=3.2,h=5);
      translate([-42.5,-36.25,-1]) cylinder(d=3.2,h=5);
      translate([42.5,-36.25,-1]) cylinder(d=3.2,h=5);

      /* remove little extra bit */
      translate([-20,36.07,-0.1]) cube([90,10,4]);
   }

   /* add in a little material along the top (to support switches) */
   difference() {
      hull() {
         translate([-40.5,37.07,0.0]) cylinder(r=1,h=thick);
         translate([40.5,37.07,0.0]) cylinder(r=1,h=thick);
         translate([-41.5,36.07,0]) cube([83,1,thick]);
      }
      translate([-41.5,36.07-2,-0.1]) cube([83,2,2]);
   }
}

module switchHoles() {
   difference() {
      translate([-44,-44,-0.1]) cube([88,88,2]);
      translate([0,0,-0.2]) linear_extrude(height=5) projection() import("./sweet16-top-thinner.stl");
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

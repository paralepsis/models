// Customizable Miniature Base
// Created by Rob Ross, February 2014
//
// Shared under Creative Commons License: Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0) 
// see http://creativecommons.org/licenses/by-sa/3.0/
//
// Notes:
// - good: 40mm, num_x = 4, stone_offset = 2, master_seed=41, z_compression=1.1

include <bigCube.scad>


// preview[view:south east, tilt:bottom]

/* [Base] */
// Width of base at the bottom (mm)
base_width = 60; // [25:60]
// Total height of base (mm)
base_height = 4; // [2:5]
// Angle of sidewall (0 degrees is vertical)
base_angle = 25;

have_topper = 0;
have_inset = 1;

/* [Hidden] */

/**** Main Routines ****/

translate([0,0,base_height]) rotate([180,0,0]) {
   difference() {
      union() {
         difference() {
	    base_exterior();
            base_inset();
         }
         dogbone();
      }
      translate([0,0,-1]) cylinder(h=10,d=3.2,$fn=40); // flying post
   }
}

translate([base_width,0,0]) base_topper();

// base_exterior() - angled sides and top of base
module base_exterior()
{
      difference() {
         cylinder($fn=200, r1 = base_width / 2, 
                  r2 = base_width / 2 -  base_height *sin(base_angle),
                  h = base_height);
      }
}

module base_topper() {
   translate([0,0,0]) difference() {
      cylinder($fn=200, r = base_width/2 - base_height*sin(base_angle) - 0.5,
               h = 3.5);
      translate([-160,-120,302]) mirror([0,0,1]) bigCube();
      translate([-210,-150,302]) mirror([0,0,1]) bigCube();
      translate([0,0,-1]) cylinder(h=10,d=3.2,$fn=40); // flying post
   }
}

module base_inset() {
   translate([0,0, -0.1]) {
      cylinder($fn=30,r=base_width/2-2,h=2);
   }
}

module dogbone() {
   difference() {
      union() {
         translate([-(base_width-14)/2,-4,0])  cube([base_width-14,8,base_height]);
         translate([-(base_width-15)/2,0,0]) cylinder($fn=60,d=8,h=base_height);
         translate([(base_width-15)/2,0,0]) cylinder($fn=60,d=8,h=base_height);
      }
      translate([-(base_width-15)/2,0,-0.1]) cylinder($fn=60,d=5.2,h=base_height+.1);
      translate([(base_width-15)/2,0,-0.1]) cylinder($fn=60,d=5.2,h=base_height+.1);
   }
}

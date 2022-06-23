// Customizable Miniature Base
// Created by Rob Ross, February 2014
//
// Shared under Creative Commons License: Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0) 
// see http://creativecommons.org/licenses/by-sa/3.0/
//
// Notes:
// - good: 40mm, num_x = 4, stone_offset = 2, master_seed=41, z_compression=1.1

// preview[view:south east, tilt:bottom]

/* [Base] */
// Width of base at the bottom (mm)
base_width = 35; // [25:60]
// Total height of base (mm)
base_height = 4; // [2:5]
// Angle of sidewall (0 degrees is vertical)
base_angle = 25;

have_topper = 0;
have_inset = 1;

/* [Hidden] */

/**** Main Routines ****/

translate([0,0, base_height]) rotate ([180,0,0]) 
{
   difference() {
	   base_exterior();
           base_inset();
   }
   dogbone();
}

// base_exterior() - angled sides and top of base
module base_exterior()
{
      difference() {
         cylinder($fn=200, r1 = base_width / 2, 
                  r2 = base_width / 2 -  base_height *sin(base_angle),
                  h = base_height);
      }
}

module base_inset() {
   translate([0,0, -0.1])
      cylinder($fn=30,r=base_width/2-2,h=2);
}

module dogbone() {
   difference() {
      union() {
         translate([-(base_width-10)/2,-1,0])  cube([base_width-10,2,base_height]);
         translate([-(base_width-12)/2,0,0]) cylinder($fn=60,d=5,h=base_height);
         translate([(base_width-12)/2,0,0]) cylinder($fn=60,d=5,h=base_height);
      }
      translate([-(base_width-12)/2,0,-0.1]) cylinder($fn=60,d=3,h=base_height+.1);
      translate([(base_width-12)/2,0,-0.1]) cylinder($fn=60,d=3,h=base_height+.1);
   }
}

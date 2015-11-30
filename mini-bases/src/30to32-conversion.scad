// Customizable Miniature Base
// Created by Rob Ross, February 2014
//
// Derived from the "Customizable Stone Wall"
// Created by Ari M. Diacou, January 2014
// Shared under Creative Commons License: Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0) 
// see http://creativecommons.org/licenses/by-sa/3.0/
//
// Notes:
// - "have_topper" option is not working.
// - good: 40mm, num_x = 4, stone_offset = 2, master_seed=41, z_compression=1.1

// preview[view:south east, tilt:bottom]

/* [Base] */
// Width of base at the bottom (mm)
base_width = 32; // [25:60]
// Total height of base (mm)
base_height = 3.5; // [2:5]
// Angle of sidewall (0 degrees is vertical)
base_angle = 25;


// Whether or not to include the stone topper [0:1]
have_topper = 0; // [0:No,1:Yes]

/* [Tweaks] */
master_seed=41;
// Width of lip between top of base and start of stones (mm)
lip_width = 0.3;
// In mm, reduces dimensions of base bottom to help it fit inside base exterior.
slop = 0.2;

/* [Hidden] */
split = 0;


/**** Main Routines ****/

difference() {
   base_exterior();
   color("red") roundedBase();
}

// base_exterior() - angled sides and top of base
module base_exterior()
{
	difference() {
		cylinder($fn=100, r1 = base_width / 2, 
			r2 = base_width / 2 -  base_height *sin(base_angle),
			h = base_height );
		if (split) {
			cylinder(r=base_width/2 - base_height * sin(base_angle) - 1,
				h = base_height - 1);	
		}
	}
}

// base_bottom() - flat bottom of base with space for magnets, etc.
module base_bottom()
{
	difference() {
		cylinder(r=base_width/2 - base_height * sin(base_angle) - 1 - slop/2,
			h = base_height - 1 - slop);
		translate([0,0,1]) cylinder(r=base_width/2 - base_height * sin(base_angle) - 2 - slop/2,
			h = base_height - 1 - slop);
	}
}

/* ROUNDED BELOW */

$fs=0.5;
$fa=2.0;

module roundedBase() {
   difference() {
	union() {
		rotate_extrude(r=5) translate([11,0,0])	circle(r=4);
		cylinder(r=11,h=4);
	}
	// translate([0,0,3]) cylinder(r=11,h=2.5);
	translate([0,0,-5.1]) cube([30,30,10],center=true);
	// translate([0,0,-4.6]) cube([30,30,10],center=true);
   }
}

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
base_width = 35; // [25:60]
// Total height of base (mm)
base_height = 4; // [2:5]
// Angle of sidewall (0 degrees is vertical)
base_angle = 25;


// Whether or not to include the stone topper [0:1]
have_topper = 0; // [0:No,1:Yes]

have_inset = 1;

/* [Stones] */
// Relative length of a stone
U=3;
// Relative width of a stone
W=2;
// Approx. number of stones along floor at widest point
num_x=4;
// Height of stones above base body
topper_height = 0.75;
// A way to save the arrangement of stones

/* [Tweaks] */
master_seed=41;
// Higher angles make more wedge-shaped stones, lower angles produce blocks. Reccomend 5-30 (zero crashes).
maximum_rotation_angle=5;
// Higher rotation angles might need more compression
z_compression=1.1;
// Offset shifts the stones in the Y direction, can help in placement
stone_offset=2;
// Width of lip between top of base and start of stones (mm)
lip_width = 0.3;
// In mm, reduces dimensions of base bottom to help it fit inside base exterior.
slop = 0.2;

/* [Hidden] */

// This is Ari's old "thickness" parameter, which doesn't need to be configurable.
V=1;
//The wall height in number of stones can be derived from other parameters
num_z= ceil(num_x / W * U);

// Split determines whether to bother to split the base into parts or not
split = 0;


/**** Main Routines ****/

if (split) {
	translate([-1 * base_width / 2, base_width / 2 - 2, 0]) base_bottom();
}

translate([0,base_width - 2, base_height + have_topper * topper_height]) rotate ([180,0,0]) 
{
if (have_topper) {
	union() {
		base_exterior();
	}
}
else {
        difference() {
	   base_exterior();
           base_inset();
        }
}
}

// base_exterior() - angled sides and top of base
module base_exterior()
{
	translate([base_width / 2, base_width / 2, 0])
	difference() {
		cylinder($fn=200, r1 = base_width / 2, 
			r2 = base_width / 2 -  base_height *sin(base_angle),
			h = base_height - have_topper * topper_height);
		if (split) {
			cylinder(r=base_width/2 - base_height * sin(base_angle) - 1,
				h = base_height - 1);	
		}
	}
}

module base_inset() {
	translate([base_width / 2, base_width / 2, -0.1])
           cylinder($fn=30,r=base_width/2-2,h=2);
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

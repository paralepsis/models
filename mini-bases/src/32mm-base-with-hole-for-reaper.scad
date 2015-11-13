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
base_height = 4; // [2:5]
// Angle of sidewall (0 degrees is vertical)
base_angle = 25;


// Whether or not to include the stone topper [0:1]
have_topper = 0; // [0:No,1:Yes]

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

difference() {
   base_exterior();
   translate([0,0,1]) cylinder(r=10.5,h=4);
}

// base_exterior() - angled sides and top of base
module base_exterior()
{
	difference() {
		cylinder($fn=100, r1 = base_width / 2, 
			r2 = base_width / 2 -  base_height *sin(base_angle),
			h = base_height - have_topper * topper_height);
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

// topper() -- generates the flagstone topper using the raw_flagstones() module below.
module topper()
{
//	intersection() {
		translate([0,stone_offset,2]) rotate([-90,0,0]) raw_flagstones(base_width + 5);
//		translate([base_width / 2, base_width / 2, base_height - have_topper * topper_height]) 
%			cylinder(r=base_width/2 - base_height * sin(base_angle) - lip_width,
				h = topper_height);
//	}
}

// raw_flagstones() -- generates the floor of flagstones; used to be wall() in Ari's
//                     original version of this code.
module raw_flagstones(width) {
	dimensions=[U,V,W];
	half_dimensions=[U/2,V,W];

	scalefactor = width / (W * num_z);
	scale([scalefactor, scalefactor, scalefactor]) 
	union(){
			for(z=[0:num_z-1]){
				for(x=[0:num_x-1 + 1]){
						translate([U*(x+0.5-0.25*(1+pow(-1,z))), 0,z*W*z_compression]) 
							color("SlateGray")
								rock(dimensions,maximum_rotation_angle,num_x*z+x);
					}
				}
		}
}

// rock() -- generates a rock at origin. Slight adjustment (bug fix?) from Ari's version.
module rock(unit_dimension, max_rotation, seed)
{
	rotation_vector=rands(-max_rotation,max_rotation,3*3,seed*1000*master_seed);
	//echo( "rotation_vector: ",rotation_vector);
	intersection()
	{
		rotate([rotation_vector[1],rotation_vector[1+1],rotation_vector[1+2]]) 
			cube(unit_dimension,center=true);
		rotate([rotation_vector[4],rotation_vector[4+1],rotation_vector[4+2]]) 
			cube(unit_dimension,center=true);
		rotate([rotation_vector[7],rotation_vector[7+1],rotation_vector[7+2]]) 
			cube(unit_dimension,center=true);
	}
}

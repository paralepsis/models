/* rocks.scad -- generate a set of rocks for use in other models.
 *
 * Copyright (c) Robert Ross, 2015.
 *
 * Customizable Stone Wall
 * Created by Ari M. Diacou, January 2014 (updated February, 2014)
 * Shared under Creative Commons License:
 *   Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0) 
 *   see http://creativecommons.org/licenses/by-sa/3.0/
 */

//Length of a stone
U=1.4;
//Thickness of stone
V=1.4;
//Height of a stone
W=2.0;

//A way to save the arrangement of stones
master_seed=14;
//Higher angles make more wedge-shaped stones, lower angles produce blocks. Reccomend 5-30 (zero crashes).
maximum_rotation_angle=17;
//Higher rotation angles might need more compression
z_compression=0.9;
//Number of cubes that make up a block
n=5; 
//A way to reduce the abilty of higher n to chop up a block (should be -2 to 0)
power=0;

// dimensions=[U,1+.1*jV,W];

/* Approach:
 * - Generate a 2D array of rocks
 * - Vary the "thickness" (y-dimension) across rows (j)
 * - Generate using an offset pair of the original "rock" models
 */
for (j=[0:9]) {
   dimensions=[U,V,W];

   for (i=[0:9]) {
      myRandom = rands(-0.8, 0.8, 2, 31*j+i*master_seed);
      translate([2*i+myRandom[0], 2*j+myRandom[1], 0]) {
         rock(dimensions,maximum_rotation_angle,31*j+i* master_seed);
      }
   }
}

/* rock()
 */
module rock(unit_dimension, max_rotation, seed) {
   random=rands(-1,1,n*3,seed);

   intersection(){
      intersection_for(i=[0:n-1]){
         rotate([max_rotation*random[3*i+0]*pow(i,power),
		 max_rotation*random[3*i+1]*pow(i,power),
		 max_rotation*random[3*i+2]*pow(i,power)])
            cube(unit_dimension, center=true);
      }
   }	
}


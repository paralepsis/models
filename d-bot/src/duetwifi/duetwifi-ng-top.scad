// Note: Modified to take McMaster-Carr 3mm heat set inserts for board and top

include <MCAD/regular_shapes.scad>;
use <MCAD/boxes.scad>

//functions
function lookup(v,var,lar,i=0) = (var[ i ]==v) ? lar[ i ] : ( i < len ( var ) ? lookup( v, var, lar, i + 1 ) : -1);

//user selection

assembled = false;//set to true for assembled item - printbox must be selected
hardware = false;//set tp true to show fan,grill and boards
nuttrap = true; //set to false for round bolt head on grill
inside = true;//Set to true for fan mounted inside box or false for outside of the box.
withfan = true;//set to false for no fan and extra vents


//user settings
fan_width = 40;			    //input fan outer dimensions
fan_depth = 11;             //input fan depth
fan_blades=5;               //input the number of fan blades

evilSlop=0.5; // This should not be needed, but my halves don't fit quite right if I use
              // the specified distance between mounting holes, so this tries to fix.

goofUp = 1; // This is here just to let me deal with having goofed the size of this thing.
            // Should be zero.

//default settings
base=2.4;                     //enclosure base thickness
wall=2.8;                   //enclosure wall thickness
airgap=10;                  //space between boards
bsuppwid=10;                //board support width
bsize=[100,123,26];         //board size
bmount=[92,115-evilSlop];            //board mounting holes
boffset=[25,wall+15]; //board offset (X,Y)
erad=4;                     //enclosure corner radius
ency=167;            //enclosure length(y)
encx=135;                   //enclosure width(x)
M4_clear=2.2;               //m4 clearance
M3_clear=1.7;               //m3 clearance bolt
M3_head_dia=3.4;            //head diameter
M3_head_ht=2.5;             //m3 head height
M3_nut_trap=3.4;            // m3 nut trap
grill_depth=4;              //fan grill depth
grill_space=10;            //space between grill rings
rings_wid=1.05;             //fan grill rods and rings width
clear=2;                    //extra clearance
tol=0.1;                    //small tolerance
$fn=50;

//calculations
fan_mount_dist = lookup(fan_width, [40,50,60,80], [32,40,50,70]);   //fan mounting hole distance
fan_dist = (withfan == true) ? fan_depth : 5;                       //default space if fan outside
    
fan_pos=[encx/2-bsuppwid,ency/2,-0.1];                              //fan position
fan_rad = fan_width/2-2;		                                    //radius of blades
rings = lookup(fan_width, [40,50,60,80], [4,5,6,8]);                //number of grill rings dependant on fan size

if (1) translate([0,0,2]) difference() {
   hull() {
      translate([0+erad,0+erad,47]) cylinder(r=erad,h=3.2);
      translate([encx-erad,0+erad,47]) cylinder(r=erad,h=3.2);
      translate([0+erad,ency-erad+10,47]) cylinder(r=erad,h=3.2);
      translate([encx-erad,ency-erad+10,47]) cylinder(r=erad,h=3.2);
   }

   if (0) hull() {
      translate([20,20,46]) cylinder(r=erad,h=6);
      translate([encx-20,20,46]) cylinder(r=erad,h=6);
      translate([20,ency+10-20,46]) cylinder(r=erad,h=6);
      translate([encx-20,ency+10-20,46]) cylinder(r=erad,h=6);
   }

   translate([0+5.5,0+5.5,45]) cylinder(r=1.7,h=10);
   translate([encx-5.5,0+5.5,45]) cylinder(r=1.7,h=10);
   translate([0+5.5,ency-5.5+10,45]) cylinder(r=1.7,h=10);
   translate([encx-5.5,ency-5.5+10,45]) cylinder(r=1.7,h=10);
}

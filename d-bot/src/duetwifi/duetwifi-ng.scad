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

myCase();

if (0) translate([0,0,-2]) difference() {
   hull() {
      translate([0+8.2,0+8.2,47]) cylinder(r=5,h=2.1);
      translate([encx-8.2,0+8.2,47]) cylinder(r=5,h=2.1);
      translate([0+8.2,ency-8.2+10,47]) cylinder(r=5,h=2.1);
      translate([encx-8.2,ency-8.2+10,47]) cylinder(r=5,h=2.1);
   }

   translate([0+5.5,0+5.5,45]) cylinder(r=1.6,h=10);
   translate([encx-5.5,0+5.5,45]) cylinder(r=1.6,h=10);
   translate([0+5.5,ency-5.5+10,45]) cylinder(r=1.6,h=10);
   translate([encx-5.5,ency-5.5+10,45]) cylinder(r=1.6,h=10);
}

/* MY HACKING VERSION */
module myCase() {
    difference() {
        union() {
            base();

            /* MOUNTS TO BOARD */
            for (i=[0:3]) {
                translate ([boffset[0]+wall+(i%2)*bmount[0],boffset[1]-1+floor(i/2)*bmount[1],0]) {
                    cylinder (r=4.25, h=14);
                    cylinder (r1=6, r2=4.25, h=11);
                    // cylinder (d=4, h=15); // little inside bit
                }
            }

            /* rail */
            translate([135,5,15]) rotate([0,0,-90]) rotate([0,-90,0]) linear_extrude(height=167) {
            polygon(points=[[-4.5,-1],[-4.5,0],[-3.5,1],[3.5,1],[4.5,0],
               [4.5,-1]]);
   }
        }

        /* bottom cutouts */
        for(i=[0:6]) {
           translate([40,30 + 15*i,-3]) hull() {
              cylinder(r=4,h=10);
              translate([68,0,0]) cylinder(r=4,h=10);
           }
        }

        /* LED side */
        translate([25,4,17]) rotate([90,0,0]) hull() {
           cylinder(r=10,h=5);
           translate([83,0,0]) cylinder(r=10,h=5);
           translate([0,50,0]) cylinder(r=10,h=5);
           translate([83,50,0]) cylinder(r=10,h=5);
        }

        /* fan side */
        translate([-15,178,33]) rotate([90,0,0]) hull() {
           translate([83,0,0]) cylinder(r=8,h=5);
           translate([83,50,0]) cylinder(r=8,h=5);
        }

        /* far side */
        translate([-1,25,24]) rotate([0,0,90]) rotate([90,0,0]) hull() {
           cylinder(r=10,h=5);
           translate([127,0,0]) cylinder(r=10,h=5);
           translate([0,50,0]) cylinder(r=10,h=5);
           translate([127,50,0]) cylinder(r=10,h=5);
        }

        /* mount-side */
        translate([131,25,35]) rotate([0,0,90]) rotate([90,0,0]) hull() {
           cylinder(r=10,h=5);
           translate([127,0,0]) cylinder(r=10,h=5);
           translate([0,50,0]) cylinder(r=10,h=5);
           translate([127,50,0]) cylinder(r=10,h=5);
        }

        /* bolt holes */
        translate([130,145,15]) rotate([0,90,0]) cylinder(d=5.25,h=10);
        translate([130,30,15]) rotate([0,90,0]) cylinder(d=5.25,h=10);

        /* ALL THE CUTOUTS */
        union() {
            /* FANS */
            translate([34,ency+fan_dist,fan_width/2+base+1])
                rotate([90,0,0]) fan_cutout();
            translate([encx-34,ency+fan_dist,fan_width/2+base+1])
                rotate([90,0,0]) fan_cutout();
    
            /* MOUNTS TO BOARD */
            for (i=[0:3]) {
                translate ([boffset[0]+wall+(i%2)*bmount[0],boffset[1]-1+floor(i/2)*bmount[1],7.2]) {
                    cylinder (d=5.2, h=6.9); // M3 inserts
                }
            }
        }
    }
}

/***************** OLD STUFF *****************/
module fan_cutout() {
    cylinder( h=3*wall, r=fan_width/2-1, center=true);//fan hole
	for(i = [1: 4])
            rotate([0, 0, i*90])
            translate([fan_mount_dist/2, fan_mount_dist/2, 0])
            rotate([180, 0, 0])
            cylinder( h=wall+10,r=M3_clear, center=true);//M3 bolt
}
 

module base(){
    fan_dist = (inside == true) ? fan_dist : 5;

    difference(){
        roundedcube(encx, ency+airgap, fan_dist+airgap/2+bsize[2]+wall+base,
                    erad);
        /* INTERIOR VOLUME */
        translate ([wall,wall,base]) roundedcube (encx-2*wall,ency+airgap-2*wall,fan_dist+airgap/2+bsize[2]+2*wall,erad);           
    }   

    /* FOUR CORNERS */
    difference(){
        translate ([2*wall,2*wall,0]) cylinder (r=5.5,h=fan_dist+airgap/2+bsize[2]+base+wall);
        translate ([2*wall,2*wall,40.4]) cylinder (d=5.2, h=6.9);
    }  

    difference(){   
        translate ([2*wall,ency+airgap-2*wall,0]) cylinder(r=5.5,h=fan_dist+airgap/2+bsize[2]+base+wall); 
        translate ([2*wall,ency+airgap-2*wall,40.4])cylinder (d=5.2, h=10);   
    }

    difference(){       
        translate ([encx-2*wall,2*wall,0])cylinder (r=5.5,h=fan_dist+airgap/2+bsize[2]+base+wall);       
        translate ([encx-2*wall,2*wall,40.4])cylinder (d=5.2, h=10); 
    }

    difference(){             
        // r=4 prior to june 29th changes
        translate ([encx-2*wall,ency+airgap-2*wall,0]) cylinder (r=5.5,h=fan_dist+airgap/2+bsize[2]+base+wall);
        translate ([encx-2*wall,ency+airgap-2*wall,40.4]) cylinder(d=5.2,h=10);
    }   
}     

module airduct(a){    
    translate ([0,0,wall/2]) rotate ([-90,0,0]) cylinder (r=wall, h=2*wall);
    translate ([0,0,a-wall/2]) rotate ([-90,0,0]) cylinder (r=wall, h=2*wall); 
    translate ([-wall,0,wall/2]) cube([2*wall,2*wall,a-wall]);     
}

module roundedcube(xdim,ydim, zdim, rdim){
    hull(){
    translate ([rdim,rdim,0]) cylinder (r=rdim,h=zdim);
    translate ([xdim-rdim,rdim,0]) cylinder (r=rdim,h=zdim);
    translate ([rdim,ydim-rdim,0]) cylinder (r=rdim,h=zdim); 
    translate ([xdim-rdim,ydim-rdim,0]) cylinder (r=rdim,h=zdim);
    }   }

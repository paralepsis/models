/*
translate([0,131.07,0]) rotate([0,0,-90]) translate([131.07/2,162.99/2,0]) import("../products/seth_custom_duet_wifi_case-20170314-noside.stl");
*/

if (0) {
% translate([131.07/2,162.99/2,0]) import("./seth_custom_duet_wifi_case-20170314-noside.stl");
}
/*
appjaws_duetwifi_and_duex5_enclosure.scad
modified from the original design by deckingman - thank you
function "lookup" provided by enif - thank you

boards are bolted using M4 15mm bolts 
The mounting holes are located to fit to a 20 or 40 mm profile at a right hand corner but can easily be changed.
Note:- print support is needed, especially for the duex5 version
*/

include <MCAD/regular_shapes.scad>;
use <MCAD/boxes.scad>

//functions
function lookup(v,var,lar,i=0) = (var[ i ]==v) ? lar[ i ] : ( i < len ( var ) ? lookup( v, var, lar, i + 1 ) : -1);

//user selection
printbox = false;//set to true to print enclosure
printlid = false;//set to true to print main enclosure lid
printlidx5 = false;//set to true to print lid for duex5 board
printguard = false;//set to true to print grill

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
ency=157;            //enclosure length(y)
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

if (1) difference() {
    myCase();
    translate([-1,-1,-1]) cube([200,ency/2+3.5+goofUp,99]);
}
if (1) intersection() {
    myCase();
    translate([-1,-1,-1]) cube([200,ency/2+3.5+goofUp,99]);
}

if (0) rotate([180,0,0]) translate([21,0,-16]) color("red") myBrace();

module myBrace() {
   difference() {
      union() {
         hull() {
            translate([0,0,0.2]) cylinder(r=1,h=4.8);
            translate([75,0,0.2]) cylinder(r=1,h=4.8);
            translate([0,16.2,0.2]) cylinder(r=1,h=4.8);
            translate([75,16.2,0.2]) cylinder(r=1,h=4.8);
         }
     
         hull() {
            translate([75,0,-4]) cylinder(r=1,h=9);
            translate([75,4,-4]) cylinder(r=1,h=9);
            translate([10,0,-15]) cylinder(r=1,h=20);
            translate([10,4,-15]) cylinder(r=1,h=20);
         }
     
         hull() {
            translate([75,16,-4]) cylinder(r=1,h=9);
            translate([75,20,-4]) cylinder(r=1,h=9);
            translate([10,16,-15]) cylinder(r=1,h=20);
            translate([10,20,-15]) cylinder(r=1,h=20);
         }

         translate([0,0,-15]) hull() {
            translate([0,0,0]) cylinder(r=1,h=20);
            translate([0,35,0]) cylinder(r=1,h=20);
            translate([10,0,0]) cylinder(r=1,h=20);
            translate([10,35,0]) cylinder(r=1,h=20);
         }
         translate([-1,0,-0.20]) rotate([-90,90,0]) linear_extrude(height=35)
                  polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
      

      }

      /* stuff to remove */
      union() {
         translate([19.25,10,0]) cylinder(d=5.2,h=20);
         translate([64.25,10,0]) cylinder(d=5.2,h=20);

         translate([2.8,10,-4.6]) rotate([0,90,0]) cylinder(d=9,h=10);
         translate([2.8,28,-4.6]) rotate([0,90,0]) cylinder(d=9,h=10);
         translate([-10,10,-4.6]) rotate([0,90,0]) cylinder(d=5.2,h=30);
         translate([-10,28,-4.6]) rotate([0,90,0]) cylinder(d=5.2,h=30);
      }
   }
}

/* MY HACKING VERSION */
module myCase() {
    difference() {
        union() {
            base();

            /* MOUNTS TO BOARD */
            for (i=[0:3]) {
                translate ([boffset[0]+wall+(i%2)*bmount[0],boffset[1]-1+floor(i/2)*bmount[1],0]) {
                    cylinder (r=4, h=14);
                    cylinder (d=4, h=15);
                }
            }

            for (i=[0:3]) {
                translate ([boffset[0]+wall+(i%2)*bmount[0],boffset[1]-1+floor(i/2)*bmount[1],0]) {
                    cylinder (r=4, h=14);
                    cylinder (d=4, h=15);
                }
            }

            /* GLUE POINTS */
            if (1) {
                translate([0,ency/2+goofUp, 0]) cube([6,5,fan_dist+airgap/2+bsize[2]+base+wall/2]);
                translate([0,ency/2+goofUp, 0]) cube([encx,5,5]);
                translate([encx-6,ency/2+goofUp, 0]) cube([6,5,fan_dist+airgap/2+bsize[2]+base+wall/2]);
            }
        }

        /* ALL THE CUTOUTS */
        union() {
            /* FANS */
            translate([34,ency+fan_dist,fan_width/2+base+1])
                rotate([90,0,0]) fan_cutout();
            translate([encx-34,ency+fan_dist,fan_width/2+base+1])
                rotate([90,0,0]) fan_cutout();
    
            /* CONDUIT */
            translate([encx/2,ency+fan_dist, 14]) rotate([90,0,0]) cylinder(r=7,h=10);
            translate([encx/2,ency+fan_dist, 32]) rotate([90,0,0]) cylinder(r=7,h=10);
            translate([18,5, 14]) rotate([90,0,0]) cylinder(r=7,h=10);
            translate([18,5, 32]) rotate([90,0,0]) cylinder(r=7,h=10);

            /* MOUNTS TO FRAME */
            translate ([encx-50,10,-1]) cylinder (d=6,h=7);
            translate ([boffset[0]/2+wall+25,10,-1]) cylinder (d=6,h=7);
            translate ([10,boffset[1],-1]) cylinder (d=6,h=7);
            translate ([10,ency-airgap,-1]) cylinder (d=6,h=7);
            translate ([10,ency/2+airgap+5,-1]) cylinder (d=6,h=7);

            if (0) {
                translate ([encx-5, ency/4, base+7]) rotate([0,90,0]) cylinder(d=6,h=10);
                translate ([encx-5, ency/2+airgap+5, base+7]) rotate([0,90,0]) cylinder(d=6,h=10);
                translate ([encx-5, ency-airgap, base+7]) rotate([0,90,0]) cylinder(d=6,h=10);
            }

            /* MOUNTS TO BOARD */
            for (i=[0:3]) {
                translate ([boffset[0]+wall+(i%2)*bmount[0],boffset[1]-1+floor(i/2)*bmount[1],5]) {
                    cylinder (d=3, h=12);
                }
            }
    
            /* GRILL */
            myGrill();
            myGrillHole();
        }
    }
}

module myGrillHole() {
    hull() {
        for (i=[3:6]) {
            translate([wall+30+9.5*i,0,14]) hull() {
                translate([0,10,0]) rotate([90,0,0]) cylinder(r=3,h=15);
                translate([0,10,12]) rotate([90,0,0]) cylinder(r=3,h=15);
            }
        }
    }
}
module myGrill() {
    for (j=[0:1]) {
        // for (i=[0:floor((encx-2*wall-32)/9)-1]) {
        for (i=[0,1,2,7,8,9]) {
            translate([wall+30+9.5*i,0,9+19*j]) hull() {
                translate([0,10,0]) rotate([90,0,0]) cylinder(r=3,h=15);
                translate([0,10,9]) rotate([90,0,0]) cylinder(r=3,h=15);
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
        translate ([2*wall,2*wall,0]) cylinder (r=4,h=fan_dist+airgap/2+bsize[2]+base+wall/2);
        translate ([2*wall,2*wall,fan_dist+airgap/2+bsize[2]-wall]) cylinder (r=1.35, h=10);
    }  

    difference(){   
        translate ([2*wall,ency+airgap-2*wall,0]) cylinder(r=4,h=fan_dist+airgap/2+bsize[2]+base+wall/2); 
        translate ([2*wall,ency+airgap-2*wall,fan_dist+airgap/2+bsize[2]-wall])cylinder (r=1.35, h=10);   
    }

    difference(){       
        translate ([encx-2*wall,2*wall,0])cylinder (r=4,h=fan_dist+airgap/2+bsize[2]+base+wall/2);       
        translate ([encx-2*wall,2*wall,fan_dist+airgap/2+bsize[2]-wall])cylinder (r=1.35, h=10); 
    }

    difference(){             
        translate ([encx-2*wall,ency+airgap-2*wall,0]) cylinder (r=4,h=fan_dist+airgap/2+bsize[2]+base+wall/2);
        translate ([encx-2*wall,ency+airgap-2*wall,fan_dist+airgap/2+bsize[2]-wall]) cylinder(r=1.35,h=10);
    }   
}     

module airduct(a){    
    translate ([0,0,wall/2]) rotate ([-90,0,0]) cylinder (r=wall, h=2*wall);
    translate ([0,0,a-wall/2]) rotate ([-90,0,0]) cylinder (r=wall, h=2*wall); 
    translate ([-wall,0,wall/2]) cube([2*wall,2*wall,a-wall]);     
}

module guard(){
    translate([0,0,-grill_depth/2]) grill();
    surround();
}

module grill_rings(){
  difference(){
    cylinder(r=od/2,h=h);   
      translate([0,0,-0.5])
       cylinder(r=od/2-t,h=h+1);
  } }

module surround(){
	difference() {
        union() {
            hull()
            for(x = [-1, 1])
            for(y = [-1, 1])
                translate([x*(fan_width/2-2), y*(fan_width/2-2), fan_pos+grill_depth])
                cylinder(r=3.5, h=grill_depth, center=true);
            }		
        union() {
        translate([0, 0, 0])
        cylinder(r=fan_width/2-2, h=grill_depth+1, center=true);
        }
        for(i = [1: 4])
            rotate([0, 0, i*90])
            translate([fan_mount_dist/2, fan_mount_dist/2, 0])
            rotate([180, 0, 0])
            cylinder(r=M3_clear, h=wall+grill_depth, center=true);//M3 bolt
        for(i = [1: 4])
		rotate([0, 0, i*90])
        if (nuttrap == true){
        translate([fan_mount_dist/2, fan_mount_dist/2, 0]) hexagon_prism(M3_nut_trap,M3_nut_trap); //Nut Trap 
        }
            else{
        translate([fan_mount_dist/2, fan_mount_dist/2, 0]) cylinder(h=M3_head_ht, r=M3_head_dia); //bolt head
            }    
        }   }    

module grill(){
intersection(){
  rotate([0,0,45])
    union(){
      for ( n = [grill_space:grill_space:fan_width-grill_space+tol] ) {
        if(n==grill_space){
          grill_rings(od=n,t=rings_wid,h=grill_depth);        
        }else{
        grill_rings(od=n,t=rings_wid,h=grill_depth);
        }   } }
    translate([-fan_width/2,-fan_width/2,0])
      cube([fan_width,fan_width,grill_depth]);
    }
for(a=[45,-45,135,-135]){
  rotate([0,0,a])
    translate([grill_space/2-rings_wid,-rings_wid/2,0])
      cube([(fan_width/2-grill_space/2+0.01),rings_wid,grill_depth]);// rods
}   }

module roundedcube(xdim,ydim, zdim, rdim){
    hull(){
    translate ([rdim,rdim,0]) cylinder (r=rdim,h=zdim);
    translate ([xdim-rdim,rdim,0]) cylinder (r=rdim,h=zdim);
    translate ([rdim,ydim-rdim,0]) cylinder (r=rdim,h=zdim); 
    translate ([xdim-rdim,ydim-rdim,0]) cylinder (r=rdim,h=zdim);
    }   }

/* dial.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 *
 * Text Generator code from Phil Greenland, downloaded 9/21/2014, released
 * the Creative Commons - Attribution - Share Alike license.
 * 
 * TODO:
 *
 */

/* [Global] */

Maneuver_1 = "1L"; // [0X: Stop, 1L: 1 Left Turn, 1l: 1 Left Bank, 1S: 1 Straight, 1r: 1 Right Bank, 1R: 1 Right Turn, 1K: 1 K-Turn, 2L: 2 Left Turn, 2l 2 Left Bank, 2S: 2 Straight, 2r: 2 Right Bank, 2R: 2 Right Turn, 2K: 2 K-Turn, 3L: 3 Left Turn, 3l: 3 Left Bank, 3S: 3 Straight, 3r: 3 Right Bank, 3R: 3 Right Turn, 3K: 3 K-Turn, 4S: 4 Straight, 4K: 4 K-Turn, 5S: 5 Straight, 5K: 5 K-Turn ]
Maneuver_2 = "1R"; // 
Maneuver_3 = "2L"; // 
Maneuver_4 = "2l"; // 
Maneuver_5 = "2S"; // 
Maneuver_6 = "2r"; // 
Maneuver_7 = "2R"; // 
Maneuver_8 = "3L"; // 
Maneuver_9 = "3l"; // 
Maneuver_10 = "3S"; //
Maneuver_11 = "3r"; // 
Maneuver_12 = "3R"; // 
Maneuver_13 = "3K"; // 
Maneuver_14 = "4S"; // 
Maneuver_15 = "5S"; // 
Maneuver_16 = "5K"; // 

part = "bottom"; // [bottom, top, pin]

/* [Hidden] */

$fn=120;
extRad = 20; // in mm
outerPostRad = 4;
innerPostRad = 2;

/* MakerBot scheme for creating multiple STLs involves a "part" variable. */
if (1) {
    if (part == "bottom") { dialBottom(); }
    else if (part == "top") { dialTop(); }
    else if (part == "pin") { pin(); }
}
else {
    /* cut-away view */
    difference() {
	union() {
	    dialBottom();
	    rotate([0,0,360/16*1]) translate([0,0,2.1]) dialTop();
	    translate([0,0,5.5]) rotate([180,0,0]) pin();
	}
	translate([0,0,-0.01]) cube([40,40,40], center=false);	
    }
}

/******** DIAL MODULES ********/

module dialBottom() {
    difference() {
	union() {
	    cylinder(r=extRad,h=2);
	    cylinder(r=outerPostRad, h=4.2);
	}
	translate([0,0,1]) cylinder(r=innerPostRad, h=7);
	translate([-0.2,0,2]) cube([0.4, outerPostRad+0.01, 7+0.01]);
    }
    maneuvers();
}

module dialTop() {
    difference() {
	union() {
	    cylinder(r=extRad,h=2.3);
	}
	union() {
	    cylinder(r=outerPostRad, h=7);
	    cylinder(r=extRad - 2, h=1.2);
	    translate([0,7,0.01]) linear_extrude(height=3.02)
		polygon(points = [[-2,1], [-4,11], [4,11], [2,1]],
			paths = [[0,1,2,3,0]]);
	}
    }
}

module pin() {
    cylinder(r=outerPostRad+2, h=1);
    cylinder(r=innerPostRad, h=4);
}

/******** MANEUVER MODULES ********/

module maneuvers() {
    mArray = [ Maneuver_1, Maneuver_2, Maneuver_3, Maneuver_4, Maneuver_5,
	       Maneuver_6, Maneuver_7, Maneuver_8, Maneuver_9, Maneuver_10,
	       Maneuver_11, Maneuver_12, Maneuver_13, Maneuver_14,
	       Maneuver_15, Maneuver_16];
    for (i=[0:15]) {
	rotate([0,0,-1* 360/16*i]) maneuver(mArray[i]);
    }
}

module maneuver(m) {
    translate([-1.3,9,0]) scale([0.5,0.5,3]) drawtext(m[0]);
    translate([0,-1,0]) {
	if (m[1] == "L") {
	    mirror([1,0,0]) rightTurnIcon();
	}
	else if (m[1] == "l") {
	    mirror([1,0,0]) rightBankIcon();
	}
	else if (m[1] == "S") {
	    straightIcon();
	}
	else if (m[1] == "X") {
	    stopIcon();
	}
	else if (m[1] == "r") {
	    rightBankIcon();
	}
	else if (m[1] == "R") {
	    rightTurnIcon();
	}
	else if (m[1] == "K") {
	    kTurnIcon();
	}
    }
}

/******** ARROW MODULES ********/

module straightIcon() {
    straightPoints = [[-0.8,0], [-0.8,3], [-1.6,3], [0,4.6],
		      [1.6,3], [0.8,3], [0.8,0]];
    straightPath = [[0,1,2,3,4,5,6,0]];

    translate([0,14,0]) linear_extrude(height=3) {
	polygon(points=straightPoints, paths = straightPath);
    }
}

module stopIcon() {
    stopPoints = [[-0.6,1], [-0.6,2.2], [0.6,2.2], [0.6,1]];
    stopPath   = [[0,1,2,3,0]];

    translate([0,14,0]) linear_extrude(height=3) {
	scale([1.5,1.5,0]) polygon(points=stopPoints, paths=stopPath);
    }
}

module rightTurnIcon() {
    rightTurnPoints = [[-2, 0], [-2,3.6], [0,3.6], [0,4.4],
		       [1.4,3], [0,1.6], [0,2.4], [-0.6,2.4], [-0.6,0]];
    rightTurnPath = [[0,1,2,3,4,5,6,7,8]];
 
     translate([0.4,14,0]) linear_extrude(height=3) {
	polygon(points=rightTurnPoints, paths=rightTurnPath);
    }
}
    
module rightBankIcon() {
    rightBankPoints = [[-1.6,0], [-1.6,2.4], [-0.8,3.2], [-1.6,4], [1.2,4],
		       [1.2,1.2], [0.4,2], [-0.2,1.6], [-0.2,0]];
    rightBankPath   = [[0,1,2,3,4,5,6,7,8,0]];

    translate([0.4,14,0]) linear_extrude(height=3) {
	polygon(points=rightBankPoints, paths=rightBankPath);
    }
}

module kTurnIcon() {
    kTurnPoints = [[-0.8,0], [-0.8,4], [2.4,4], [2.4,2], [3.2,2],[2,1.0],
		   [0.8,2], [1.6,2], [1.6,3.2], [0.4,3.2], [0.4,0]];
    kTurnPath   = [[0,1,2,3,4,5,6,7,8,9,10,0]];
    translate([-0.8,14,0]) linear_extrude(height=3) {
	polygon(points=kTurnPoints, paths=kTurnPath);
    }
}

/******** BEGIN TEXT GENERATOR MODULES ********/

module drawtext(text) {
    //Characters
    chars = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}";

    //Chracter table defining 5x7 characters
    //Adapted from: http://www.geocities.com/dinceraydin/djlcdsim/chartable.js
    char_table = [ [ 0, 0, 0, 0, 0, 0, 0],
		   [ 4, 0, 4, 4, 4, 4, 4],
		   [ 0, 0, 0, 0,10,10,10],
		   [10,10,31,10,31,10,10],
		   [ 4,30, 5,14,20,15, 4],
		   [ 3,19, 8, 4, 2,25,24],
		   [13,18,21, 8,20,18,12],
		   [ 0, 0, 0, 0, 8, 4,12],
		   [ 2, 4, 8, 8, 8, 4, 2],
		   [ 8, 4, 2, 2, 2, 4, 8],
		   [ 0, 4,21,14,21, 4, 0],
		   [ 0, 4, 4,31, 4, 4, 0],
		   [ 8, 4,12, 0, 0, 0, 0],
		   [ 0, 0, 0,31, 0, 0, 0],
		   [12,12, 0, 0, 0, 0, 0],
		   [ 0,16, 8, 4, 2, 1, 0],
		   [14,17,25,21,19,17,14],
		   [14, 4, 4, 4, 4,12, 4],
		   [31, 8, 4, 2, 1,17,14],
		   [14,17, 1, 2, 4, 2,31],
		   [ 2, 2,31,18,10, 6, 2],
		   [14,17, 1, 1,30,16,31],
		   [14,17,17,30,16, 8, 6],
		   [ 8, 8, 8, 4, 2, 1,31],
		   [14,17,17,14,17,17,14],
		   [12, 2, 1,15,17,17,14],
		   [ 0,12,12, 0,12,12, 0],
		   [ 8, 4,12, 0,12,12, 0],
		   [ 2, 4, 8,16, 8, 4, 2],
		   [ 0, 0,31, 0,31, 0, 0],
		   [16, 8, 4, 2, 4, 8,16],
		   [ 4, 0, 4, 2, 1,17,14],
		   [14,21,21,13, 1,17,14],
		   [17,17,31,17,17,17,14],
		   [30,17,17,30,17,17,30],
		   [14,17,16,16,16,17,14],
		   [30,17,17,17,17,17,30],
		   [31,16,16,30,16,16,31],
		   [16,16,16,30,16,16,31],
		   [15,17,17,23,16,17,14],
		   [17,17,17,31,17,17,17],
		   [14, 4, 4, 4, 4, 4,14],
		   [12,18, 2, 2, 2, 2, 7],
		   [17,18,20,24,20,18,17],
		   [31,16,16,16,16,16,16],
		   [17,17,17,21,21,27,17],
		   [17,17,19,21,25,17,17],
		   [14,17,17,17,17,17,14],
		   [16,16,16,30,17,17,30],
		   [13,18,21,17,17,17,14],
		   [17,18,20,30,17,17,30],
		   [30, 1, 1,14,16,16,15],
		   [ 4, 4, 4, 4, 4, 4,31],
		   [14,17,17,17,17,17,17],
		   [ 4,10,17,17,17,17,17],
		   [10,21,21,21,17,17,17],
		   [17,17,10, 4,10,17,17],
		   [ 4, 4, 4,10,17,17,17],
		   [31,16, 8, 4, 2, 1,31],
		   [14, 8, 8, 8, 8, 8,14],
		   [ 0, 1, 2, 4, 8,16, 0],
		   [14, 2, 2, 2, 2, 2,14],
		   [ 0, 0, 0, 0,17,10, 4],
		   [31, 0, 0, 0, 0, 0, 0],
		   [ 0, 0, 0, 0, 2, 4, 8],
		   [15,17,15, 1,14, 0, 0],
		   [30,17,17,25,22,16,16],
		   [14,17,16,16,14, 0, 0],
		   [15,17,17,19,13, 1, 1],
		   [14,16,31,17,14, 0, 0],
		   [ 8, 8, 8,28, 8, 9, 6],
		   [14, 1,15,17,15, 0, 0],
		   [17,17,17,25,22,16,16],
		   [14, 4, 4, 4,12, 0, 4],
		   [12,18, 2, 2, 2, 6, 2],
		   [18,20,24,20,18,16,16],
		   [14, 4, 4, 4, 4, 4,12],
		   [17,17,21,21,26, 0, 0],
		   [17,17,17,25,22, 0, 0],
		   [14,17,17,17,14, 0, 0],
		   [16,16,30,17,30, 0, 0],
		   [ 1, 1,15,19,13, 0, 0],
		   [16,16,16,25,22, 0, 0],
		   [30, 1,14,16,15, 0, 0],
		   [ 6, 9, 8, 8,28, 8, 8],
		   [13,19,17,17,17, 0, 0],
		   [ 4,10,17,17,17, 0, 0],
		   [10,21,21,17,17, 0, 0],
		   [17,10, 4,10,17, 0, 0],
		   [14, 1,15,17,17, 0, 0],
		   [31, 8, 4, 2,31, 0, 0],
		   [ 2, 4, 4, 8, 4, 4, 2],
		   [ 4, 4, 4, 4, 4, 4, 4],
		   [ 8, 4, 4, 2, 4, 4, 8] ];

    //Binary decode table
    dec_table = [ "00000", "00001", "00010", "00011", "00100", "00101",
		  "00110", "00111", "01000", "01001", "01010", "01011",
		  "01100", "01101", "01110", "01111", "10000", "10001",
		  "10010", "10011", "10100", "10101", "10110", "10111",
		  "11000", "11001", "11010", "11011", "11100", "11101",
		  "11110", "11111" ];

    //Process string one character at a time
    for(itext = [0:len(text)-1]) {
	//Convert character to index
	assign(ichar = search(text[itext],chars,1)[0]) {
	    //Decode character - rows
	    for(irow = [0:6]) {
		assign(val = dec_table[char_table[ichar][irow]]) {
		    //Decode character - cols
		    for(icol = [0:4]) {
			assign(bit = search(val[icol],"01",1)[0]) {
			    if(bit) {
				//Output cube
				translate([icol + (6*itext), irow, 0])
				    cube([1.01,1.01,1]);
			    }
			}
		    }
		}
	    }
	}
    }
}

/******** END TEXT GENERATOR MODULES ********/


/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */

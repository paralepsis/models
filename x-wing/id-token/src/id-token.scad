/* dial.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 *
 * Spiff Sans code from Stuart P. Bentley <stuart@testtrack4.com>, downloaded 
 * 9/26/2014, released under the Creative Commons - Public Domain Dedication
 * license.
 *
 * TODO:
 *
 */

/* [Global] */
Pilot_Skill    = 4; // [0:11]
Primary_Weapon = 3; // [0:5]
Agility        = 2; // [0:5]
Hull           = 3; // [0:14]
Shield         = 2; // [0:10]

/* [Hidden] */
$fn=30;

union() {
    cube([34.3,39.75,2.22]);

    translate([6,15,0]) cylinder(h=2.5,r=5);
    translate([4,11.5,1.5]) scale([0.7,0.7,1]) linear_extrude(height=1.5)
	write("4");

    translate([5,3.5,1.5]) scale([0.5,0.5,1]) linear_extrude(height=1.5)
	write("5");
    translate([12,3.5,1.5]) scale([0.5,0.5,1]) linear_extrude(height=1.5)
	write("5");
    translate([19,3.5,1.5]) scale([0.5,0.5,1]) linear_extrude(height=1.5)
	write("5");
    translate([26,3.5,1.5]) scale([0.5,0.5,1]) linear_extrude(height=1.5)
	write("5");
}

/******** BEGIN SPIFF SANS MODULES ********/

// Spiff Sans
// Author: Stuart P. Bentley <stuart@testtrack4.com>
// Version: 2.1.0

spiffsans = [
  ["",10,[[[0,5],[5,0],[10,5],[5,10],[4.5,8],[5.5,8],[6.75,6.75],[6.75,5.75],[5.5,4.5],[5.5,3.75],[4.5,3.75],[4.5,4.75],[5.75,6],[5.75,6.5],[5.25,7],[4.75,7],[4.25,6.5],[4.25,6],[3.25,6],[3.25,6.75],[4.5,3],[5.5,3],[5.5,2],[4.5,2]],[[0,1,2,3],[4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19],[20,21,22,23]]]],
  ["0",6,[[[5,0],[1,0],[0,2],[0,8],[1,10],[5,10],[6,8],[6,2],[2,8],[2,5],[4,8],[2,2],[4,2],[4,5]],[[0,1,2,3,4,5,6,7],[8,9,10],[11,12,13]]]],
  ["1",5,[[[0,0],[0,2],[2,2],[2,7],[0,7],[2,10],[4,10],[4,2],[5,2],[5,0]],[[0,1,2,3,4,5,6,7,8,9]]]],
  ["2",6,[[[0,0],[0,2],[4,6],[4,8],[2,8],[2,6],[0,6],[0,8],[1,10],[5,10],[6,8],[6,5.5],[2.5,2],[6,2],[6,0]],[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]]]],
  ["3",6,[[[1,0],[0,2],[0,4],[2,4],[2,2],[4,2],[4,4],[3,4],[3,6],[4,6],[4,8],[2,8],[2,6],[0,6],[0,8],[1,10],[5,10],[6,8],[6,6],[5.5,5],[6,4],[6,2],[5,0]],[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]]]],
  ["4",6,[[[4,0],[4,4],[0,4],[0,10],[2,10],[2,6],[4,6],[4,10],[6,10],[6,0]],[[0,1,2,3,4,5,6,7,8,9]]]],
  ["5",6,[[[0,0],[0,2],[4,2],[4.5,3],[4,4],[0,4],[0,10],[6,10],[6,8],[2,8],[2,6],[5,6],[6,4],[6,2],[5,0]],[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]]]],
  ["6",6,[[[1,0],[0,2],[0,8],[1,10],[5,10],[5.5,8],[2,8],[2,6],[5,6],[6,4],[6,2],[5,0],[2,2],[4,2],[4,4],[2,4]],[[0,1,2,3,4,5,6,7,8,9,10,11],[12,13,14,15]]]],
  ["7",5,[[[1,0],[1,3],[3,8],[0,8],[0,10],[5,10],[5,8],[3,3],[3,0]],[[0,1,2,3,4,5,6,7,8]]]],
  ["8",6,[[[1,0],[0,2],[0,4],[0.5,5],[0,6],[0,8],[1,10],[5,10],[6,8],[6,6],[5.5,5],[6,4],[6,2],[5,0],[2,6],[4,6],[4,8],[2,8],[2,2],[4,2],[4,4],[2,4]],[[0,1,2,3,4,5,6,7,8,9,10,11,12,13],[14,15,16,17],[18,19,20,21]]]],
  ["9",6,[[[1,0],[0,2],[4,2],[4,4],[1,4],[0,6],[0,8],[1,10],[5,10],[6,8],[6,2],[5,0],[2,6],[4,6],[4,8],[2,8]],[[0,1,2,3,4,5,6,7,8,9,10,11],[12,13,14,15]]]]
];

module write(string,font=spiffsans,spacing=1,i=0) {
  if (i < len(string)) {
    assign(charindex = search(string[i],font,1)[0])
    
    // If the character is in the font
    if (charindex != undef) {
      assign(glyph = font[charindex][2])
      if (glyph){
        polygon(points=glyph[0], paths=glyph[1]);
      }
      translate([font[charindex][1] + spacing, 0, 0])
        write(string, font, spacing, i=i+1);
    } else {
      assign(glyph = font[0][2])
      if (glyph){
        polygon(points=glyph[0], paths=glyph[1]);
      }
      translate([font[0][1] + spacing,0,0])
        write(string, font, spacing, i=i+1);
    }
  }
}

/******** END SPIFF SANS MODULES ********/

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */

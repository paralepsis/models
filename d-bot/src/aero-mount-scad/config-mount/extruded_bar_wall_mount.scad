// Roadfeldt - Hot End Mount Generator
//
/*
  Copyright (C)2015-2016 Chris Roadfeldt <chris@roadfeldt.com>

  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  as published by the Free Software Foundation; either version 2
  of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

// Simple openscad script to generate clamps that will mount to the wall to secure extruded aluminum bars.

/* [Features] */

// Width / Cross section of bar to be clamped. eg; 20x40, then choose 20.
barWidth = 20; // [10:10mm, 20:20mm, 30:30mm, 40:40mm, 50:50mm, 60:60mm, 70:70mm, 80:80mm]

// Height / Vertical of bar to be clamped. eg; 20x40, then choose 40.
barHeight = 40; // [10:10mm, 20:20mm, 30:30mm, 40:40mm, 50:50mm, 60:60mm, 70:70mm, 80:80mm]

// What type of bar style do you want?
barStyle = 2; // [1:Solid, 2:X]

// Width of clamp. How thick / wide should the clamp itself be?
clampWidth = 10;

// Fully enclosed clamp or Multi piece? Fully enclosed requires you to slide the clamp on before completing build. Multi Piece allows for retro-fitting.
clampStyle = 2; // [1:Fully Enclosed, 2:Multi Piece]

// Separation distance if 2 piece. Does not affect design or usage, but will make printing easier.
clampSepDistance = 2;

// Size of holes in clamp, only useful if 2 piece clamp.
clampHoleDiameter = 5;

// Length of clamp, measured from face of aluminum extrusion to wall / secured mount point.
clampLength = 50;

// Depth of material around extrusion and wall / secured mount point fittings.
clampMat = 3;

// Height of gap in middle of clamp. 0 for no gap, # for # mm of gap. LED lights use 15mm to give plenty of space in the middle.
// To define length of clamp tabs vs size of gap, enter this formula and replace ## with the length of the tab desired: barHeight - (## * 2)
clampMidGap = barHeight - (10 * 2);

// This increases the clamp size by twice the amount shown.
// It does not affect the distance to the secured mounting point. But will create a space in
// the amount shown between the clamp inner dimension and the item being clamped.
// eg; clampSlop = 1, distance to secure mount = 50, results in a 49mm distance from inside of clamp wall to
// outside of secured mount plate. It also creates a 1 mm gap to all inside clamp walls to the
// item being clamped. If your printer is extremely accurate, change this to 0.
// How much extra space should be equally added to all sides of the clamp to account for printer variation?
clampSlop = .1;

// Should the holes for the secured end be inside the overall heigh of the clamp or outside?
flangeHolePlace = "inside"; // [inside:Inside overall height, outside:Outside of height]

// Size of holes in wall / secured mount flange?
flangeHoleDiameter = 5;

// Radius of inside curve of the corners of the clamp around the extrusion. Enter 0 for square corners.
insideRad = 1;

// Radius of fillet on corners of bar.
barFilletRadius = 1;

// Radius of fillet on corners of clamp.
clampFilletRadius = 1;

// Start building the clamp.
// Wall mount first
// Move to the key stone location for the wall mount.
translate([0, clampLength - clampMat, 0])
difference() {
     union() {
	  // Create the mounting bracket for the wall / secured mounting point.
	  // Move to the correct starting place for the wall mount cube if needed.
	  translate([(flangeHolePlace == "inside" ? 0 : -((flangeHoleDiameter * 2) + barFilletRadius)), 0, 0])
	       cube([(flangeHolePlace == "inside" ? barHeight : barHeight + (flangeHoleDiameter * 4) + (barFilletRadius * 2)), clampMat, clampWidth]);

	  // Create the cylinders that will be used to fillet the connection from the mounting plate to the bar.
	  // Left side fillet cylinder.
	  translate([(flangeHolePlace == "inside" ? (flangeHoleDiameter * 2) : 0) + barFilletRadius, 0, 0])
	       cylinder(r=barFilletRadius, h=clampWidth, $fn=200);

	  // Right side fillet cylinder.
	  translate([barHeight - (flangeHolePlace == "inside" ? (flangeHoleDiameter * 2) : 0) - barFilletRadius, 0, 0])
	       cylinder(r=barFilletRadius, h=clampWidth, $fn=200);
     }
     
     // Create the wall mount holes. Move appropriate according to hole placement variable.
     // Left mounting hole.
     translate([(flangeHolePlace == "inside" ? flangeHoleDiameter : -(flangeHoleDiameter + barFilletRadius)), -.1, (clampWidth / 2)])
	  rotate([-90,0,0])
	  cylinder(d=flangeHoleDiameter, h=(clampMat + .2), $fn=200);

     // Right mounting hole.
     translate([(flangeHolePlace == "inside" ? barHeight - flangeHoleDiameter : barHeight + flangeHoleDiameter + barFilletRadius), -.1, (clampWidth / 2)])
	  rotate([-90,0,0])
	  cylinder(d=flangeHoleDiameter, h=(clampMat + .2), $fn=200);

     // Create the cylinders that will be used to clear the excess from the fillet for the connection from the mounting plate to the bar.
     // Left side fillet cylinder.
     translate([(flangeHolePlace == "inside" ? (flangeHoleDiameter * 2) : 0), - barFilletRadius, -.1])
	       cylinder(r=barFilletRadius, h=clampWidth + .2, $fn=200);
     
     // Right side fillet cylinder.
     translate([barHeight - (flangeHolePlace == "inside" ? (flangeHoleDiameter * 2) : 0), - barFilletRadius, -.1])
	  cylinder(r=barFilletRadius , h=clampWidth + .2, $fn=200);
}

// Next create the bar from the clamp to the secure mounting point.
if (barStyle == 2) {
     // Left
     hull() {
	  translate([(flangeHolePlace == "inside" ? (flangeHoleDiameter * 2) : 0) + barFilletRadius + (clampMat / 2), clampSlop + .1 + (clampMat / 2), 0])
	       cylinder(d=clampMat, h=clampWidth, $fn=200);
	  translate([(flangeHolePlace == "inside" ? (flangeHoleDiameter * 2) : 0) + barFilletRadius + (clampMat / 2), clampSlop - .1 + clampLength - (clampMat / 2), 0])
	       cylinder(d=clampMat, h=clampWidth, $fn=200);
	  }

     // Right
     hull() {
	  translate([(flangeHolePlace == "inside" ? (barHeight - (flangeHoleDiameter * 2)) : barHeight) - (barFilletRadius + (clampMat / 2)), clampSlop + .1 + (clampMat / 2), 0])
	       cylinder(d=clampMat, h=clampWidth, $fn=200);
	  translate([(flangeHolePlace == "inside" ? (barHeight - (flangeHoleDiameter * 2)) : barHeight) - (barFilletRadius + (clampMat / 2)), clampSlop - .1 + clampLength - (clampMat / 2), 0])
	       cylinder(d=clampMat, h=clampWidth, $fn=200);
	  }

     // Left to right cross.
     hull() {
	  translate([(flangeHolePlace == "inside" ? (flangeHoleDiameter * 2) : 0) + barFilletRadius + (clampMat / 2), clampSlop + .1 + (clampMat / 2), 0])
	       cylinder(d=clampMat, h=clampWidth, $fn=200);
	  translate([(flangeHolePlace == "inside" ? (barHeight - (flangeHoleDiameter * 2)) : barHeight) - (barFilletRadius + (clampMat / 2)), clampSlop - .1 + clampLength - (clampMat / 2), 0])
	       cylinder(d=clampMat, h=clampWidth, $fn=200);
	  }

     // Right to left cross.
     hull() {
	  translate([(flangeHolePlace == "inside" ? (barHeight - (flangeHoleDiameter * 2)) : barHeight) - (barFilletRadius + (clampMat / 2)), clampSlop + .1 + (clampMat / 2), 0])
	       cylinder(d=clampMat, h=clampWidth, $fn=200);
	  translate([(flangeHolePlace == "inside" ? (flangeHoleDiameter * 2) : 0) + barFilletRadius + (clampMat / 2), clampSlop - .1 + clampLength - (clampMat / 2), 0])
	       cylinder(d=clampMat, h=clampWidth, $fn=200);
	  }
}
else {
     translate([(flangeHolePlace == "inside" ? (flangeHoleDiameter * 2) : 0) + barFilletRadius, clampSlop + .1, 0])
	  cube([(flangeHolePlace == "inside" ? (barHeight - (flangeHoleDiameter * 4)) : barHeight) - (barFilletRadius * 2), clampLength -.2 - clampSlop, clampWidth]);
}

// Fillet the corners of the bar to the clamp.
translate([0, clampMat, 0])
difference() {
     union() {
	  // Create the cylinders that will be used to fillet the connection from the bar to the clamp.
	  // Left side fillet cylinder.
	  translate([(flangeHolePlace == "inside" ? (flangeHoleDiameter * 2) : 0) + barFilletRadius, clampSlop, 0])
	       cylinder(r=barFilletRadius, h=clampWidth, $fn=200);
	  
	  // Right side fillet cylinder.
	  translate([barHeight - (flangeHolePlace == "inside" ? (flangeHoleDiameter * 2) : 0) - barFilletRadius, clampSlop, 0])
	       cylinder(r=barFilletRadius, h=clampWidth, $fn=200);
     }

     // Create the cylinders that will be used to clear the excess from the fillet for the connection from the bar to the clamp.
     // Left side fillet cylinder.
     translate([(flangeHolePlace == "inside" ? (flangeHoleDiameter * 2) : 0), barFilletRadius + clampSlop, -.1])
	  cylinder(r=barFilletRadius, h=clampWidth + .2, $fn=200);
     
     // Right side fillet cylinder.
     translate([barHeight - (flangeHolePlace == "inside" ? (flangeHoleDiameter * 2) : 0), barFilletRadius + clampSlop, -.1])
	  cylinder(r=barFilletRadius, h=clampWidth + .2, $fn=200);
}

// Create the clamp by using minkowski, then split it for 2 piece clamp if needed.
difference() {
     union() {
	  // Create the outside dimension of the clamp first.
	  translate([-clampSlop, - barWidth - clampSlop - (clampStyle == 2 ? clampSepDistance : 0), 0])
	       minkowski() {
	       cube([barHeight + (clampSlop * 2), barWidth + (clampSlop * 2) + (clampStyle == 2 ? clampSepDistance : 0), (clampWidth / 2)]);
	       cylinder(r=clampMat,h=(clampWidth / 2), $fn=200);
	  }

	  // Create the clamp fastener tabs if needed.
	  if (clampStyle == 2) {
	       // Create clamp fastener tabs.
	       translate([-(clampHoleDiameter * 2) - clampMat - clampSlop - clampFilletRadius, - (barWidth / 2) - clampMat - clampSepDistance, 0])
		    cube([barHeight + (clampHoleDiameter * 4) + (clampMat * 2) + (clampSlop * 2) + (clampFilletRadius * 2), (clampMat * 2) + clampSepDistance, clampWidth]);

	       // Create the cylinders that will be used to fillet the connection of the fastener tabs to the clamp..
	       // Left front side fillet cylinder.
	       translate([-clampMat - clampSlop, - (barWidth / 2) - clampMat - clampSepDistance, 0])
		    cylinder(r=clampFilletRadius, h=clampWidth, $fn=200);

	       // Left rear side fillet cylinder.
	       translate([-clampMat - clampSlop, - (barWidth / 2) + clampMat, 0])
		    cylinder(r=clampFilletRadius, h=clampWidth, $fn=200);
	       
	       // Right front side fillet cylinder.
	       translate([barHeight + clampMat + clampSlop, - (barWidth / 2) - clampMat - clampSepDistance, 0])
		    cylinder(r=clampFilletRadius, h=clampWidth, $fn=200);

	       // Right rear side fillet cylinder.
	       translate([barHeight + clampMat + clampSlop, - (barWidth / 2) + clampMat, 0])
		    cylinder(r=clampFilletRadius, h=clampWidth, $fn=200);
	  }
     }

     // Cut out the interior space for the extrusion.
     // If the user changes insideRad to be 0, skip the minkowski.
     if (insideRad > 0) {
	  // Cut rounded corners inside of clamp.
	  translate([insideRad - clampSlop, - barWidth + insideRad - (clampStyle == 2 ? clampSepDistance : 0) - clampSlop, -.1])
	       minkowski() {
	       cube([barHeight - (insideRad * 2) + (clampSlop * 2), barWidth - (insideRad * 2) + (clampStyle == 2 ? clampSepDistance : 0) + (clampSlop * 2), (clampWidth / 2) + .1]);
	       cylinder(r=insideRad,h=(clampWidth / 2) + .1, $fn=200);
	  }
     } else {
	  // Cut square corners inside clamp instead of rounded.
	  translate([-clampSlop, - barWidth - (clampStyle == 2 ? clampSepDistance : 0) - clampSlop, -.1])
	       cube([barHeight + (clampSlop * 2), barWidth + (clampStyle == 2 ? clampSepDistance : 0) + (clampSlop * 2), clampWidth + .2]);
     }
	  
     // Seprate the clamp and add fastener holes to clamp if needed.
     if (clampStyle == 2) {
	  // Separate the clamp itself.
	  translate([-(clampHoleDiameter * 2) - clampMat - clampSlop - clampFilletRadius - .1, - (barWidth / 2) - clampSepDistance, -.1])
	       cube([barHeight + (clampHoleDiameter * 4) + (clampMat * 2) + (clampSlop * 2) + (clampFilletRadius * 2) + .2, clampSepDistance, clampWidth + .2]);

	  // Add fastner hole on left side
	  translate([-(clampMat + clampSlop + clampFilletRadius + clampHoleDiameter), - ((barWidth / 2) + clampMat + clampSepDistance + .1 ), (clampWidth / 2)])
	       rotate([-90,0,0])
	       cylinder(d=clampHoleDiameter, h=((clampMat * 2) + clampSepDistance + .2), $fn=200);

	  // Add fastner hole on right side
	  translate([(clampMat + clampSlop + clampFilletRadius + clampHoleDiameter + barHeight), - ((barWidth / 2) + clampMat + clampSepDistance + .1 ), (clampWidth / 2)])
	       rotate([-90,0,0])
	       cylinder(d=clampHoleDiameter, h=((clampMat * 2) + clampSepDistance + .2), $fn=200);

	  // Create the cylinders that will remove the excess from the fillet for the connection of the fastener tabs to the clamp.
	  // Left front side fillet cylinder.
	  translate([-clampMat - clampSlop - clampFilletRadius, - (barWidth / 2) - clampMat - clampSepDistance - clampFilletRadius, -.1])
	       cylinder(r=clampFilletRadius, h=clampWidth + .2, $fn=200);
	  
	  // Left rear side fillet cylinder.
	  translate([-clampMat - clampSlop - clampFilletRadius, - (barWidth / 2) + clampMat + clampFilletRadius, -.1])
	       cylinder(r=clampFilletRadius, h=clampWidth + .2, $fn=200);
	  
	  // Right front side fillet cylinder.
	  translate([barHeight + clampMat + clampSlop + clampFilletRadius, - (barWidth / 2) - clampMat - clampSepDistance - clampFilletRadius, -.1])
	       cylinder(r=clampFilletRadius, h=clampWidth + .2, $fn=200);
	  
	  // Right rear side fillet cylinder.
	  translate([barHeight + clampMat + clampSlop + clampFilletRadius, - (barWidth / 2) + clampMat + clampFilletRadius, -.1])
	       cylinder(r=clampFilletRadius, h=clampWidth + .2, $fn=200);
     }

     // Cut out the gap if needed.
     if (clampMidGap > 0) {
	  // Move to the center of the clamp opposite of the connecting bar.
	  translate([-clampSlop + (barHeight / 2) - (clampMidGap / 2), - barWidth - clampSlop - (clampStyle == 2 ? clampSepDistance : 0) - clampMat - .1, - .1])
	       cube([clampMidGap, clampMat + .2, clampWidth + .2]);
     }
}


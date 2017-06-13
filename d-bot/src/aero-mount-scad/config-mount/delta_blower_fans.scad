// Basic model for the Delta BFB0512VHD-F00
/*
Copyright (C)2015 Chris Roadfeldt <chris@roadfeldt.com>

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
//

outletDepth = 27; // Approximately, how wide to make the outlet housing. Viewed from the side with out at top left.
outletHeight = 27; // How high to make the outlet. Viewed from the side with outlet at top left.
outletWidth = 20; // How wide to make the outlet. Fan longest dimension vertical and viewing outlet opening straight on.
outletWallThickness = 1.6; // How thick to make the outlet housing walls.
housingOffset = -2; // How far to offset the center of the fan housing in the vertical. Viewed from the side with outlet at top left.
housingAngle = floor(asin((outletDepth - 25) / outletHeight)); // Where the outlet meets the fan housing.
housingFinalLength = outletHeight / (cos(housingAngle)); // How long the final length of the housing should be.
realOutletDepth = 25 + tan(housingAngle) * outletHeight; // How wide to make the outlet housing for real.

module blower_fan_50_20() {
     difference() {
	  blower_fan_50_20_base();

	  blower_fan_50_20_holes();
     }
/*
translate([-25,0,25])
     #cube([50,20,1]);

translate([-25,0,-26])
     #cube([50,20,1]);

translate([-26,0,-25])
     #cube([1,20,50]);

translate([25,0,-25])
     #cube([1,20,50]);
*/
}

module blower_fan_50_20_base() {
     union() {
	  base_fan_50_20();

	  screw_mount_point(3.25,20,20,0,21);
	  screw_mount_point(3.25,20,20,0,-22);
	  screw_mount_point(3.25,20,-18,0,-22);
     }
}

module blower_fan_50_20_holes() {
     translate([-25.1, outletWallThickness,housingOffset + outletWallThickness])
	  cube([realOutletDepth + .1, outletWidth - (outletWallThickness * 2), outletHeight - (outletWallThickness * 2)]);
     
     screw_hole_single(2.25,20.2,20,-.1,21);
     screw_hole_single(2.25,20.2,20,-.1,-22);
     screw_hole_single(2.25,20.2,-18,-.1,-22);

     hull() {
	  translate([0,outletWallThickness,housingOffset])
	       for (i=[0:(270 - housingAngle)]) {
		    rotate([0,180 - i,0])
			 scale([((i * .23) / (270 - housingAngle)) + .77,1,((i * .23) / (270 - housingAngle)) + .77])
			 cube([housingFinalLength - outletWallThickness, outletWidth - (outletWallThickness * 2), .1]);
	       }
     }
}

module base_fan_50_20() {
     union() {
	  hull() {
	       translate([0,0,housingOffset])
		    for (i=[0:(270 - housingAngle)]) {
			 rotate([0,180 - i,0])
			      scale([((i * .23) / (270 - housingAngle)) + .77,1,((i * .23) / (270 - housingAngle)) + .77])
			      cube([housingFinalLength, outletWidth, .1]);
		    }
	  }
	  
	  translate([-25, 0, housingOffset])
	       cube([realOutletDepth, outletWidth, outletHeight]);
     }
}

module screw_hole_single(radius,height,x,y,z) {
     translate([x,y,z])
	  rotate([270,0,0])     
	  cylinder(r=radius,h=height,$fn=100);
}

module screw_mount_point(radius,height,x,y,z) {
     hull() {
	  screw_hole_single(radius,height,0,0,-2);
	  screw_hole_single(radius,height,x,y,z);
     }
}

genSwitchDimensions = [[10.5,7,21],[2.5,5.5,2.5,4,1.8],[2.5,15.5,2.5,4,1.8]];
cBotXAxisSwitchDimensions = genSwitchDimensions;

	       cube(cBotXAxisSwitchDimensions[0]);
	       // Carve out a space for through hole solder points, if needed.
	       if(cBotXAxisSwitch == "yl99" || cBotXAxisSwitch == "keyes") {
		    hull() {
			 translate([cBotXAxisSwitchTHOffset,
				    cBotXAxisSwitchDimensions[0][1],
				    (cBotXAxisSwitchDimensions[0][2] / 2) - 4])
			      sphere(r=1.5, $fn=100);
			 translate([cBotXAxisSwitchTHOffset,
				    cBotXAxisSwitchDimensions[0][1],
				    (cBotXAxisSwitchDimensions[0][2] / 2) + 4])
			      sphere(r=1.5, $fn=100);
		    }
		    // Carve out some space for the solder pads near the switch.
		    for(i=[-5:5:5]) {
			 hull() {
			      translate([cBotXAxisSwitchDimensions[0][0] - 11,
					 cBotXAxisSwitchDimensions[0][1],
					 (cBotXAxisSwitchDimensions[0][2] / 2) + i])
				   sphere(r=1.4, $fn=100);
			      translate([cBotXAxisSwitchDimensions[0][0] - 7,
					 cBotXAxisSwitchDimensions[0][1],
					 (cBotXAxisSwitchDimensions[0][2] / 2) + i])
				   sphere(r=1.4, $fn=100);
			 }
		    }
		    // Carve out a space for the switch itself.
		    translate([cBotXAxisSwitchDimensions[0][0] - 7,
			       cBotXAxisSwitchDimensions[0][1] -.1,
			       (cBotXAxisSwitchDimensions[0][2] / 2) - 6.65])
			 cube([7,1.4 + .1,13.3]);
	       }
	       // Carve out the mounting holes
	       for(i=[1:1:len(cBotXAxisSwitchDimensions)-1]) {
		    translate([cBotXAxisSwitchDimensions[i][0],
			       cBotXAxisSwitchDimensions[0][1],
			       cBotXAxisSwitchDimensions[i][1]])
			 rotate([-90,0,0])
			 bolt_hole(cBotXAxisSwitchDimensions[i][2],
				   (carriageDepth - cBotXAxisSwitchDepth -
				    cBotXAxisSwitchDimensions[i][4]),
				   cBotXAxisSwitchDimensions[i][3],
				   cBotXAxisSwitchDimensions[i][4]);
	       }	       

// Create module for the bolt hole and nut trap.
module bolt_hole(bdia=xMountBoltDiameter,
                 bdep=xMountBoltDepth,
                 ndia=xMountNutDiameter,
                 ndep=xMountNutDepth) {
     union() {
          // Note we shift the cylinders in the z axis by .1 and make then .2 bigger to avoid coincident faces.
          // Screw hole
          translate([0,0,-.2])
               cylinder(d=bdia,h=bdep + (boltHoleSupportFix == 1 ? 0 : .3),$fn=100);
          // Nut Trap
          translate([0,0,bdep])
               cylinder(d=ndia,h=ndep + .1,$fn=6);
     }
}


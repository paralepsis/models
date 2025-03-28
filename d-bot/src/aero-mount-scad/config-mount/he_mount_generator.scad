// Roadfeldt - Hot End Mount Generator
//
/*
  Copyright (C)2015-2017 Chris Roadfeldt <chris@roadfeldt.com>

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
// Includes E3D V6 openscad design by Author: Professional 3D - Jons Collasius from Germany/Hamburg
// URL Professional 3D: http://professional3d.de
// http://www.thingiverse.com/thing:548237
//

// Which hotend are we importing? Can only use one at a time, Jons uses the same variable
// and module names and openscad doesn't support conditionally import as far as I can tell.

// Bring in the basic delta fan designs I created for visualization.
use<delta_blower_fans.scad>;

/* [Features] */
// What type of Carriage do you use / need?
carriage = "cbot"; // [cbot:C Bot style]

// Which hot end is in use. Ensure you enter height from top of mount to tip of nozzle if you select generic J Head.
hotend = "e3d_v6"; // [e3d_v6:E3D V6, jhead_mkv:J Head Mark V, gen_jhead:Generic J Head]

// Where should the hot end mount be positioned vertically? Optimized changes the mount height to increase vertical build height as much as possible. Universal keeps the mount height the same for all hot ends allow for easier interchange.
hotendOpt = "optimize"; // [ optimize:Optimized, universal:Universal]

// What style of extruder are you using?
extruder = "none"; // [bowden:Bowden, titan:E3D Titan, carl_direct:Carl Feniak Direct Drive - Not ready yet.]

// What type of fan duct should be made?
fanDuctStyle = "none"; // [simple:Simple single outlet, none:None, fancy:Round one]

// Which Z Probe type is in use. Select Servo here if you want to if you Servo Bracket selected above, otherwise it won't appear.
servoInduct = "bltouch"; // [servo:Servo w/ Arm, bltouch:BL Touch, none:Neither/None]

// Which side should the z probe be on? Be mindful of clearance with fan mount.
// If you choose a Prusa i3 style carriage and a titan extruder, this will be overridden to left.
zProbeSide = "left"; // [right:Right of hot end., left:Left of hot end.]

// Which side should the fan mount to? Be mindful of Z probe clearance.
printFanSide = "none"; // [left:Left side of hot end., right:Right side of hot end., none:No print cooling fan.]

// Should the fan outlet point towards the left or the right? Be mindful of Z probe clearance.
printFanDirection = "right"; // [left:Fan outlet to the left, right:Fan outlet to right]

// Should the nut traps be closed, so printing support is not needed? This will mean the holes with nut traps will be closed with .1mm amount of material which will need to be removed prior to use.
boltHoleSupportFix = 1; // [ 1:Yes, 0:No]

// Should the parts be exploded, do this before producing the stl file. You will still receive a single STL file with all the parts, but they will be separated so you can split them up with Cura or NetFabb. Select no if you want to see the parts fit together as they would on the printer. Selecting no will NOT produce a valid STL for printing as the parts will be inseparable.
explodeParts = 1; // [1:Yes, 0:No]

/* [General] */

// How wide to make the X Carriage back plane.
xMountWidth = 40;

// How high to make the X Carriage back plane. Affects both X Carriage and servo mount.
xMountHeight = 40;

// How deep the overall X Back Plane should be.
xMountDepth = 5;

// The radius of the rounded X Back Plane corners.
xMountCornerRadius = 4;

// How wide to make the X Carriage nut traps, point to point, not flat to flat.
xMountNutDiameter = 8.8;

// How deep to make the X Carriage nut traps.
xMountNutDepth = 3.8;

// How wide to make the X Carriage bolt shaft holes.
xMountBoltDiameter = 4.5;

// Distance between mounting bolt holes in the horizontal direction
xMountHoleWidth = 23;

// Distance between mounting bolt holes in the vertical direction
xMountHoleHeight = 23;

/* [C Bot Carriage] */

// Which part should be displayed.
// hotm = Carriage side with hot end
// carrside = Carriage side opposite hot end side. This one is for accessories.
// fanm = Fan Mount
// fant = Fan Bracket
// duct = Fan Duct
// jhead_col = J Head style collar
// xbump = X Endstop Bumper
// bltouch = BL Touch mount
// all = All parts

// Which C Bot part should be exported.
cBotWhich = "all"; // [hotm:Carriage with Cold / Hot End  Mount, carrside: Carriage Side, jhead_col:J Head Style Collar, belth:Belt Holder, fant:Fan Mount Bracket, fanm:Fan Mount, duct:Fan Duct, xbump:X Endstop Bumper, bltouch:BL Touch, all:All Parts] 

// Do you want a carriage mount axis limit switch?
cBotXAxisSwitch = "gen"; // [yl99:YL-99, keyes:Keyes, gen:Generic Mini Switch, none:None]

// Which side should have the endstop mount?
cBotXAxisSwitchSide = "acc"; // [he:Hot End, acc:Accessory, both:Both]

// Which carriage should the probe mout on?
cBotProbeCarriage = "acc"; // [he:Hot End Carriage, acc:Accessory Carriage]

// How deep into the carriage should the switch be recessed?
cBotXAxisSwitchDepth = 1;

// How far should the switch stick out from the carriage?
cBotXAxisSwitchOffset = 2;

// How far in should the cutout for the through hole cavity be?
cBotXAxisSwitchTHOffset = 2.5;

// Minimum width of carriage, will be increased if needed.
cBotCarriageMinWidth = 40;

// Should the carriage have 3 or 4 wheels?
cBotNumberOfCarriageWheels = "4"; // [3:Three Wheels, 4:Four Wheels]

// Amount of material around screw holes for carriage idler wheels.
cBotCarriageIdlerScrewMat = 3.3;

// Height of XY Bar .
cBotXYBarHeight = 40;

// Distance between wheel centres to add to height of XY bar (10mm for solid v-wheels, Unknown for mini wheels).
cBotWheelOffsetFromBar = 10;

// Depth of carriage.
cBotCarriageDepth = 5;

// Diameter of screw holes for carriage idler wheels.
cBotCarriageIdlerScrewDiameter = 5.2;

// Diameter of screw holes for carriage eccentric spacer.
cBotCarriageEccentricSpacerScrewDiameter = 7.2;

// Diameter of screw holes that mounts back plane to carriage.
cBotCarriageMountScrewDiameter = 4.2;

// Horizontal distance of screw holes for back plane mount. Not used if hot end mount is integrated.
cBotCarriageMountScrewHorizontalDistance = 30;

// Vertical distance of screw holes for back plane mount. Not used if hot end mount is integrated.
cBotCarriageMountScrewVerticalDistance = 30;

// Vertical position of back plane mount from bottom of carriage. Not used if hot end mount is integrated.
cBotBackMountVertPosition = 40;

// Vertical position of fan bracket.
cBotFanMountPos = 25;

// Vertical position of accessory mount holes. Offset from top and bottom respectively.
cBotAccessoryMountPos = 7;

// Vertical position of cable tie locations. Offset from top down.
cBotCableTieVerticalPos = 4.5;

// Vertical distance of cable tie locations. Offset from top down.
cBotCableTieVerticalDistance = 15;

// How many rows of cable tie cut outs should there be?
cBotCableTieVerticalCount = 3;

// How many columns of cable tie cut outs should there be?
cBotCableTieHorizontalCount = 3;

// How much to shrink the horizontal spacing of the cable ties?
cBotCableTieHorizontalOffset = 5;

// How much vertical offset should be added / removed for the titan mount?
cBotTitanVertOffset = -12;

/* [Hot End Settings] */

// How far out to offset the Hot End from the rear of the mount.
heDepthOffset = 0.0; // Not needed, but kept just in case.

// Hot end mount height offset. Positive number = higher, negative = lower.
heHeightOffset = 0;

// Thickness of Chimera mount vertical brace.
chiBraceThickness = 4;

// How thick the Chimera mount top plate should be.
chiMountHeight = 5;

// Enter height in millimeters from the top of the J Head mount, usually that is the top of the cold end itself. The top of the mount is 3.7 mm from the top of the inner groove of the J Head mount.
genJHeadHeight = 0;

// J Head adjustments. How much to adjust the J Head mount. Really dependent on your printer. Print a calibration cube and enter the adjustments in size here. These are mm and will be added to their respective parameters. eg; you want to make the height of the collar in the middle smaller by .2mm, enter -.2 in innerCollarHeightAdjustment. If you want to make that same collar a larger hole by .2mm, enter .2 in innerCollarDiameterAdjustment.

upperCollarDiameterAdjustment = .1;
upperCollarHeightAdjustment = .15;
innerCollarDiameterAdjustment = .2;
innerCollarHeightAdjustment = -0.3;
lowerCollarDiameterAdjustment = .1;
lowerCollarHeightAdjustment = .15;

/* [Print Cooling Fan] */

// How thick the fan mount should be.
fanMountThickness = 4;

// Diameter of the hole for the screws that hold the fan on to the mount.
fanMountScrewDiameter = 4.5;

// Amount of material around the fan screw holes.
fanMountScrewMat = 3;

// X,Y coordinates of holes for fan screw relative to the center of the fan.
fanMountScrews = [[-16,17],[21,20],[12,-17],[-22,-18]]; // 51x15

// Dimensions of the fan. Width, depth, height when looking at it from the side.
fanDimensions = [51,15,51];

// Outside dimensions of fan outlet
fanDuctConnectSize = [20, 15.4, 15.4];

// Offset from center of fan body to center of fan tab. Left / Right, Forward / Back, Up / Down. Usually only need Left / Right.
fanMountOffset = [2,0,0];

// Offset the center of the fan blower in relation to the overall fan body. Usually negative value of fanMountOffset.
fanCenterOffset = [-2,0,0];

// Diameter of fan opening. If your fan has air intakes on both sides, enter the diameter of that opening here.
fanIntakeDiameter = 20;

// How much clearance between the fan mount nubs and the fan tab. Too much of a gap and the fan mount will not snug up properly.
fanTabNubClear = .1;

// How far below the bottom of the fan should the bowl of the duct be.
fanDuctBowlDepth = 5;

// How thick should the exterior walls of the fan duct be?
fanDuctThickness = 1;

// How thick should the interior walls of the fan duct be?
fanDuctInternalThickness = .8;

// How far the fan duct should overlap the inside edge of the fan itself when connected.
fanDuctOverlap = 2;

// How far the fan duct should overlap the outside edge of the fan itself when connected.
fanDuctOutsideOverlap = 2;

// How far below the nozzle should the fan outlet point?
fanDuctOutletOffset = 0;

// Offset from the nozzles where the fan duct outlets should be placed. Leave named variables in place.
fanDuctOutletNozzleOffsetL = [16,3]; // [0] X distance from nozzle for start of duct opening, fanDuctThickness will be subtracted from this [1] Z distance from nozzle tip. + up, - down
simpleFanDuctOutletNozzleOffsetL = [12,1.5]; // [0] X distance from nozzle for start of duct opening, fanDuctThickness will be subtracted from this [1] Z distance from nozzle tip. + up, - down

// Size of air chamber around fan duct ring.
fanDuctAirChamberSize = [5,1.5]; // [0] X width of internal portion of air chamber, [1] Z height of internal portion of air chamber.

// Size of the fan duct outlets.
fanDuctOutletSize = [8,4]; // [0] Number of outlets, will be spread out equally. [1] Size of outlets.
simpleFanDuctOutletSize = [25,.1,4];

// Length of runner before Simple Fan Duct Nozzle
simpleFanDuctRunnerLength = 0;

// Extra vertical offset from nozzle.
simpleFanDuctRunnerOffset = 0;

/* [Z Probe / Servo] */

// How high should the probe extension be for the Prusa i3 carriage? Normally full height to avoid issues with endstops and other parts of printer.
probeExtHeight = "full"; // [full:Full Height of X Carriage, minimum:Minimum required to support probe mount]

// How much of a gap from the edge of the X Carriage back plane to the inside of the servo mount.
probeExtWidth = 25;

// How wide the servo body is when held vertical and mount holes on top and bottom with output facing away.
servoWidth = 12;

// How tall the servo body is held in the same orientation as servoWidth.
servoHeight = 23.5;

// How tall the servo mounting bracket is. Held in the same orientation as servoWidth.
servoMountPlateHeight = 32;

// Center to center distance for mounting screws on servo.
servoScrewDistance = 28;

// Diameter of screws holes used for mounting servo. Should be slighty smaller than screw.
servoScrewDiameter = 1.5;

// How much material should exist around the servo and servo mount screws.
servoBracketMat = 1.5;

// Diameter of screw holes used for mount bracket that the hold servo bracket.
servoBracketScrewDiameter = 3.5;

// Size of hole for nut trap for servo bracket. Point to point, not flat to flat.
servoBracketNutDiameter = 6.5;

// Depth of hole for nut trap for servo bracket.
servoBracketNutDepth = 2.4;

// Depth of the servo bracket base.
servoBracketBaseDepth = 2;

// Offset of servo mount from the bracket. Allows for C Bot bracket screws to clear. Keep in mind the fan mount probably needs to be adjusted as well so servo and fan mount and fan duct don't interfere with each other.
servoBracketOffset = 1;

// Distance between center of servo motor output and side of the servo body.
servoCenterOffset = 5;

// Diameter of whole the servo fits through to mount the arm.
servoShaftDiameter = 6.2;

// Diameter of servo hat where it connects to the servo motor.
servoHatTopDiameter = 6.2;

// Length of servo hat.
servoHatLength = 19;

// Diameter of servo hat at the opposite end of the servo mount, the tip of the servo hat.
servoHatTipDiameter = 4.2;

// Depth the servo hat should recess into the Z Probe Arm.
servoHatRecessDepth = 2;

// Thickness of the Z Probe arm.
zProbeThickness = 4;

// Diameter of Z Probe switch mounting screws.
zProbeScrewDiameter = 2;

// Distance between Z Probe switch mount screws.
zProbeScrewDistance = 10;

// Distance from servo bracket to Z Probe Arm, purely for visualizing how the arm fits in the space provided.
zProbeArmOffset = 4;

// How much material should around the holes in the arm.
zProbeArmMat = 2;

// Distance between the switch mount holes and the side with the switch.
zProbeSwitchHeight = 7.5;

// Distance below nozzle you want the switch to trigger, roughly, depends on switch activation point.
zProbeSwitchActivationDistance = 5;

/* [ Generic Probe Mount Variables ] */

// Offset of mount from back of X Carriage back plane.
probeOffset = 0;

// Thickness of sensor mount plate.
probePlateThickness = 3;

// Depth of back plate of probe mount.
probeBracketDepth = 3;

// Height of sensor mount braces.
probeBraceHeight = 20;

// Width of braces.
probeBraceWidth = 3;

// Diameter of screws that hold bracket on.
probeBracketScrewDiameter = 3.2;

// Diameter of nuts that hold bracket on.
probeBracketNutDiameter = 6.5;

// Depth of hole for nut trap for probe sensor bracket.
probeBracketNutDepth = 2.4;

// Mount inductive or BL Touch sensor with a removable bracket?
probeMountBracketed = 1; // [0:No, 1:Yes]

/* [Prusa i3 Carriage Advanced] */

// Variables used for calculations and not normally change variables..
xMountBoltDepth = (xMountDepth - xMountNutDepth); // How deep the X Carriage bolt shafts hole are.
xMountHoleWidthOffset = (xMountWidth - (xMountHoleWidth /2));
xMountHoleHeightOffset = (xMountHeight - (xMountHoleHeight /2));

/* [J Head Mount Advanced */

// Variables for J Head Mount
jHeadWidth = 26;
jHeadUpperCollarDiameter = upperCollarDiameterAdjustment + 16;
jHeadUpperCollarHeight = upperCollarHeightAdjustment + (hotend == "jhead_mkv" ? 4.76 :
							 3.7);
jHeadInnerCollarDiameter = innerCollarDiameterAdjustment + 12;
jHeadInnerCollarHeight =  innerCollarHeightAdjustment + (hotend == "jhead_mkv" ? 4.64 :
							  6);
jHeadLowerCollarDiameter = lowerCollarDiameterAdjustment + 16;
jHeadLowerCollarHeight = lowerCollarHeightAdjustment +  3;
jHeadMountHeight = jHeadUpperCollarHeight + jHeadInnerCollarHeight + jHeadLowerCollarHeight;
jHeadHEPosUD = (hotendOpt == "universal" ? 21 :
               (hotend == "e3d_v6" ? 21 :
	       (hotend == "jhead_mkv" ? 11 :
	       (hotend == "generic_jhead" ? 11 : 21))));
jHeadMountWidth = 36;
jHeadCollarCornerRadius = 3;
jHeadMountBoltDiameter = 3.2;
jHeadMountNutDiameter = 6.5;
jHeadMountNutDepth = 2.4;
jHeadFanScrewOffset = 5;
jHeadMountScrewHorizontalOffset = (jHeadWidth / 4);
jHeadMountScrewVerticalOffset = (jHeadMountHeight / 2);
jHeadCBotProbePos = 2; // Mounting position of probe mounts for J-Head mount based hotends on the C-Bot carriage.

/* [Hidden] */
// If the hotend is a chimera based one, force extruder to be bowden and fan duct style to be classic..
realExtruder = extruder;
realFanDuctStyle = fanDuctStyle;
echo("realFanDuctStyle", realFanDuctStyle);

// Depth from center of hotend to face of carriage.
jHeadMountDepth = 28.5; // Do not change this value, the direct drive extruders require this to be placed here and OpenSCAD programming makes it nearly impossible to auto adjust.

// Height of c-Bot carriage. 

 cBot3WheelHeight = cBotXYBarHeight + (cBotWheelOffsetFromBar * 2) + (cBotCarriageIdlerScrewMat * 2) + (cBotCarriageIdlerScrewDiameter /2) + (cBotCarriageEccentricSpacerScrewDiameter /2);
 cBot4WheelHeight = cBotXYBarHeight + (cBotWheelOffsetFromBar * 2) + (cBotCarriageIdlerScrewMat * 2) + (cBotCarriageIdlerScrewDiameter);
 cBotCarriageHeight = (cBotNumberOfCarriageWheels == "3") ? cBot3WheelHeight : cBot4WheelHeight;
 echo ("carriage height:",cBotCarriageHeight);

 /* [E3D V6 Advanced] */

// Variables for E3D V6
v6NozzleL = [[0, 0, -62]]; // This must be a vector of vectors. If only one nozzle, enter x,y,z in [[ ]]
v6VolNozzleL = [[0,0,-70.5]]; // This must be a vector of vectors. If only one nozzle, enter x,y,z in [[ ]]

/* [J Head Mark V Advanced] */

// Variables for J Head Mark V
jheadMkVNozzleL = [[0, 0, -51]]; // This must be a vector of vectors. If only one nozzle, enter x,y,z in [[ ]]

/* [Generic J Head Advanced] */

// Variables for Generic J Head Hot End
genericJHeadNozzleL = [[0, 0, -genJHeadHeight]]; // This must be a vector of vectors. If only one nozzle, enter x,y,z in [[ ]]

/* [E3D Titan Extruder Advanced] */

// Variables for E3D Titan extruder.
e3dTitanMountMat = 4; // How much material should be around the face of the mount.
e3dTitanMountCornerRadius = 4; // The radius of the corners for the mounting plate.
e3dTitanMountBraceWidth = 2; // Width of the brace that stabilizes the E3D Titan and Stepper.
e3dTitanMountBraceHeight = 5; // Height of brace.
e3dTitanMountLowerOverlap = 15; // Amount the brace overlaps the main carriage.

// Should a cut out be made for the extruder stepper?
extruderStepper = "normal"; // [normal:Typical size, non-pancake, pancake:Pancake]

/* [Hidden] */

// E3D Titan settings
e3dTitanOffset = [11.1,13.5]; // This is offset of the filament path. 0 - From center of stepper shaft, 1 - From face of carrier / mount. Do not change.
e3dTitanMountThickness = 7; // Only use the 7mm mount spacing. This allows for easier printing and provides a better thermal mass to reduce warping due to stepper overheating.
e3dTitanFilamentSideBodyOffset = 4; // How much longer to make the mount on the side nearest the filament path.

// Collision switch variables
ylSwitchDimensions = [[25.5,5,15],[7.25,11.5,3.2,6.5,2.4]]; //[x,y,z],[hole x, hole z, hole d, nut dia, nut depth],[hole.....
keyesSwitchDimensions = [[26.5,10,22],[3.5,18.5,3.2,6.5,2.4],[3.5,3.5,3.2,6.5,2.4]];
genSwitchDimensions = [[10.5,7,21],[2.5,5.5,2.5,4,1.8],[2.5,15.5,2.5,4,1.8]];
cBotXAxisSwitchDimensions = (cBotXAxisSwitch == "yl99" ? ylSwitchDimensions :
			     (cBotXAxisSwitch == "keyes" ? keyesSwitchDimensions :
				  (cBotXAxisSwitch == "gen" ? genSwitchDimensions : [])));
// Display parts offset
partsOffset = [0,10,0];

// Generic Hot End Variables
heNozzleL = (hotend == "chimera_v6" ? chiV6NozzleL
	     : (hotend == "chimera_vol" ? chiVolNozzleL
		   : (hotend == "e3d_v6" ? v6NozzleL
		      : (hotend == "e3d_v6_vol" ? v6VolNozzleL
			 : (hotend == "jhead_mkv" ? jheadMkVNozzleL
			       : (hotend == "gen_jhead" ? genericJHeadNozzleL
				  : [[0]])))))); // This must be a vector of vectors. If only one nozzle, enter x,y,z in [[ ]]

// Variables for BLTouch
blPlateOuterRadius = 4; // Radius of outer circles of the mount.
blPlateInnerDiameter = 3.2; // Diameter of outer circles used to mount the BL Touch.
blPlateCenterDiameter = 4.5; // Diameter of inner circle for wires.
blPlateRectDimensions = [8,11.54]; // Width, Depth of rectangle at center of plate.
blPlateInnerDistance = 9; // Distance from center of BL Touch to center of outer mounting holes.
blMountWidth = (blPlateOuterRadius + blPlateInnerDistance) * 2; // Overall width to consider when placing the BL Touch mounting bracket.
blMountDistance = 10; // Extra distance from other components.
blPlateHeight = 28; // The target height from the tip of the of the nozzle for the mount.
bltouchBracketExtra = 2; // How much extra should be added to the carriage to provide clearance for the bltouch mount bracket.

// Nema 17 Stepper Dimension variables.
nema17CenterDiameter = 22.4; // Diameter of hole for center of Nema 17 Stepper. Spec is 22, but added a little buffer.
nema17MountHoleLocs = [[-15.5,15.5],[15.5,15.5],[-15.5,-15.5],[15.5,-15.5]]; // Offsets from center of shaft to mounting holes, top left, top right, bottom left, bottom right.
nema17MountHoleDiameter = 3; // Diameter of mounting hole.
nema17OuterOffset= 21.15; // Offset of outside edges from center of shaft. Only need single value due to Nema 17 being square and shaft in center.

/* [C Bot Carriage Advanced] */

// Variables for C Bot Carriage.
cBotCarriageSideDistance = 20;
cBotTopHoleLength = 2;
cBotTopHoleAngle = 4.1;
cBotTopHoleDepth = 6;
cBotMountScrewDepth = cBotCarriageDepth - 2.5;
cBotBeltDepth = 3;
cBotBeltToothHeight = 1;
cBotBeltToothSpacing = 2;
cBotBeltToothLength = 10;
cBotBeltLength = 13;
cBotBeltHeight = 7;
cBotBeltBottomPos = 7; // Distance from center of carriage side.
cBotBeltTopPos = 6; // Distance from center of carriage side.

/* NEW BELT PARAMETERS */
cBotBeltTopExtend = 8;
cBotBeltBottomExtend = 8;

cBotBeltScrewDiameter = 3.2;
cBotBeltScrewDistance = 3;
cBotBeltScrewNutDiameter = 6.5;
cBotBeltScrewNutDepth = 2.4;
cBotBeltHolderHeight = 19;
cBotBeltHolderDepth = 3;
cBotBeltHolderNubDepth = 2;
cBotBeltHolderNubHeight = 6.2;
cBotBeltHolderCornerRadius = 1;
cBotCenterHoleDiameter = 25;
cBotCenterHoleWidth = 30;
cBotCarriageCornerRadius = (cBotCarriageIdlerScrewDiameter / 2) + cBotCarriageIdlerScrewMat;
cBotFanTabVerticalAngle = 0;
cBotFanTabHorizontalAngle = 0;
cBotRealFanTabVerticalAngle = printFanSide == "left" ?
     cBotFanTabVerticalAngle :
     - cBotFanTabVerticalAngle;
cBotFanMountDistance = 10;
cBotFanBracketWidth = 20;
cBotFanBracketHeight = 8;
cBotFanBracketDepth = 3;
cBotFanTabHeight = 8;
cBotFanTabWidth = 5;
cBotFanTabDepth = 4;
cBotFanTabAngle = 0;
cBotFanTabHole = 3.2;
cBotFanTabMat = 2;
cBotXBumperHeight = 10; // Total Height of bumper.
cBotXBumperWidth = 14; // How wide to make the bumper.
cBotXBumperDepth = 3; // How thick to make the bumper.
cBotXBumperHolePos = [10,5]; // Where the hole is in relation to the bottom of the bumper.

/* [Hidden] */
realZProbeSide = (0 && realExtruder == "titan" ? "left" : zProbeSide);
cBotProbePos = (hotend == "chimera_v6" || hotend == "chimera_vol") ? chiCBotProbePos : jHeadCBotProbePos; // Used the correct location of the probe mount based on hotend type.
heMountWidth =
     (hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "gen_jhead")
     ? jHeadMountWidth
     : 0;
cBotTempCarriageWidth = heMountWidth + (cBotCarriageIdlerScrewDiameter * 2) + (cBotCarriageIdlerScrewMat * 4) +
					     (servoInduct == "bltouch" ? blMountWidth + bltouchBracketExtra:
					    0);
cBotCarriageWidth = (cBotCarriageMinWidth > cBotTempCarriageWidth ? cBotCarriageMinWidth : cBotTempCarriageWidth);
cBotFanBarWidth = cBotFanTabWidth + (cBotFanTabWidth * 2) + (fanTabNubClear * 2);
cBotFanScrewL = [printFanSide == "left" ? cBotCarriageWidth - (fanDimensions[0] / 2) :
		 (fanDimensions[0] / 2),
		 cBotCarriageSideDistance + cBotCarriageDepth + cBotFanBracketDepth + cBotFanTabDepth + (cBotFanTabHole / 2) + cBotFanTabMat,
		 cBotFanMountPos];
cBotFanScrewOffset = 0;
cBotTempDuctConnectL = fan_duct_connect(cBotFanScrewL, cBotFanTabHorizontalAngle, cBotRealFanTabVerticalAngle, fanDimensions, fanCenterOffset, fanMountOffset, fanMountThickness, cBotFanTabHole, cBotFanTabMat, fanDuctConnectSize, true);
cBotDuctConnectL = [cBotTempDuctConnectL[1],cBotTempDuctConnectL[0]];
cBotJHeadMountL = [(realZProbeSide == "right" ? (cBotBeltLength + 2) :
		  (cBotCarriageWidth - (cBotBeltLength + jHeadMountWidth + 2))),
		   - (cBotCarriageDepth + jHeadMountDepth + heDepthOffset),
		   jHeadHEPosUD + heHeightOffset];
cBotJHeadAnchorL = [cBotJHeadMountL[0] + (jHeadMountWidth / 2),
		    - (cBotCarriageDepth + (jHeadMountDepth / 2) + heDepthOffset),
		    cBotJHeadMountL[2] + jHeadMountHeight]; // Position of E3D V6 Mount.
cBotHEMountL = 
     (hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "gen_jhead")
     ? cBotJHeadMountL
     : 0;
cBotHEAnchorL =
     (hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "gen_jhead")
     ? cBotJHeadAnchorL
     : 0;
cBotCableTieHorizontalDistance = (cBotCarriageWidth / (cBotCableTieHorizontalCount + 1));

// Generic variables that are hot end and carriage dependent.
heMountL = cBotHEMountL;
heAnchorL =  cBotHEAnchorL;
fanScrewL = cBotFanScrewL;
tempDuctConnectL = cBotDuctConnectL;
ductConnectL = (printFanDirection == "left" ? tempDuctConnectL[0] : tempDuctConnectL[1]);
heMountWidth = (hotend == "chimera_v6" || hotend == "chimera_vol" )
     ? chiMountWidth
     : (hotend == "e3d_v6" || hotend == "e3d_v6_vol" || hotend == "jhead_mkv" || hotend == "gen_jhead")
     ? jHeadMountWidth
     : 0;

// Generic Z Probe variable logic
probeMountDistance = (servoInduct == "bltouch" ? blMountDistance :
		       0);
probeMountWidth = (servoInduct == "bltouch" ? blMountWidth :
		     0);
probePlateHeight =  (servoInduct == "bltouch" ? blPlateHeight : 0);
cBotProbeMountL = [ realZProbeSide == "right" ?
		     (cBotCarriageWidth / 2) + ((cBotFanMountDistance / 2) + (cBotFanMountDistance * floor((((cBotCarriageWidth - (cBotCarriageIdlerScrewDiameter * 2) - (cBotCarriageIdlerScrewMat * 4)) / cBotFanMountDistance) / 2) - cBotProbePos /* The number after the - sign before this comment indicates position from edge */))) - (probeMountWidth / 2) :
		     (cBotCarriageWidth / 2) - ((cBotFanMountDistance / 2) + (cBotFanMountDistance * floor((((cBotCarriageWidth - (cBotCarriageIdlerScrewDiameter * 2) - (cBotCarriageIdlerScrewMat * 4)) / cBotFanMountDistance) / 2) - cBotProbePos /* The number after the - sign before this comment indicates position from edge. */))) - (probeMountWidth / 2),
		     - cBotCarriageDepth,
		     heAnchorL[2] + heNozzleL[0][2] + probePlateHeight];
probeMountL = cBotProbeMountL;
carriageDepth = cBotCarriageDepth;
echo("probeMountL", probeMountL);
echo("probeMountWidth", probeMountWidth);

// Variables for Fan Duct
fanDuctOutletAngle = atan((fanDuctOutletNozzleOffsetL[1] + fanDuctOutletOffset + fanDuctOutletSize[1]) / fanDuctOutletNozzleOffsetL[0]);
simpleFanDuctOutletAngle = atan((simpleFanDuctOutletNozzleOffsetL[1] + fanDuctOutletOffset + simpleFanDuctOutletSize[1] + (fanDuctThickness * 2)) / simpleFanDuctOutletNozzleOffsetL[0]);
fanDuctConnectRadius = fanDuctConnectSize[2] / 2; // Radius of the bottom of the fan duct below housing.

// Variables for probe extension and servo bracket.
cBotServoBracketL = [realZProbeSide == "right" ?
		     (cBotCarriageWidth / 2) + ((cBotFanMountDistance / 2) + (cBotFanMountDistance * floor(((cBotCarriageWidth / cBotFanMountDistance) / 2) -3))) :
		     (cBotCarriageWidth / 2) - ((cBotFanMountDistance / 2) + (cBotFanMountDistance * floor(((cBotCarriageWidth / cBotFanMountDistance) / 2) -3))),
		     - cBotCarriageDepth - servoBracketBaseDepth,
		     - ((servoBracketMat * 2) + servoWidth + ((servoMountPlateHeight - servoHeight) / 2))];
servoBracketL = cBotServoBracketL;
servoMountL = [-(servoBracketMat + (servoBracketScrewDiameter / 2)),
	       -((servoBracketMat * 2) + servoWidth + servoBracketBaseDepth - servoBracketOffset),
	       (servoBracketMat * 2) + servoBracketNutDiameter];
cBotServoBracketBotScrewL = [realZProbeSide == "right" ?
			     - cBotFanMountDistance :
			     cBotFanMountDistance,
			     servoBracketBaseDepth,
			     -servoBracketL[2] + cBotAccessoryMountPos];
cBotServoBracketTopScrewL = [cBotServoBracketBotScrewL[0],
			     cBotServoBracketBotScrewL[1],
			     cBotServoBracketBotScrewL[2] + cBotAccessoryMountPos];
servoBracketBotScrewL = cBotServoBracketBotScrewL;
servoBracketTopScrewL = cBotServoBracketTopScrewL;

// Variables for Z Probe
cBotZProbeTopL = [realZProbeSide == "right" ?
		  servoBracketL[0] + servoMountL[0] - zProbeArmOffset:
		  servoBracketL[0] - servoMountL[0] + zProbeArmOffset,
		  servoBracketL[1] + servoMountL[1] + servoBracketMat + (servoWidth / 2),
		  servoBracketL[2] + servoMountL[2] + ((servoMountPlateHeight - servoHeight) / 2) + servoCenterOffset];
zProbeTopL = cBotZProbeTopL;
zProbeBottomL = -zProbeTopL[2] + (heAnchorL[2] + heNozzleL[0][2]) + (servoHatTopDiameter / 2) + zProbeArmMat + zProbeSwitchHeight - zProbeSwitchActivationDistance;

// Toggle that controls if fan is shown.
showFan = false;
showHE = false;

////////// C Bot //////////
if(carriage == "cbot") {
     // Carriage side with hot end mount.
     if(cBotWhich == "hotm" || cBotWhich == "all") {
	  difference() {
	       union() {
		    // Display C Bot Hot End Carriage Side.
		    cbot_carriage_side(true);

	       }

	  }
     }
		    
     // Opposite side carriage plate.
     if(cBotWhich == "carrside" || cBotWhich == "all") {
	  // Non hot end carriage side.
	  translate([cBotCarriageWidth, cBotCarriageSideDistance, 0])
	       rotate([0, 0, 180])
	       cbot_carriage_side(false);
     }
     
     // BL Touch mount
     if((cBotWhich == "bltouch" || cBotWhich == "all") && servoInduct == "bltouch") {
	  // Place the bltouch mount itself
	  difference() {
	       // Place the mount.
	       translate(probeMountBracketed == 1 ?
			 (explodeParts == 1 ? (probeMountL - partsOffset) :
			  probeMountL) :
			 probeMountL)
		    bltouch_mount(carriageDepth,true);
	  }
     }

     // Belt holders.
     if(cBotWhich == "belth" || cBotWhich == "all") {
	  translate([-15,0,0])
	       cbot_belt_holder();
     }
}

//////// Component Modules /////////

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

// Servo probe extension
module servo_ext(servoBracketL) {
     // Create the extension for the z Probe Servo.
     hull() {
	  // Bottom outside corner
	  translate([ realZProbeSide == "right" ?
		      servoBracketL[0] - xMountCornerRadius :
		      servoBracketL[0] + xMountCornerRadius,
		      0,xMountCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xMountCornerRadius, h=carriageDepth, $fn=100);

	  // Top outside corner
	  translate([ realZProbeSide == "right" ?
		      servoBracketL[0] - xMountCornerRadius :
		      servoBracketL[0] + xMountCornerRadius,
		      0,xMountHeight-xMountCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xMountCornerRadius, h=carriageDepth, $fn=100);
	  
	  translate([ realZProbeSide == "right" ?
		      xMountWidth - probeExtWidth - .1 :
		      -probeExtWidth - .1,
		      -carriageDepth, 0])
	       cube([probeExtWidth + xMountCornerRadius + .1, carriageDepth, xMountHeight]);
     }
     
     // Create the servo bracket tabs.
     hull () {
	  // Bottom
	  translate([servoBracketL[0],
		     servoBracketL[1] + carriageDepth,
		     servoBracketL[2] + servoBracketBotScrewL[2]])
	       rotate([90,0,0])
	       cylinder(r=(servoBracketNutDiameter / 2) + servoBracketMat, h=carriageDepth, $fn=100);

	  // Top
	  translate([servoBracketL[0],
		     servoBracketL[1] + carriageDepth,
		     servoBracketL[2] + servoBracketTopScrewL[2]])
	       rotate([90,0,0])
	       cylinder(r=(servoBracketNutDiameter / 2) + servoBracketMat, h=carriageDepth, $fn=100);
     }
}

module servo_ext_holes(servoBracketL) {
     // Create the holes needed for the z probe extension.
     // Bottom
     translate(servoBracketL + servoBracketBotScrewL)
	  rotate([-90,0,0])
	  bolt_hole(servoBracketScrewDiameter, carriageDepth - servoBracketNutDepth, servoBracketNutDiameter, servoBracketNutDepth);

     // Top
     translate(servoBracketL + servoBracketTopScrewL)
	  rotate([-90,0,0])
	  bolt_hole(servoBracketScrewDiameter, carriageDepth - servoBracketNutDepth, servoBracketNutDiameter, servoBracketNutDepth);
}

module fan_screw_hole_single(tabHole, tabHoleMat, diameter, thickness, height, x, y, z) {
     rotate([90,0,0])
	  translate([x,
		     z,
		     (tabHole / 2) + tabHoleMat + (thickness / 2) + y])
	  cylinder(d=diameter,h=height,$fn=100,center=true);
}

// Servo Bracket
module servo_bracket(cbot=false) {
  union() {
       // Create the top and bottom mounting holes.
       hull () {
	    // Bottom
	    translate(servoBracketBotScrewL)			       
		 rotate([90,0,0])
		 cylinder(r=(cBotBeltScrewDiameter / 2) + servoBracketMat, h=servoBracketBaseDepth, $fn=100);
	    
	    // Top
	    translate(servoBracketTopScrewL)			       
		 rotate([90,0,0])
		 cylinder(r=(cBotBeltScrewDiameter / 2) + servoBracketMat, h=servoBracketBaseDepth, $fn=100);

	    // Connection to servo bracket.
	    translate([servoMountL[0],
		       0,
		       servoMountL[2]])
		 cube([(servoBracketMat * 2) + servoBracketScrewDiameter,
		       servoBracketBaseDepth,
		       servoMountPlateHeight]);
       }
       
       // Create the servo enclosure.
       rotate([0,0,0])
	    translate(servoMountL)
	    servo_mount();
  }
}

module servo_bracket_holes(cbot=false) {
	  // Carve out holes for cbot.
	  // Bottom
	  translate([servoBracketBotScrewL[0],
		     servoBracketBotScrewL[1] + .1,
		     servoBracketBotScrewL[2]])			       
	       rotate([90,0,0])
	       cylinder(d=cBotBeltScrewDiameter, h=servoBracketBaseDepth + .2, $fn=100);
	  
	  // Top
	  translate([servoBracketTopScrewL[0],
		     servoBracketTopScrewL[1] + .1,
		     servoBracketTopScrewL[2]])
	       rotate([90,0,0])
	       cylinder(d=cBotBeltScrewDiameter, h=servoBracketBaseDepth + .2, $fn=100);
	  
	  // Carve out the holes for the servo mount.
	  rotate([0,0,0])
	  translate([servoMountL[0],
		     servoMountL[1] + (servoBracketMat + (servoWidth / 2)),
		     servoMountL[2]])
	       servo_mount_holes();

}

// Inductive / Capacitive / BL Touch extension
module probe_ext() {
     // Create the extension for the inductive / capacitive / BL Touch sensor.
     hull() {
	  // Bottom corner of X Carriage back plane.
	  translate([ realZProbeSide == "right" ?
		      xMountWidth - xMountCornerRadius
		      : xMountCornerRadius,
		      0,xMountCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xMountCornerRadius, h=carriageDepth, $fn=100);

	  // Top corner of X Carriage back plane.
	  translate([ realZProbeSide == "right" ?
		      xMountWidth - xMountCornerRadius
		      : xMountCornerRadius,
		      0,xMountHeight - xMountCornerRadius])
	       rotate([90,0,0])
	       cylinder(r=xMountCornerRadius, h=carriageDepth, $fn=100);

	  // Probe extension top outside corner.
	  translate([ realZProbeSide == "right" ?
		      heMountL[0] + heMountWidth + probeMountDistance + probeMountWidth - (probeExtHeight == "full" ? xMountCornerRadius : (probeBraceWidth / 2)):
		      heMountL[0] - (probeMountDistance + probeMountWidth - (probeExtHeight == "full" ? xMountCornerRadius : (probeBraceWidth / 2))),
		      0,
		      (probeExtHeight == "full" ?
		       xMountHeight - xMountCornerRadius :
		       heAnchorL[2] + heNozzleL[0][2] + probePlateHeight + probePlateThickness + probeBraceHeight - (probeBraceWidth / 2))])
	       rotate([90,0,0])
	       cylinder(d=(probeExtHeight == "full" ? (xMountCornerRadius * 2) : probeBraceWidth), h=carriageDepth, $fn=100);

	  // Probe extension top inside corner.
	  translate([ realZProbeSide == "right" ?
		      heMountL[0] + heMountWidth + probeMountDistance + (probeBraceWidth / 2):
		      heMountL[0] - probeMountDistance - (probeBraceWidth / 2),
		      0,
		      heAnchorL[2] + heNozzleL[0][2] + probePlateHeight + probePlateThickness + probeBraceHeight - (probeBraceWidth / 2)])
	       rotate([90,0,0])
	       cylinder(d=probeBraceWidth, h=carriageDepth, $fn=100);

	  // Probe mount bottom outside corner.
	  translate([ realZProbeSide == "right" ?
		      heMountL[0] + heMountWidth + probeMountDistance + probeMountWidth - (probeBraceWidth / 2):
		      heMountL[0] - (probeMountDistance + probeMountWidth - (probeBraceWidth / 2)),
		      0,
		      heAnchorL[2] + heNozzleL[0][2] + probePlateHeight + (probeBraceWidth / 2)])
	       rotate([90,0,0])
	       cylinder(d=probeBraceWidth, h=carriageDepth, $fn=100);

	  // Probe mount bottom inside corner.
	  translate([ realZProbeSide == "right" ?
		      heMountL[0] + heMountWidth + probeMountDistance + (probeBraceWidth / 2):
		      heMountL[0] - probeMountDistance - (probeBraceWidth / 2),
		      0,
		      heAnchorL[2] + heNozzleL[0][2] + probePlateHeight + (probeBraceWidth / 2)])
	       rotate([90,0,0])
	       cylinder(d=probeBraceWidth, h=carriageDepth, $fn=100);
     }
}

module probe_ext_holes(carriageDepth) {
     // Create the holes needed for the z probe extension.
     // First create the mounting holes if needed.
     if (probeMountBracketed == 1) {
	  // Create the mounting screw holes in the bracket and X Carriage back plane.
	  translate([(probeMountWidth / 2),
		     0,
		     probePlateThickness + (probeBracketScrewDiameter * 1.5)])
	       rotate([-90,0,0])
	       bolt_hole(probeBracketScrewDiameter, (carriageDepth - probeBracketNutDepth), probeBracketNutDiameter, probeBracketNutDepth);
	  
	  translate([(probeMountWidth / 2),
		     0,
		     probePlateThickness + probeBraceHeight - (probeBracketScrewDiameter * 1.5)])
	       rotate([-90,0,0])
	       bolt_hole(probeBracketScrewDiameter, (carriageDepth - probeBracketNutDepth), probeBracketNutDiameter, probeBracketNutDepth);
     }
}

// Cable tie hole creator.
module cable_tie(height, width, radius) {
     rotate_extrude()
	  translate([radius, 0, 0])
	  square([width, height]);
}

// Functions to return position variables.
// Fan Duct starting location, left fan orientation in first vector, right in second. This is offset from prusai3FanScrewL. Does NOT take angles into account.
function fan_duct_connect(tabScrewL, horizontalAngle, verticalAngle, dimensions, centerOffset, mountOffset, mountThickness, tabHole, tabHoleMat, ductConnectSize, reverseY=false)
= [[- (dimensions[0] * .25) - (ductConnectSize[0] / 2) - fanDuctThickness - centerOffset[0] - mountOffset[0],
    reverseY == false ? - ((tabHole / 2) + tabHoleMat + dimensions[1] + centerOffset[1] + mountOffset[1] + mountThickness) :
			   ((tabHole / 2) + tabHoleMat + centerOffset[1] + mountOffset[1] + mountThickness),
    - (dimensions[2] / 2) + centerOffset[2] + mountOffset[2]],
   [(dimensions[0] * .25) - (ductConnectSize[0] / 2) + fanDuctThickness + centerOffset[0] + mountOffset[0],
    reverseY == false ? - ((tabHole / 2) + tabHoleMat + dimensions[1] + centerOffset[1] + mountOffset[1] + mountThickness) :
			   ((tabHole / 2) + tabHoleMat + centerOffset[1] + mountOffset[1] + mountThickness),
    - (dimensions[2] / 2) + centerOffset[2] + mountOffset[2]]];
     
// C Bot modules
module cbot_carriage_side(heSide=false) {
	echo("heSide", heSide);
	echo("Number of wheels on carriage", cBotNumberOfCarriageWheels);
   
	difference(){
			union(){
				cbot_carriage_base(heSide);
				cbot_carriage_wheel_bolt_angle_plates();}  // Create the base.
			union(){
				cbot_carriage_holes();  // Then remove the holes.
				cBot_cut_other_holes(heSide);
			}
		}
}

module cbot_carriage_base(heSide=false) {
     // Base C Bot XY Carriage side.
     translate([cBotCarriageCornerRadius, 0, cBotCarriageCornerRadius])
	  hull() 
		{
		  // Create the top left corner.
		  translate([0, 0, cBotCarriageHeight - (cBotCarriageCornerRadius * 2)])
			   rotate([90,0,0])
			   cylinder(r=cBotCarriageCornerRadius, h=carriageDepth, $fn=100);
		  // Create the top right Corner
		  translate([cBotCarriageWidth - (cBotCarriageCornerRadius * 2), 0, cBotCarriageHeight - (cBotCarriageCornerRadius * 2)])
			   rotate([90,0,0])
			   cylinder(r=cBotCarriageCornerRadius, h=carriageDepth, $fn=100);
		  // Create the bottom left corner.
		  rotate([90,0,0])
			   cylinder(r=cBotCarriageCornerRadius, h=carriageDepth, $fn=100);
		  // Create the bottom right corner
		  translate([cBotCarriageWidth - (cBotCarriageCornerRadius * 2), 0, 0])
			   rotate([90,0,0])
			   cylinder(r=cBotCarriageCornerRadius, h=carriageDepth, $fn=100);
		}

    /* EXTENDED BELT POS -- NOT QUITE RIGHT... */
    if (heSide == true) hull() {
        /* top */
        translate([cBotCarriageCornerRadius-cBotBeltTopExtend,0,
                   cBotCarriageHeight/2+cBotBeltHeight+cBotBeltTopPos+cBotBeltScrewDistance])
            rotate([90,0,0]) cylinder(r=cBotCarriageCornerRadius, h=carriageDepth, $fn=100);
        translate([cBotCarriageCornerRadius-cBotBeltTopExtend,0,
                   cBotCarriageHeight/2+cBotBeltTopPos-cBotBeltScrewDistance])
            rotate([90,0,0]) cylinder(r=cBotCarriageCornerRadius, h=carriageDepth, $fn=100);

        /* Note: Assumes corner radius > screw diameter. */
        translate([0,-carriageDepth,
                   cBotCarriageHeight/2+cBotBeltTopPos-cBotBeltScrewDistance-cBotCarriageCornerRadius])
            cube([2,carriageDepth,
                  cBotBeltHeight+2*(cBotBeltScrewDistance+cBotCarriageCornerRadius)]);

        /* bottom */
        translate([cBotCarriageWidth - cBotCarriageCornerRadius+cBotBeltBottomExtend,0,
                   cBotCarriageHeight/2-cBotBeltHeight-cBotBeltBottomPos-cBotBeltScrewDistance])
            rotate([90,0,0]) cylinder(r=cBotCarriageCornerRadius, h=carriageDepth, $fn=100);
        translate([cBotCarriageWidth - cBotCarriageCornerRadius+cBotBeltBottomExtend,0,
                   cBotCarriageHeight/2-cBotBeltBottomPos+cBotBeltScrewDistance])
            rotate([90,0,0]) cylinder(r=cBotCarriageCornerRadius, h=carriageDepth, $fn=100);

        /* Note: Assumes corner radius > screw diameter. */
        translate([cBotCarriageWidth - 2*cBotCarriageCornerRadius+cBotBeltBottomExtend-2,-carriageDepth,
                   cBotCarriageHeight/2-cBotBeltBottomPos-(cBotBeltScrewDistance+cBotCarriageCornerRadius+cBotBeltHeight)])
            cube([2,carriageDepth,
                  cBotBeltHeight+2*(cBotBeltScrewDistance+cBotCarriageCornerRadius)]);
    }
}

module cbot_carriage_wheel_bolt_angle_plates(){
   // Create angle portion of top left corner. -- NOW BOTTOM -- RBR
     // translate([cBotCarriageCornerRadius, 0, cBotCarriageHeight - cBotCarriageCornerRadius])
     translate([cBotCarriageCornerRadius, 0, cBotCarriageCornerRadius+cBotTopHoleLength])
	  difference() {
		  hull() {
			   rotate([90,0,0])
				cylinder(r=cBotCarriageCornerRadius, h=cBotTopHoleDepth, $fn=100);
			   translate([0, 0, -cBotTopHoleLength])
				rotate([90,0,0])
				cylinder(r=cBotCarriageCornerRadius, h=cBotTopHoleDepth, $fn=100);
		  }
		  hull() {
			   translate([-cBotCarriageCornerRadius,
                                      -carriageDepth - (cBotTopHoleDepth - carriageDepth) - .1,
                                      cBotCarriageCornerRadius])
				cube([(cBotCarriageCornerRadius * 2) + .2, (cBotTopHoleDepth - carriageDepth) + .1, .1]);
			   translate([-cBotCarriageCornerRadius,
				      -cBotTopHoleDepth - (cBotTopHoleDepth - carriageDepth) - .1,
                                      -cBotCarriageCornerRadius - cBotTopHoleLength])
				cube([(cBotCarriageCornerRadius * 2) + .2, (cBotTopHoleDepth - carriageDepth) + .1, .1]);
		  }
 	}
     // Create angle portion of top right corner -- NOW BOTTOM -- RBR
     // translate([cBotCarriageWidth - cBotCarriageCornerRadius, 0, cBotCarriageHeight - cBotCarriageCornerRadius])
     translate([cBotCarriageWidth - cBotCarriageCornerRadius, 0, cBotCarriageCornerRadius+cBotTopHoleLength])
	  difference() {
		  hull() {
			   rotate([90,0,0])
				cylinder(r=cBotCarriageCornerRadius, h=cBotTopHoleDepth, $fn=100);
			   translate([0, 0, -cBotTopHoleLength])
				rotate([90,0,0])
				cylinder(r=cBotCarriageCornerRadius, h=cBotTopHoleDepth, $fn=100);
			}		
		  hull() {
			   translate([-cBotCarriageCornerRadius,
                                      -carriageDepth - (cBotTopHoleDepth - carriageDepth) - .1,
                                      cBotCarriageCornerRadius])
				cube([(cBotCarriageCornerRadius * 2) + .2, (cBotTopHoleDepth - carriageDepth) + .1, .1]);
			   translate([-cBotCarriageCornerRadius,
			       	      -cBotTopHoleDepth - (cBotTopHoleDepth - carriageDepth) - .1,
                                      -cBotCarriageCornerRadius - cBotTopHoleLength])
				cube([(cBotCarriageCornerRadius * 2) + .2, (cBotTopHoleDepth - carriageDepth) + .1, .1]);
			}
		}	
}
module cbot_carriage_holes() {
     // Remove the holes for the corners. -- ADJUSTED DEPTHS -- RBR
     // Bottom left.
     translate([cBotCarriageCornerRadius, .1, cBotCarriageCornerRadius])
	  hull() {
	  rotate([90,0,0])
	       cylinder(d=cBotCarriageIdlerScrewDiameter, h=cBotTopHoleDepth + .2, $fn=100);
	  translate([0, 0, cBotTopHoleLength])
	       rotate([90,0,0])
	       cylinder(d=cBotCarriageIdlerScrewDiameter, h=cBotTopHoleDepth + .2, $fn=100);
     }
	  rotate([90, 0, 0])
	  cylinder(d=cBotCarriageIdlerScrewDiameter, h=carriageDepth + .2, $fn=100);

     // Bottom right.
     translate([cBotCarriageWidth - cBotCarriageCornerRadius, .1, cBotCarriageCornerRadius])
	  hull() {
	  rotate([90,0,0])
	       cylinder(d=cBotCarriageIdlerScrewDiameter, h=cBotTopHoleDepth + .2, $fn=100);
	  translate([0, 0, cBotTopHoleLength])
	       rotate([90,0,0])
	       cylinder(d=cBotCarriageIdlerScrewDiameter, h=cBotTopHoleDepth + .2, $fn=100);
     }

     // Top left.
     translate([cBotCarriageCornerRadius, .1, cBotCarriageHeight - cBotCarriageCornerRadius])
	  rotate([90, 0, 0])
	  cylinder(d=cBotCarriageIdlerScrewDiameter, h=carriageDepth + .2, $fn=100);

     // Top right.
     translate([cBotCarriageWidth - cBotCarriageCornerRadius, .1, cBotCarriageHeight - cBotCarriageCornerRadius])
	  rotate([90, 0, 0])
	  cylinder(d=cBotCarriageIdlerScrewDiameter, h=carriageDepth + .2, $fn=100);
}

module cBot_cut_other_holes(heSide=false){
	// Cut out the belt holder and holes.
    // Top belt cutout
     if (heSide == true) {
          translate([-.1 - cBotBeltTopExtend, -cBotBeltDepth, ((cBotCarriageHeight / 2) + cBotBeltTopPos)])
	  cbot_belt_cutout();
     }
     else {
          translate([-.1, -cBotBeltDepth, ((cBotCarriageHeight / 2) + cBotBeltTopPos)])
	  cbot_belt_cutout();
     }

     // Bottom belt cutout
     if (heSide == true) {
         translate([cBotCarriageWidth + .1 + cBotBeltBottomExtend, -cBotBeltDepth, ((cBotCarriageHeight / 2) - cBotBeltBottomPos)])
	  rotate([0, 180, 0])
	  cbot_belt_cutout();
     }
     else {
         translate([cBotCarriageWidth + .1, -cBotBeltDepth, ((cBotCarriageHeight / 2) - cBotBeltBottomPos)])
	  rotate([0, 180, 0])
	  cbot_belt_cutout();
     }

     // Don't cut out fan holes on side with hot end.
     if(heSide == false) {
	  // Cutout mounting holes for the fan mount. This can be easily made repeatable by replace the multipliers with j and i.
	  // Left side
	  translate([cBotCarriageWidth - fanScrewL[0] - (cBotFanMountDistance / 2), -carriageDepth, cBotFanMountPos])
	       rotate([-90,0,0])
	       bolt_hole(cBotBeltScrewDiameter, carriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);
	  // Right side
	  translate([cBotCarriageWidth - fanScrewL[0] + (cBotFanMountDistance / 2), -carriageDepth, cBotFanMountPos])
	       rotate([-90,0,0])
	       bolt_hole(cBotBeltScrewDiameter, carriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);
     }

     if (0) {
     // Carve out some cable tie locations.
     for(j=[cBotCableTieHorizontalDistance : cBotCableTieHorizontalDistance : cBotCarriageWidth - cBotCableTieHorizontalDistance]) {
	  for(i=[0 : 1 : cBotCableTieVerticalCount - 1]) {
	       if(((cBotXAxisSwitch == "keyes" || cBotXAxisSwitch == "yl99") &&
		   (((cBotXAxisSwitchSide == "acc" || cBotXAxisSwitchSide == "both") && heSide == false) ||
		    ((cBotXAxisSwitchSide == "he" || cBotXAxisSwitchSide == "both") && heSide == true)) &&
		  (i == 1 || i == 2) && (j >= (cBotCableTieHorizontalDistance * 3))) ||
		    ( i == 2 && (j == cBotCableTieHorizontalDistance * 2))) {
		    // Don't carve out this cable tie, it is under the switch.
	       } else {
		    translate([ j,
				-8,
				cBotCarriageHeight - cBotCableTieVerticalPos - (cBotCableTieVerticalDistance * i)])
			 cable_tie(3,1.2,4.5);
	       }
	  }
     }
     }

     // Carve out some bolt holes for mounting various things.
     for(j=[0 : 1 : ((cBotCarriageWidth / cBotFanMountDistance) / 2) -2]) {
	  for(i=[1 : 1 : 2]) {
	       // Left side
		translate([(cBotCarriageWidth / 2) - ((cBotFanMountDistance / 2) + (cBotFanMountDistance * j)),
			  -carriageDepth,
			  cBotAccessoryMountPos * i])
		    rotate([-90,0,0])
			if((cBotNumberOfCarriageWheels == "3") && (j==0) && (i==1)){
			//dont make the hole near the centre hole for the wheel.
			} else {
			 bolt_hole(cBotBeltScrewDiameter, carriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);
	       translate([(cBotCarriageWidth / 2) - ((cBotFanMountDistance / 2) + (cBotFanMountDistance * j)),
			  -carriageDepth,
			  cBotCarriageHeight - (cBotAccessoryMountPos * i)])
		    rotate([-90,0,0])
		    bolt_hole(cBotBeltScrewDiameter, carriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);
			}
		   

	       // Right side
	       translate([(cBotCarriageWidth / 2) + ((cBotFanMountDistance / 2) + (cBotFanMountDistance * j)),
			  -carriageDepth,
			  cBotAccessoryMountPos * i])
		    rotate([-90,0,0])
			if((cBotNumberOfCarriageWheels == "3") && (j==0) && (i==1)){
			//dont make the hole near the centre hole for the wheel.
			} else {
		    bolt_hole(cBotBeltScrewDiameter, carriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);
			}
	       if((cBotXAxisSwitch == "keyes") &&  (i >= 2) && (j >= 1))  {
		    // Don't carve out this accessory hole, it is under the switch.
		    } else {
		    translate([(cBotCarriageWidth / 2) + ((cBotFanMountDistance / 2) + (cBotFanMountDistance * j)),
			       -carriageDepth,
			       cBotCarriageHeight - (cBotAccessoryMountPos * i)])
			 rotate([-90,0,0])
			 bolt_hole(cBotBeltScrewDiameter, carriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);
	       }
	  }
     }
     // Carve out a space for the Axis endstop if needed.
     if(cBotXAxisSwitch != "none" &&
	((heSide == true && (cBotXAxisSwitchSide == "he" || cBotXAxisSwitchSide == "both")) ||
	(heSide == false && (cBotXAxisSwitchSide == "acc" || cBotXAxisSwitchSide == "both")))) {
	  // Carve out a space for the switch.
	  translate([cBotCarriageWidth - cBotXAxisSwitchDimensions[0][0] + cBotXAxisSwitchOffset,
		     -(carriageDepth - cBotXAxisSwitchDepth + cBotXAxisSwitchDimensions[0][1]),
		     ((cBotCarriageHeight / 2) - cBotBeltBottomPos + cBotBeltScrewDistance + (cBotBeltScrewNutDiameter / 2))]) {
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
	  }
     }

     // Carve out space for the titan mount, if needed.
     if ((realExtruder == "titan" && heSide == true) || (realExtruder == "titan" && heSide == false && extruderStepper != "pancake")) {
	  translate([(heSide == true ? heAnchorL[0] : cBotCarriageWidth - heAnchorL[0]), - carriageDepth - .01, (cBotCarriageHeight + cBotTitanVertOffset)])
	       translate([(heSide == true ? -(nema17OuterOffset + e3dTitanOffset[0]) : - (nema17OuterOffset - e3dTitanOffset[0])),0,0])
	       cube([(nema17OuterOffset * 2) , carriageDepth + .02, (nema17OuterOffset * 2)]);
     }
}

module cbot_belt_cutout() {
     // Belt cutout
     linear_extrude(height=cBotBeltHeight) {
	  for(i=[0 : cBotBeltToothSpacing : (cBotBeltToothLength - cBotBeltToothSpacing)]) {
	       translate([i +.1, 0, 0])
		    polygon([[-cBotBeltToothHeight, - (cBotBeltToothHeight * 2)],[0, 0],[cBotBeltToothSpacing, - (cBotBeltToothHeight * 2)]]);
	       translate([i + .1 + (cBotBeltToothSpacing / 2), 0, 0])
		    polygon([[-cBotBeltToothHeight, - (cBotBeltToothHeight * 2)],[(cBotBeltToothSpacing / 2), 0], [cBotBeltToothSpacing, - (cBotBeltToothHeight * 2)]]);
	  }
	  
	  translate([cBotBeltToothLength + .1, 0, 0])
	       polygon([[0,0],[(cBotBeltLength - cBotBeltToothLength) + .1,-(carriageDepth - cBotBeltDepth + .1)],[-1,-(carriageDepth - cBotBeltDepth)]]);
     }
     
     translate([-.1, - (carriageDepth - cBotBeltDepth +.1), 0])
	  cube([cBotBeltToothLength, (carriageDepth - cBotBeltDepth - cBotBeltToothHeight) + .1, cBotBeltHeight]);
	  
     // Belt holder mounting holes.
     translate([(cBotBeltToothLength / 2), -(carriageDepth - cBotBeltDepth), -cBotBeltScrewDistance])
	  rotate([-90,0,0])
	  bolt_hole(cBotBeltScrewDiameter, carriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);

     translate([(cBotBeltToothLength / 2), -(carriageDepth - cBotBeltDepth),  cBotBeltHeight + cBotBeltScrewDistance])
	  rotate([-90,0,0])
	  bolt_hole(cBotBeltScrewDiameter, carriageDepth - cBotBeltScrewNutDepth, cBotBeltScrewNutDiameter, cBotBeltScrewNutDepth);
}

module cbot_belt_holder() {
     difference() {
	  // Create the base
	  cbot_belt_holder_base();

	  // Create the holes
	  cbot_belt_holder_holes();
     }
}

module cbot_belt_holder_base() {
     // Create the base object
     translate([cBotBeltHolderCornerRadius, 0, cBotBeltHolderCornerRadius])
	  hull() {
	  // Bottom left
	  rotate([90,0,0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderDepth, $fn=100);

	  // Bottom right
	  translate([cBotBeltToothLength - (cBotBeltHolderCornerRadius * 2), 0, 0])
	       rotate([90,0,0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderDepth, $fn=100);

	  // Top Left
	  translate([0, 0, cBotBeltHolderHeight - (cBotBeltHolderCornerRadius * 2)])
	       rotate([90,0,0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderDepth, $fn=100);

	  // Top right
	  translate([cBotBeltToothLength - (cBotBeltHolderCornerRadius * 2), 0, cBotBeltHolderHeight - (cBotBeltHolderCornerRadius * 2)])
	       rotate([90,0,0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderDepth, $fn=100);
     }

     // Create the nub that holds the belt.
     translate([cBotBeltHolderCornerRadius,
		-cBotBeltHolderDepth + .1,
		(cBotBeltHolderHeight / 2)])
	  hull() {
	  // Bottom left
	  translate([0, 0, - (cBotBeltHolderNubHeight / 2) + cBotBeltHolderCornerRadius])
	       rotate([90, 0, 0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderNubDepth + .1, $fn=100);
		    
	  // Bottom right
	  translate([cBotBeltToothLength - (cBotBeltHolderCornerRadius * 2), 0, - (cBotBeltHolderNubHeight / 2) + cBotBeltHolderCornerRadius])
	       rotate([90, 0, 0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderNubDepth + .1, $fn=100);
		    
	  // Top left
	  translate([0, 0, (cBotBeltHolderNubHeight / 2) - cBotBeltHolderCornerRadius])
	       rotate([90, 0, 0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderNubDepth + .1, $fn=100);
		    
	  // Top right
	  translate([cBotBeltToothLength - (cBotBeltHolderCornerRadius * 2), 0, (cBotBeltHolderNubHeight / 2) - cBotBeltHolderCornerRadius])
	       rotate([90, 0, 0])
	       cylinder(r=cBotBeltHolderCornerRadius, h=cBotBeltHolderNubDepth + .1, $fn=100);
     }
}

module cbot_belt_holder_holes() {
     // Belt holder mounting holes.
     translate([(cBotBeltToothLength / 2),
		+.1,
		(cBotBeltHolderHeight / 2) - ((cBotBeltHeight / 2) + cBotBeltScrewDistance)])
	  rotate([90,0,0])
	  cylinder(d=cBotBeltScrewDiameter, h=cBotBeltHolderDepth + .2, $fn=100);
     
     translate([(cBotBeltToothLength / 2),
		+.1,
		(cBotBeltHolderHeight / 2) + ((cBotBeltHeight / 2) + cBotBeltScrewDistance)])
	  rotate([90,0,0])
	  cylinder(d=cBotBeltScrewDiameter, h=cBotBeltHolderDepth + .2, $fn=100);
}

module cbot_x_bumper() {
     // Small bumper for the carriage mounted X Axis Switch.
     difference() {
	  cube([cBotXBumperWidth, cBotXBumperDepth, cBotXBumperHeight]);
	  
	  translate([cBotXBumperHolePos[0], cBotXBumperDepth + .1, cBotXBumperHolePos[1]])
	       rotate([90,0,0])
	       cylinder(d=cBotCarriageIdlerScrewDiameter, h=cBotXBumperDepth + .2, $fn=100);
     }
}

module e3d_titan_mount() {
     // This creates the mount for the E3D Titan extruder.
     // First create a large cube that is built to the size of the Nema 17 plus e3dTitanMountMat.
     // Then remove the center portion where the Nema 17 will mount and recreate that portion to the specs
     // for the Nema 17.
     // Move everything around so position point is X - center of filament path, Y - face of mount on Titan side.
     translate([-(nema17OuterOffset + e3dTitanOffset[0] + e3dTitanMountMat),0,-1])
	  difference() {
	  hull() {
	       // Lower left corner
	       translate([0, 0, 0])
		    cube([1, (carriageDepth + heDepthOffset), 1]);
	       
	       // Upper left corner
	       translate([e3dTitanMountCornerRadius,
			  0,
			  (nema17OuterOffset * 2) - e3dTitanMountCornerRadius + 1]) 
		    rotate([-90,0,0])
		    cylinder(r=e3dTitanMountCornerRadius, h=(carriageDepth + heDepthOffset), $fn=100);
	       
	       // Lower right corner
	       translate([((nema17OuterOffset * 2) + (e3dTitanMountMat * 2)) + e3dTitanFilamentSideBodyOffset - 1, 0, 0])
		    cube([1, (carriageDepth + heDepthOffset), 1]);
	       
	       // Upper right corner
	       translate([(nema17OuterOffset * 2) + (e3dTitanMountMat * 2) + e3dTitanFilamentSideBodyOffset - e3dTitanMountCornerRadius,
			  0,
			  (nema17OuterOffset * 2) - e3dTitanMountCornerRadius + 1])
		    rotate([-90,0,0])
		    cylinder(r=e3dTitanMountCornerRadius, h=(carriageDepth + heDepthOffset), $fn=100);
	  }
     
	  // Now remove the center where the titan and Nema 17 will be.
	  translate([e3dTitanMountMat, -.1, 5])
	       cube([(nema17OuterOffset * 2) + e3dTitanFilamentSideBodyOffset, (carriageDepth + .2), (nema17OuterOffset * 2)]);
     }
     
     // Create the bracing.
     translate([-(nema17OuterOffset + e3dTitanOffset[0] + e3dTitanMountMat),0,-.01]) {
	  // Left side brace
	  hull() {
	       // Lower left base.
	       translate([0, 0, -1* e3dTitanMountLowerOverlap])
		    cube([e3dTitanMountBraceWidth, .01, .01]);
	       
	       // Lower left raised.
	       translate([0, -e3dTitanMountBraceHeight + 3,  -1* e3dTitanMountLowerOverlap + 5])
		    rotate([0,90,0])
		    cylinder(r=1.5, h=e3dTitanMountBraceWidth, $fn=100);
	       
	       // Upper left base.
	       translate([0,0,(nema17OuterOffset * 2) - e3dTitanMountCornerRadius - .5])
		    cube([e3dTitanMountBraceWidth, .01, .01]);
	       
	       // Upper left raised.
	       translate([0, -e3dTitanMountBraceHeight + 3, (nema17OuterOffset * 2) - e3dTitanMountCornerRadius - 5.5])
		    rotate([0,90,0])
		    cylinder(r=1.5, h=e3dTitanMountBraceWidth, $fn=100);
	  }

	  // Right side brace
	  hull() {
	       // Lower right base.
	       translate([(nema17OuterOffset * 2) + (e3dTitanMountMat * 2) + e3dTitanFilamentSideBodyOffset - e3dTitanMountBraceWidth,
			  0,-1* e3dTitanMountLowerOverlap])
		    cube([e3dTitanMountBraceWidth, .01, .01]);
	       
	       // Lower right raised.
	       translate([(nema17OuterOffset * 2) + (e3dTitanMountMat * 2) + e3dTitanFilamentSideBodyOffset - e3dTitanMountBraceWidth,
			  -e3dTitanMountBraceHeight + 3, -1* e3dTitanMountLowerOverlap + 5])
		    rotate([0,90,0])
		    cylinder(r=1.5, h=e3dTitanMountBraceWidth, $fn=100);
	       
	       // Upper right base.
	       translate([(nema17OuterOffset * 2) + (e3dTitanMountMat * 2) + e3dTitanFilamentSideBodyOffset - e3dTitanMountBraceWidth,
			  0,(nema17OuterOffset * 2) - e3dTitanMountCornerRadius - .5])
		    cube([e3dTitanMountBraceWidth, .01, .01]);
	       
	       // Upper right raised.
	       translate([(nema17OuterOffset * 2) + (e3dTitanMountMat * 2) + e3dTitanFilamentSideBodyOffset - e3dTitanMountBraceWidth,
			  -e3dTitanMountBraceHeight + 3, (nema17OuterOffset * 2) - e3dTitanMountCornerRadius - 5.5])
		    rotate([0,90,0])
		    cylinder(r=1.5, h=e3dTitanMountBraceWidth, $fn=100);
	  }
     }

     // Create the face the Titan and Nema 17 will attach to.
     difference() {
	  translate([-(nema17OuterOffset + e3dTitanOffset[0] + .01), carriageDepth - e3dTitanMountThickness , 0])
	       cube([(nema17OuterOffset * 2) + e3dTitanFilamentSideBodyOffset + .02, e3dTitanMountThickness, (nema17OuterOffset * 2) + .02]);

	  // Carve out the holes for the Nema 17 mount.
	  // First position ourselves in the center of the face. All other offsets
	  // are from center of Nema 17 output shaft.
	  translate([-e3dTitanOffset[0], carriageDepth - e3dTitanMountThickness, nema17OuterOffset]) {
	       for (i= nema17MountHoleLocs) {
		    translate([i[0],-.1,i[1]]) {
			 rotate([-90,0,0])
			      cylinder(d=nema17MountHoleDiameter, h=(e3dTitanMountThickness + .2), $fn=200);
		    }
	       }
	       
	       // Carve out the center for the Nema 17 shaft and center raised portion.
	       translate([0,-.1,0])
		    rotate([-90,-.1,0])
		    cylinder(d=nema17CenterDiameter, h=(e3dTitanMountThickness + .2), $fn=200);
		    }
     }     
}

module bltouch_mount(carriageDepth,cbot=false) {
     // Create the mounting back plate.
     difference() {
	  hull() {
	       // Induct mount top right corner.
	       translate([ probeMountWidth - (probeBraceWidth / 2) - blPlateOuterRadius,
			   -(probeMountBracketed == 0 ? 0 : probeBracketDepth),
			   cbot == true ? -(heAnchorL[2] + heNozzleL[0][2] + probePlateHeight) + (cBotAccessoryMountPos * 2) + (probeBraceWidth / 2) :
			   probePlateThickness + probeBraceHeight - (probeBraceWidth / 2)])
		    rotate([-90,0,0])
		    cylinder(d=probeBraceWidth, h=(probeMountBracketed == 0 ? carriageDepth : probeBracketDepth), $fn=100);
	       
	       // Induct mount top left corner.
	       translate([ (probeBraceWidth / 2) + blPlateOuterRadius,
			   -(probeMountBracketed == 0 ? 0 : probeBracketDepth),
			   cbot == true ? -(heAnchorL[2] + heNozzleL[0][2] + probePlateHeight) + (cBotAccessoryMountPos * 2) + (probeBraceWidth / 2) :
			   probePlateThickness + probeBraceHeight - (probeBraceWidth / 2)])
		    rotate([-90,0,0])
		    cylinder(d=probeBraceWidth, h=(probeMountBracketed == 0 ? carriageDepth : probeBracketDepth), $fn=100);
	       
	       // Induct bracket bottom right corner.
	       translate([ probeMountWidth - (probeBraceWidth / 2) - blPlateOuterRadius,
			   -(probeMountBracketed == 0 ? 0 : probeBracketDepth),
			   (probePlateThickness / 2)])
		    rotate([-90,0,0])
		    cylinder(d=probePlateThickness, h=(probeMountBracketed == 0 ? carriageDepth : probeBracketDepth), $fn=100);
	       
	       // Induct bracket bottom left corner.
	       translate([ (probeBraceWidth / 2) + blPlateOuterRadius,
			   -(probeMountBracketed == 0 ? 0 : probeBracketDepth),
			   (probePlateThickness / 2)])
		    rotate([-90,0,0])
		    cylinder(d=probePlateThickness, h=(probeMountBracketed == 0 ? carriageDepth : probeBracketDepth), $fn=100);
	  }

	  // Create the mounting holes if needed.
	  if (probeMountBracketed == 1) {
	       // Create the mounting screw holes in the bracket and X Carriage back plane.
	       translate([(probeMountWidth / 2),
			  - (probeBracketDepth + .1),
			  cbot == true ? -(heAnchorL[2] + heNozzleL[0][2] + probePlateHeight) + cBotAccessoryMountPos :
			  probePlateThickness + (probeBracketScrewDiameter * 1.5)])
		    rotate([-90,0,0])
		    cylinder(d=(cbot == true ? cBotBeltScrewDiameter : probeBracketScrewDiameter), h=probeBracketDepth + .2, $fn=100);
	       
	       translate([(probeMountWidth / 2),
			  - (probeBracketDepth + .1),
			  cbot == true ? -(heAnchorL[2] + heNozzleL[0][2] + probePlateHeight) + (cBotAccessoryMountPos * 2) :
			  probePlateThickness + probeBraceHeight - (probeBracketScrewDiameter * 1.5)])
		    rotate([-90,0,0])
		    cylinder(d=(cbot == true ? cBotBeltScrewDiameter : probeBracketScrewDiameter), h=probeBracketDepth + .2, $fn=100);
	  }
     }
     
     // Create mounting plate
     translate([ (probeMountWidth / 2),
		 -((blPlateRectDimensions[1] / 2) + ( probeMountBracketed == 0 ? 0 : probeBracketDepth) + probeOffset),
		 0])
     difference() {
	  hull() {
	       // Create the mounting plate
	       translate([-(probeMountWidth / 2) + (probeBraceWidth / 2) + blPlateOuterRadius,
			  (blPlateRectDimensions[1] / 2) + probeOffset,
			  (probePlateThickness / 2)])
		    sphere(d=probePlateThickness, $fn=100);

	       translate([(probeMountWidth / 2) - (probeBraceWidth / 2) - blPlateOuterRadius,
			  (blPlateRectDimensions[1] / 2) + probeOffset,
			  (probePlateThickness / 2)])
		    sphere(d=probePlateThickness, $fn=100);
	       
	       translate([-(blPlateRectDimensions[0] / 2), -(blPlateRectDimensions[1] / 2), 0])
		    cube([blPlateRectDimensions[0], blPlateRectDimensions[1], probePlateThickness]);
	       
	       translate([- blPlateInnerDistance, 0, 0])
		    cylinder(r=blPlateOuterRadius, h=probePlateThickness, $fn=100);
	       
	       translate([blPlateInnerDistance, 0, 0])
		    cylinder(r=blPlateOuterRadius, h=probePlateThickness, $fn=100);
	  }

	  // Cut out the center hole
	  translate([0, 0, -.1])
	       cylinder(d=blPlateCenterDiameter, h=(probePlateThickness + .2), $fn=100);

	  // Cut out the outer holes
	  translate([- blPlateInnerDistance, 0, -.1])
	       cylinder(d=blPlateInnerDiameter, h=(probePlateThickness + .2), $fn=100);
	  
	  translate([blPlateInnerDistance, 0, -.1])
	       cylinder(d=blPlateInnerDiameter, h=(probePlateThickness + .2), $fn=100);
     }
     
     // Create braces
     hull() {
	  // Probe mount top right corner.
	       translate([ (probeMountWidth /2) + (blPlateInnerDistance / 2),
		      -(probeMountBracketed == 0 ? 0 : probeBracketDepth),
			   cbot == true ? -(heAnchorL[2] + heNozzleL[0][2] + probePlateHeight) + (cBotAccessoryMountPos * 2) + (probeBraceWidth / 2) :
			   probePlateThickness + probeBraceHeight - (probeBraceWidth / 2)])
	       rotate([-90,0,0])
	       sphere(d=probeBraceWidth, $fn=100);
	  
	  // Probe mount bottom right corner and forward point.
	  hull() {
	       // Forward point
	       translate([ (probeMountWidth /2) + (blPlateInnerDistance / 2),
			   -(probeMountBracketed == 0 ? 0 : probeBracketDepth) - ((blPlateRectDimensions[1] / 2) + probeOffset),
			   (probeBraceWidth / 2)])
		    sphere(d=probeBraceWidth, $fn=100);

	       // Rear point
	       translate([ (probeMountWidth /2) + (blPlateInnerDistance / 2),
				-(probeMountBracketed == 0 ? 0 : probeBracketDepth),
			   (probeBraceWidth / 2)])
		    rotate([-90,0,0])
		    cylinder(d=probeBraceWidth, h=(probeMountBracketed == 0 ? carriageDepth : probeBracketDepth), $fn=100);
	  }
     }
     
     // Probe mount top left corner.
     hull() {
	       translate([ (probeMountWidth /2) - (blPlateInnerDistance / 2),
		      -(probeMountBracketed == 0 ? 0 : probeBracketDepth),
			   cbot == true ? -(heAnchorL[2] + heNozzleL[0][2] + probePlateHeight) + (cBotAccessoryMountPos * 2) + (probeBraceWidth / 2) :
			   probePlateThickness + probeBraceHeight - (probeBraceWidth / 2)])
	       rotate([-90,0,0])
	       sphere(d=probeBraceWidth, $fn=100);
	  
	  // Probe mount bottom left corner and forward point.
	  hull() {
	       // Forward point
	       translate([ (probeMountWidth /2) - (blPlateInnerDistance / 2),
			   -(probeMountBracketed == 0 ? 0 : probeBracketDepth) - ((blPlateRectDimensions[1] / 2) + probeOffset),
			   (probeBraceWidth / 2)])
		    sphere(d=probeBraceWidth, $fn=100);
	       // Rear point
	       translate([ (probeMountWidth /2) - (blPlateInnerDistance / 2),
			   -(probeMountBracketed == 0 ? 0 : probeBracketDepth),
			   (probeBraceWidth / 2)])
		    rotate([-90,0,0])
		    cylinder(d=probeBraceWidth, h=(probeMountBracketed == 0 ? carriageDepth : probeBracketDepth), $fn=100);
	  }
     }
}

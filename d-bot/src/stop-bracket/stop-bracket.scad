$fn=30;

myBoltLen=20;
myBackHeight=43;
myTopWidth=18;
myBackOffset=-15; // originally -20

% translate([-9.5,42.5,-24.75]) import("./Motor_Stop_Bracket_v2_Motor_Stop_Bracket_v2_Body1_.stl");

if (1) difference() {
   union() {
      translate([-9.5,-9.5,0]) {
         cube([50,50,5]);
         cube([50,myBackOffset+25,myBackHeight]);
         translate([0,myBackOffset+20-myTopWidth,myBackHeight-5]) cube([50,myTopWidth,5]);
         side();
         translate([45,0,0]) side();
         translate([45/2,0,0]) middle();
      }
      translate([0,0,0]) boltHole();
      translate([31,0,0]) rotate([0,0,180]) boltHole();
      translate([31,31,0]) rotate([0,0,180]) boltHole();
      translate([0,31,0]) boltHole();
   }
      cutouts();
}


module side(frontHeight=8,backHeight=myBackHeight) {
   translate([5,50,0]) rotate([90,0,-90])
   linear_extrude(height=5) polygon(points=[[0,0],[0,frontHeight],
                                       [25-myBackOffset,backHeight], [30+myTopWidth-myBackOffset,backHeight],
                                       [30+myTopWidth-myBackOffset,backHeight-5],
 				       // [30-myBackOffset,backHeight-25],
                                       [30-myBackOffset,0]]);
}

module middle(frontHeight=8,backHeight=40) {
   translate([5,50,0]) rotate([90,0,-90])
   linear_extrude(height=5) polygon(points=[[25-myBackOffset,0],[25-myBackOffset,frontHeight],
                                       [27-myBackOffset,backHeight], [30+myTopWidth-myBackOffset,backHeight],
                                       [30+myTopWidth-myBackOffset,backHeight-5],
				      // [30-myBackOffset,backHeight-25],
                                       [30-myBackOffset,0]]);
}

module boltHole(boltLen=myBoltLen) {
   translate([0,0,0]) cylinder(d=8,h=boltLen-8);
   translate([-6,-8/2,0]) cube([6,8,boltLen-8]);
}


module cutouts() {
   translate([0,0,-0.5]) cylinder(d=3.3,h=30);
   translate([31,0,-0.5]) cylinder(d=3.3,h=30);
   translate([31,31,-0.50]) cylinder(d=3.3,h=30);
   translate([0,31,-0.50]) cylinder(d=3.3,h=30);

   /* cutouts for screws, in case sides/back overlap */
   translate([0,0,myBoltLen-8]) cylinder(d=8,h=60); // 8mm clearance for washer
   translate([31,0,myBoltLen-8]) cylinder(d=8,h=60);

   translate([15.5,15.5,-0.50]) cylinder($fn=120,d=35.5,h=80);
   translate([5.5,25,-0.50]) cube([20,20,30]);
}

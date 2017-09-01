$fn=30;

myBoltLen=20;
myBackHeight=40;

// translate([-9.5,42.5,-24.75]) import("./Motor_Stop_Bracket_v2_Motor_Stop_Bracket_v2_Body1_.stl");

difference() {
   union() {
      translate([-9.5,-9.5,0]) {
         cube([50,50,5]);
         cube([50,5,myBackHeight]);
         translate([0,-20,myBackHeight-5]) cube([50,20,5]);
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
                                       [45,backHeight], [70,backHeight],
                                       [70,backHeight-5],[50,backHeight-25],
                                       [50,0]]);
}

module middle(frontHeight=8,backHeight=40) {
   translate([5,50,0]) rotate([90,0,-90])
   linear_extrude(height=5) polygon(points=[[45,0],[45,frontHeight],
                                       [47,backHeight], [70,backHeight],
                                       [70,backHeight-5],[50,backHeight-25],
                                       [50,0]]);
}

module boltHole(boltLen=myBoltLen) {
   translate([0,0,0]) cylinder(d=7,h=boltLen-8);
   translate([-7,-7/2,0]) cube([7,7,boltLen-8]);
}

module cutouts() {
   translate([0,0,-0.5]) cylinder(d=3.2,h=30);
   translate([31,0,-0.5]) cylinder(d=3.2,h=30);
   translate([31,31,-0.50]) cylinder(d=3.2,h=30);
   translate([0,31,-0.50]) cylinder(d=3.2,h=30);

   translate([15.5,15.5,-0.50]) cylinder($fn=120,d=35.5,h=30);
   translate([5.5,25,-0.50]) cube([20,20,30]);
}

mountSideHt = 30;
sensorSideHt = 54;
holeSpacing = 46;
drop = 10;

$fn=40;

// % original();


module original() {
   difference() {
      translate([0,-1.5,0]) cube([20,3,mountSideHt]);
      translate([13,3, mountSideHt - 5]) rotate([90,0,0]) cylinder(d=3.2,h=10);
      translate([13,3, 5]) rotate([90,0,0]) cylinder(d=3.2,h=10);
   }
   rotate([0,0,50]) translate([-40,-1.5,0]) difference() {
      cube([40,3,sensorSideHt]);
      translate([20,-1,mountSideHt]) cube([21,5,sensorSideHt-mountSideHt+1]);
      translate([10,4, (sensorSideHt - holeSpacing)/2]) rotate([90,0,0]) cylinder(d=2.4,h=10);
      translate([10,4, holeSpacing + (sensorSideHt - holeSpacing)/2]) rotate([90,0,0]) cylinder(d=2.4,h=10);
      }
   cylinder(d=3,h=mountSideHt);
}

difference() {
   translate([-1.5,-1.5,0]) cube([21.5,3,mountSideHt]);
   translate([13,3, mountSideHt - 5]) rotate([90,0,0]) cylinder(d=3.2,h=10);
   translate([13,3, 5]) rotate([90,0,0]) cylinder(d=3.2,h=10);
}
translate([-3,-1*drop,0]) cube([3,drop,mountSideHt]);
translate([-1.5,0,0]) cylinder(d=3,h=mountSideHt);
translate([-1.5,-1*drop,0]) cylinder(d=3,h=mountSideHt);
translate([-1.5,-1*drop+0.0,0]) rotate([0,0,50]) translate([-40,-1.5,0]) difference() {
   cube([40,3,sensorSideHt]);
   translate([20,-1,mountSideHt]) cube([21,5,sensorSideHt-mountSideHt+1]);
   translate([10,4, (sensorSideHt - holeSpacing)/2]) rotate([90,0,0]) cylinder(d=2.4,h=10);
   translate([10,4, holeSpacing + (sensorSideHt - holeSpacing)/2]) rotate([90,0,0]) cylinder(d=2.4,h=10);
   }
cylinder(d=3,h=mountSideHt);


mountSideHt = 30;
sensorSideHt = 54;
holeSpacing = 46;

$fn=40;

difference() {
   translate([0,-1,0]) cube([20,2,mountSideHt]);
   translate([10,3, mountSideHt - 5]) rotate([90,0,0]) cylinder(d=3.2,h=10);
   translate([10,3, 5]) rotate([90,0,0]) cylinder(d=3.2,h=10);
}
rotate([0,0,45]) translate([-20,-1,0]) difference() {
   cube([20,2,sensorSideHt]);
   translate([10,3, (sensorSideHt - holeSpacing)/2]) rotate([90,0,0]) cylinder(d=2.4,h=10);
   translate([10,3, holeSpacing + (sensorSideHt - holeSpacing)/2]) rotate([90,0,0]) cylinder(d=2.4,h=10);
   }
cylinder(d=2,h=sensorSideHt);


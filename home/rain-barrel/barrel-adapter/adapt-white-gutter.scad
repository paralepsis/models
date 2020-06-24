// 1.75" hole (44mm)
$fn=60;

difference() {
   union() {
      translate([0,0,8]) scale([1.3,1,1]) cylinder(d=60,h=4.05);
      translate([0,0,0]) cylinder(d=43.5,h=30);
   }
   translate([0,0,12]) cylinder(d=36.4,h=31);
   translate([0,0,7.95]) cylinder(d=30,h=31);
   translate([0,0,-0.05]) cylinder(d2=30,d1=36.2,h=8.05);
}



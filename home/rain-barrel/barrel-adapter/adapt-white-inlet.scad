// 1.75" hole (44mm)
$fn=60;

difference() {
   scale([1.3,1,1]) cylinder(d=57,h=4.05);
   translate([0,0,-0.05]) cylinder(d=30,h=4.2);
   translate([30,0,-0.05]) cylinder(d=2,h=4.2);
   translate([-30,0,-0.05]) cylinder(d=2,h=4.2);
}

translate([0,0,4]) difference() {
   translate([0,0,0]) cylinder(d=43.5,h=20);
   translate([0,0,-0.05]) cylinder(d=36.4,h=21);
}


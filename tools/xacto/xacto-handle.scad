$fn=60;

rotate([0,-90,0]) difference() {
   cylinder($fn=5,h=100,d=13);
   translate([0,0,-0.5]) cylinder(h=101,d=7.5);
}

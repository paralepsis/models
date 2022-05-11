len = 130;
$fn=40;

difference() {
   form();

   translate([len/2-10,12,-1]) cylinder(d=4.5,h=10);
   translate([-len/2+10,12,-1]) cylinder(d=4.5,h=10);

   translate([len/2-10,12,3.5]) cylinder($fn=6,d=8.75,h=4);
   translate([-len/2+10,12,3.5]) cylinder($fn=6,d=8.75,h=4);

   translate([-140,-140,-5]) cube([280,280,5]);
}


module form() {
   hull() {
      translate([-len/2,0,0]) cube([len, 5,7]);
      translate([len/2-5,15,0]) cylinder(r=5,h=7);
      translate([-len/2+5,15,0]) cylinder(r=5,h=7);
   }
   translate([0,4.6,-0.3]) rotate([87,0,0]) hull() {
      translate([-len/2,0,0]) cube([len, 5,5]);
      translate([len/2-5,15,0]) cylinder(r=5,h=5);
      translate([-len/2+5,15,0]) cylinder(r=5,h=5);
   }
}

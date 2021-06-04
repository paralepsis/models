height=30;
$fn=30;

translate([0,0,3]) rotate([-90,0,0]) body();

module body(hole=2) {
   width=70;
   length=3;
   rad=0.1;

   difference() {
      hull() {
         translate([0+rad,0+rad,0]) cylinder(r=rad,h=height);
         translate([width-rad,0+rad,0]) cylinder(r=rad,h=height);
         translate([width-rad,length-rad,0]) cylinder(r=rad,h=height);
         translate([0+rad,length-rad,0]) cylinder(r=rad,h=height);
      }

      /* heat set inserts */
      translate([8,-0.1,5]) rotate([-90,0,0]) cylinder (d=hole, h=6.9);
      translate([8,-0.1,height-5]) rotate([-90,0,0]) cylinder (d=hole, h=6.9);
      translate([width-8,-0.1,5]) rotate([-90,0,0]) cylinder (d=hole, h=6.9);
      translate([width-8,-0.1,height-5]) rotate([-90,0,0]) cylinder (d=hole, h=6.9);
   }
}

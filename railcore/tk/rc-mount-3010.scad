$fn=80;

if (1) difference() {
   union() {
      horizontal_form();
      vertical_form();

      if (1) translate([1.5+5.5,0,-5.4]) rotate([0,-90,0]) difference() {
         fan_mount();
         translate([0,0,-8]) rotate([0,15,0]) cube([60,60,20],center=true);
      }
   }
   cutouts();
}


/* fan_mount()
 *
 * fd - fan diameter
 * cd - corner diameter
 * id - inside cutout diameter
 * sd - screw hole diameter
 * in - inset of screw holes from center of corner "circle"
 */
// module fan_mount(fd=28,cd=5,id=23.5,sd=2.5, in=1.5) {
module fan_mount(fd=30,cd=5,id=27.5,sd=2.5, in=0) {
   ht=20;

   difference() {
      hull() {
         translate([-(fd-cd)/2,-(fd-cd)/2,0]) cylinder(d=cd,h=ht);
         translate([(fd-cd)/2,-(fd-cd)/2,0]) cylinder(d=cd,h=ht);
         translate([-(fd-cd)/2,(fd-cd)/2,0]) cylinder(d=cd,h=ht);
         translate([(fd-cd)/2,(fd-cd)/2,0]) cylinder(d=cd,h=ht);
      }
      translate([0,0,-0.5]) cylinder(d=26,h=ht-3+0.6);
      translate([0,0,ht-3]) cylinder(d2=id,d1=26,3.1);

      translate([-(fd-cd)/2+in,-(fd-cd)/2+in,ht-8-0.5]) cylinder(d=sd,h=ht+1);
      translate([(fd-cd)/2-in,-(fd-cd)/2+in,ht-8-0.5]) cylinder(d=sd,h=ht+1);
      translate([-(fd-cd)/2+in,(fd-cd)/2-in,ht-8-0.5]) cylinder(d=sd,h=ht+1);
      translate([(fd-cd)/2-in,(fd-cd)/2-in,ht-8-0.5]) cylinder(d=sd,h=ht+1);
   }
}

module vertical_form() {
   hull() {
      translate([13.89,0,25.35]) rotate([0,90,0]) cylinder(d=7.8,h=3.51);
      translate([13.39,0,25.35]) rotate([0,90,0]) cylinder(d=6.8,h=4.01);

      translate([13.89,7.5,3.5]) rotate([0,90,0]) cylinder(d=7.8,h=3.51);
      translate([13.39,7.5,3.5]) rotate([0,90,0]) cylinder(d=6.8,h=4.01);

      translate([13.89,-7.5,3.5]) rotate([0,90,0]) cylinder(d=7.8,h=3.51);
      translate([13.39,-7.5,3.5]) rotate([0,90,0]) cylinder(d=6.8,h=4.01);

      translate([13.39+3/2+.25+.5,0,5.55+4.1/2]) cube([3.5,24,4.1],center=true);
      translate([13.39+4/2,0,5.55+4.1/2]) cube([4,23,4.1],center=true);
   }

   // bevels
   difference() {
      translate([13.5,0,5.1+5/2]) cube([4.5,20,10],center=true);
      translate([10.9,0,2.6]) rotate([90,0,0]) translate([0,0,-15]) cylinder(d=5,h=30);
      translate([10.9,0,12.6]) rotate([90,0,0]) translate([0,0,-15]) cylinder(d=5,h=30);
   }
}

module cutouts() {
   // center hole
   cylinder(d=4.5,h=41);
   translate([0,0,5.075]) cylinder(d1=5.5,d2=4.5,h=.5);
   translate([0,0,9.61]) cylinder(d2=5.5,d1=4.5,h=.5);

   // TK body
   translate([0,0,-40+5.1]) cylinder(d=26,h=40);
   translate([0,-13,-30+5.1]) cube([11,26,30]);

   // cut bottom out of fan mount?
   translate([-18,-5,-22]) cube([10,10,10]);

   // cut out corner for heater wiring
   translate([-8,10,-22]) cube([20,10,10]);

   translate([-13,0,-5.4]) rotate([0,90,0]) cylinder(d1=27.5,d2=22,h=3);

   // hotend mounting holes
   for (i=[0:3]) {
      rotate([0,0,i*90+45]) translate([8,0,0]) cylinder(d=3.4,h=11);
      rotate([0,0,i*90+45]) translate([8,0,5.075]) cylinder(d1=4.5,d2=3.4,h=0.5);
   }

  // mount to toolhead
  translate([10,0,25.35]) rotate([0,90,0]) cylinder(d=3.4,h=8);
  translate([10,-7.5,3.5]) rotate([0,90,0]) cylinder(d=3.4,h=8); // 7.6?
  translate([10,7.5,3.5]) rotate([0,90,0]) cylinder(d=3.4,h=8);
  translate([9,-7.5,3.5]) rotate([0,90,0]) cylinder(d=6.0,h=4.39);
  translate([9,7.5,3.5]) rotate([0,90,0]) cylinder(d=6.0,h=4.39);
}


module horizontal_form() {
   hull() {
      translate([0,0,5.55]) cylinder(d=26,h=4.1);
      translate([0,0,5.1]) cylinder(d=25,h=5.0);
      translate([14.9,0,5.55+4.1/2]) cube([5,24,4.1],center=true);
      translate([14.9,0,5.1+5/2]) cube([5,23,5],center=true);
   }
}

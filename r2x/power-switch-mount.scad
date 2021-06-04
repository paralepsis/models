height=30;
$fn=30;

body();

module cutout() {
   width=48;
   length=28;
   rad=0.25;

   hull() {
      translate([0+rad,0+rad,-1]) cylinder(r=rad,h=height+2);
      translate([0+rad,length-rad,-1]) cylinder(r=rad,h=height+2);
      translate([width-rad,0+rad,-1]) cylinder(r=rad,h=height+2);
      translate([width-rad,length-rad,-1]) cylinder(r=rad,h=height+2);
   }
}

module body() {
   width=70;
   length=50;
   rad=2;

   difference() {
      hull() {
         translate([0+rad,0+rad,0]) cylinder(r=rad,h=height);
         translate([width-rad,0+rad,0]) cylinder(r=rad,h=height);
         translate([width-rad,length-rad,0]) cylinder(r=rad,h=height);
         translate([0+rad,length-rad,0]) cylinder(r=rad,h=height);
      }
      translate([(width-48)/2,(length-28)/2,0]) cutout();

      /* heat set inserts */
      translate([8,-0.1,5]) rotate([-90,0,0]) cylinder (d=5.2, h=6.9);
      translate([8,-0.1,height-5]) rotate([-90,0,0]) cylinder (d=5.2, h=6.9);
      translate([width-8,-0.1,5]) rotate([-90,0,0]) cylinder (d=5.2, h=6.9);
      translate([width-8,-0.1,height-5]) rotate([-90,0,0]) cylinder (d=5.2, h=6.9);

      /* screw holes */
      translate([width/2-0.5,5,height-6.8]) cylinder (d=5.2, h=6.9);
      translate([width/2-0.5,length-5,height-6.8]) cylinder (d=5.2, h=6.9);
      // translate([width/2-0.5,5,height-6.8]) cylinder (d=3.2, h=6.9);
      // translate([width/2-0.5,length-5,height-6.8]) cylinder (d=3.2, h=6.9);
   }
}

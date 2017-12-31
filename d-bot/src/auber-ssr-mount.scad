// M2.5 x 20mm cap head bolts will clamp,
// M5 x 8mm bolts to mount.

$fn=80;

// 4.8 mm deep hole for using an 8mm bolt

length=81;
width=50.5;
height=25;

bottom();
translate([length+3.5,-10.5,15]) rotate([0,-90,0]) side();


module bottom() {
   difference() {
      translate([-2.5,-2.5,0]) union() /* starting form */ {
         hull() {
            translate([0+3,width+2,0]) cylinder(r=4,h=10);
            translate([length+2, width+2,0]) cylinder(r=4,h=10);
            translate([0,0,0]) cylinder(r=1,h=10);
            translate([length+5, 0, 0]) cylinder(r=1,h=10);
         }
      }
      union() /* to remove */ {
         translate([0,0,5.7]) cube([length, width, height]);

         /* two interior cutouts through bottom */
         translate([8,10,-0.1]) hull() {
            translate([6,width-20,0]) cylinder(r=2,h=10);
            translate([length/2-14, width-20,0]) cylinder(r=2,h=10);
            translate([6,0,0]) cylinder(r=2,h=10);
            translate([length/2-14, 0, 0]) cylinder(r=2,h=10);
         }
         translate([8,10,-0.10]) hull() {
            translate([length/2-2,width-20,0]) cylinder(r=2,h=10);
            translate([length-16-6, width-20,0]) cylinder(r=2,h=10);
            translate([length/2-2,0,0]) cylinder(r=2,h=10);
            translate([length-16-6, 0, 0]) cylinder(r=2,h=10);
         }

         /* nuts and bolt holes for holding sink to base */
         translate([4.5,width/2,0]) cylinder($fn=6,d=9.5,h=4.0);
         translate([4.5,width/2,4.5]) cylinder(d=5.2,h=4.5);
         translate([length-4.5,width/2,0]) cylinder($fn=6,d=9.5,h=4.0);
         translate([length-4.5,width/2,4.5]) cylinder(d=5.2,h=4.5);

         if (0) translate([0,0,1]) scale([1,1,1.2]) hull() {
            translate([-5,width-5,5+3]) rotate([0,90,0]) cylinder(h=length+10, r=5);
            translate([-5,5,5+3]) rotate([0,90,0]) cylinder(h=length+10, r=5);
         }
      } /* end of stuff to remove */
   }
}


module side() {
   difference() {
      union() {
         translate([-15,0,0]) cube([27,10,length+7]);
         translate([7,0,0]) rotate([0,0,180])
            linear_extrude(height=length+7)
            polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
      }
   
      translate([3,0,0]) bolts();
   }
}

module bolts() {
   union() {
         /* bolt holes */
         translate([-0.5,12,8]) rotate([90,0,0]) cylinder(h=15,d=5.2);
         translate([-0.5,12,length-2]) rotate([90,0,0]) cylinder(h=15,d=5.2);
   
         /* cap holes (with a little gap to allow bridging */
         translate([-0.5,3.8,8]) rotate([-90,0,0]) cylinder(h=30,d=9);
         translate([-0.5,3.8,length-2]) rotate([-90,0,0]) cylinder(h=30,d=9);
   }
}

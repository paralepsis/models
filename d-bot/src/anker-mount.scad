// M2.5 x 20mm cap head bolts will clamp,
// M5 x 8mm bolts to mount.

$fn=80;

// 4.8 mm deep hole for using an 8mm bolt

length=100.25;
width=70.75;
height=25;

if (1) {
   if (1) bottom();
   else top();
   // % translate([0,0,3.0]) cube([length, width, height]);
}
else {
   cutouts();
}

module cutouts() {
   if (1) union() /* to remove */ {
      /* basic form */
      translate([0,0,3.0]) cube([length, width, height]);

      /* two interior cutouts through top/bottom */

      translate([8,10,-2.1]) hull() {
         translate([6,width-20,0]) cylinder(r=2,h=50);
         translate([length/2-14, width-20,0]) cylinder(r=2,h=50);
         translate([6,0,0]) cylinder(r=2,h=50);
         translate([length/2-14, 0, 0]) cylinder(r=2,h=50);
      }
      translate([8,10,-2.10]) hull() {
         translate([length/2-2,width-20,0]) cylinder(r=2,h=50);
         translate([length-16-6, width-20,0]) cylinder(r=2,h=50);
         translate([length/2-2,0,0]) cylinder(r=2,h=50);
         translate([length-16-6, 0, 0]) cylinder(r=2,h=50);
      }

      /* rounded end cutouts */
      translate([0,0,height-14]) scale([1,1,1.2]) hull() {
         translate([-5,width-6,8]) rotate([0,90,0]) cylinder(h=length+10, r=5);
         translate([-5,6,5+3]) rotate([0,90,0]) cylinder(h=length+10, r=5);
      }
      translate([-5,1,10]) cube([length+10, width-2, 11]);
      translate([0,0,1]) scale([1,1,1.2]) hull() {
         translate([-5,width-6,8]) rotate([0,90,0]) cylinder(h=length+10, r=5);
         translate([-5,6,5+3]) rotate([0,90,0]) cylinder(h=length+10, r=5);
      }

      /* nuts and bolt holes for holding top to bottom */
      translate([2,-4,0]) {
         translate([0,0,-0.01]) cylinder($fn=6,d=6,h=2.51);
         translate([0,0,2.8]) cylinder(d=2.75,h=19.7-2.8);
         translate([0,0,20]) cylinder(d=4.8,h=20);
      }
      translate([length-2,-4,0]) {
         translate([0,0,-0.01]) cylinder($fn=6,d=6,h=2.51);
         translate([0,0,2.8]) cylinder(d=2.75,h=19.7-2.8);
         translate([0,0,20]) cylinder(d=4.8,h=20);
      }
      translate([2,width+4,0]) {
         translate([0,0,-0.01]) cylinder($fn=6,d=6,h=2.51);
         translate([0,0,2.8]) cylinder(d=2.75,h=19.7-2.8);
         translate([0,0,20]) cylinder(d=4.8,h=20);
      }
      translate([length-2,width+4,0]) {
         translate([0,0,-0.01]) cylinder($fn=6,d=6,h=2.51);
         translate([0,0,2.8]) cylinder(d=2.75,h=19.7-2.8);
         translate([0,0,20]) cylinder(d=4.8,h=20);
      }

      /* cap holes (with a little gap to allow bridging */
      translate([15.5,-6.7-7,17.5]) {
         rotate([90,0,0]) cylinder(h=15,d=5.2);
         translate([0,0,0]) rotate([-90,0,0]) cylinder(h=30,d=9);
      }
      translate([length-14.5,-6.7-7,17.5]) {
         rotate([90,0,0]) cylinder(h=15,d=5.2);
         translate([0,0,0]) rotate([-90,0,0]) cylinder(h=30,d=9);
      }
   } /* end of stuff to remove */
}

module top() {
   difference() {
      translate([-2.5,-2.5,height-11]) union() /* starting form */ {
         hull() {
            translate([0+3,width+8,0]) cylinder(r=4,h=16);
            translate([length+2, width+8,0]) cylinder(r=4,h=16);
            translate([-1,-6.5,0]) cylinder(r=0.01,h=16);
            translate([length+5+1, -6.5, 0]) cylinder(r=0.01,h=16);
         }
      }
      cutouts();

      /* additional section up against rail */
      translate([11,-9.25,13.5]) cube([length-21,10,4.5]);
   }
}


module bottom() {
   difference() {
      translate([-2.5,-2.5,0]) union() /* starting form */ {
         hull() {
            translate([0+3,width+8,0]) cylinder(r=4,h=13);
            translate([length+2, width+8,0]) cylinder(r=4,h=13);
            // translate([0,0,0]) cylinder(r=1,h=13);
            // translate([length+5, 0, 0]) cylinder(r=1,h=13);
            translate([-1,-8,0]) cylinder(r=0.01,h=13);
            translate([length+5+1, -8, 0]) cylinder(r=0.01,h=13);
         }
         translate([length+6,-8-7,15]) rotate([0,-90,0]) side();
      }
      cutouts();
   }
}

module side() {
   translate([-15,0,0]) cube([27,8,length+7]);
   translate([7,0,0]) rotate([0,0,180])
      linear_extrude(height=length+7)
      polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
}

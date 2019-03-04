$fn=40;

/* seam occurs at z=9.27057 */

translate([0,0,13.4]) rotate([180,0,0]) top();
// bottom();

module top() {
   intersection() {
      roughForm();
      translate([-50,-50,9.27057]) cube([100,100,20]);
   }
   interiorLip();
}

module bottom() {
   difference() {
      roughForm();
      translate([-50,-50,9.27057]) cube([100,100,20]);
   }
   micro();
}

module roughForm() {
   difference() {
      outsideForm();
      translate([0,0,-10]) cube([200,200,20], center=true);
      interiorVolume();
   }
}

module micro() {
   difference() {
      translate([-15,-21/2,2]) cube([30,21,3]);
      translate([-14,-19/2,1.9]) cube([30,19,5]);
   }
}

module outsideForm() {
   hull() translate([0,0,4]) rotate_extrude($fn=120) translate([32.5,0]) scale([1,1.2]) circle(r=5);
   hull() translate([0,0,11]) rotate_extrude($fn=120) translate([33.5,0]) scale([1,1.2]) circle(r=2);
}

module interiorVolume() {
   translate([0,0,2]) cylinder($fn=120, r=28, h=9.4);
   translate([0,0,2]) cylinder($fn=120, r=30, h=7.27057);
   translate([0,0,3]) cylinder($fn=120, r=15, h=10);
   translate([0,0,3]) cylinder($fn=120, r=4, h=12);
   translate([18,-6,-0.1]) cube([20,12,7]);
}

module interiorLip() {
   difference() {
      translate([0,0,7.8]) cylinder($fn=120, r=29.5, h=2.5);
      translate([0,0,7.7]) cylinder($fn=120, r=27.5, h=3);
   }
}



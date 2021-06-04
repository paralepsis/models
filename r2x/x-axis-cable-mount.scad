// 25mm M3 screws at top, 12mm M3 screws at bottom

$fn=30;

//rotate([0,90,0])
difference() {
   union() {
      linear_extrude(height=19) polygon(points=[[-4,0],[-4,4],[0,4],[0,54],[0,54],[0,60],[15.5,60],[15.5,0]]);
      translate([0,45,-5]) cube([15.5,6,5.1]);
      //translate([0,-2,0]) cube([15.5,6,5.1]);
   }

   translate([-1,4,5]) cube([5,50,15]);

   translate([2.5,57,-1]) cylinder(d=3.2,h=50);
   translate([2.5+7,57,-1]) cylinder(d=3.2,h=50);

   translate([-1,28,0]) rotate([0,90,0]) scale([3.0,17,1]) cylinder(r=1,h=20);

   /* drag chain attachment */
   translate([9,-1,8]) rotate([-90,0,0]) cylinder(d=3.2,h=2);
   translate([9,-1,8]) rotate([-90,0,0]) cylinder(d=2.9,h=20);
   translate([9,-1,8+7.5]) rotate([-90,0,0]) cylinder(d=3.2,h=2);
   translate([9,-1,8+7.5]) rotate([-90,0,0]) cylinder(d=2.9,h=20);
}


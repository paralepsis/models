
dia = 3.4 + 0.4*8;
ht  = 42;
$fn = 30;

difference() {
   union() {
      rotate([0,-90,0]) addon();
      translate([-2.5,-9.3,0]) cube([5,22,1]);
      translate([1.7,-2,0]) cube([6,4,95]);
      translate([0.2,-9.3,0]) import("./orig/Xtra_Tall_Cable_Tower.stl");
   }
   rotate([0,-90,0]) translate([-1,0,dia]) rotate([0,90,0]) cylinder(d=3.4,h=ht+2);
}


module addon() {
   difference() {
      union() {
         translate([0,-dia/2-1,-2]) cube([ht, dia+2, dia+2]);
         translate([0,0,dia]) rotate([0,90,0]) cylinder(d=dia,h=ht);
      }
      union() {
         // translate([-1,0,dia]) rotate([0,90,0]) cylinder(d=3.4,h=ht+2);
         translate([0,5,0]) rotate([90,0,0]) linear_extrude(height=10)
            polygon(points=[[7,dia],[35,dia],[38,dia+3.5],[38,3*dia],
                            [4,3*dia],[4,dia+3.5]]);
      }
   }
}


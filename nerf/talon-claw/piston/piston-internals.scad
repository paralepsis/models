$fn=60;

bridge=1;

difference() {
   k31Piston();
   translate([0,0,-0.1]) cube([40,40,70]);
}

module k31Piston() {
   difference() {
      import("./G14_L_Spring_Piston-filled_fixed.stl");
      cutout();
   }
}

module cutout() {
   cylinder(d1=23.0,d2=22.22,h=1.5); // bevel bottom edge
   translate([0,0,-1]) cylinder(d=22.22,h=15);
   // translate([0,0,12.5]) cylinder(d1=24,d2=22.22,h=2.5);
   if (bridge) {
      translate([0,0,15.0+0.6]) cylinder(d=17,h=34-0.6);
   }
   else {
      translate([0,0,15.0]) cylinder(d=17,h=34);
   }
}

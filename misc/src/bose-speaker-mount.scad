$fn=80;

thick=5;
height=60;

difference() {
   hull() for (i=[0:1]) mirror([i,0,0]) translate([50,0,0])
      cylinder(r=10,h=thick);
   for (i=[0:1]) mirror([i,0,0]) translate([50,0,0]) {
      translate([0,0,-1]) cylinder(r=2,h=thick+2);
   }
}

translate([0,height-5,0]) difference() {
   hull() for (i=[0:1]) mirror([i,0,0]) translate([50,0,0])
      cylinder(r=10,h=thick);
   for (i=[0:1]) mirror([i,0,0]) translate([50,0,0]) {
      translate([0,0,-1]) cylinder(r=2,h=thick+2);
   }
}

difference() {
   translate([-20,0,0]) cube([40,height,thick]);
   for(i=[0:1]) mirror([i,0,0]) translate([20,0,0]) hull() {
      translate([0,20,-1]) cylinder(r=10,h=thick+2);
      translate([0,height-25,-1]) cylinder(r=10,h=thick+2);
   }
}

$fn=60;

length=65;

difference() {
   form();
   translate([0,0,5]) cylinder(d=33.4-4.8,h=length+10);
   translate([0,0,1]) cylinder(d=20,h=length+10);
}

module form() {
   cylinder(d=33.4,h=length);
   for (i=[0:10]) {
      rotate([0,0,(360/10) * i]) translate([33.4/2-1,0,length-30]) hull() {
         translate([0,0,4]) sphere(r=1.3);
         translate([0,0,26]) sphere(r=1.3);
      }
   }
   butt();
}

module butt() {
   hull() {
      cylinder(d=35,h=3);
      translate([-40,0,0]) cylinder(d=20,h=3);
   }
   translate([0,0,2]) minkowski() {
      hull() {
         cylinder(d=31,h=3);
         translate([-40,0,0]) cylinder(d=16,h=3);
      }
      sphere(r=2);
   }

   /* angled support */
   translate([-45,2.5,5.5]) rotate([90,0,0]) minkowski() {
      linear_extrude(height=5) polygon(points=[[0,0],[30,0],[30,20]]);
      sphere(r=2);
   }
}


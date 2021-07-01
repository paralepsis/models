$fn=30;

thick=8;

rotate([0,0,15]) difference() {
   cube([9,35.3,thick+15]);
   translate([6,27,15]) rotate([0,-90,0]) union() {
      cylinder(d=11,h=10);
      translate([0,0,-9]) cylinder(d=6.5,h=10);
   }
}

/* main body */
translate([-16.998,0,0]) rotate([180,0,0]) translate([0,0,-thick]) difference() {
   union() {
      linear_extrude(height=thick)
         polygon(points=[[16.998,-0.002], [-7.718,-0.002], [-7.718, -4.738],
                         [-12.604,-4.738], [-12.604,-5.502], [-15.302,-5.502],
                         [-15.302,-4.738], [-17.288,-4.738], [-17.288,-0.002],
                         [-22,-0.002], [-24.372,-2.372], [-24.372,-34.072],
                         [16.998,-34.072]]);
   }
   
   /* round head M5 hole */
   if (0) translate([16.998-8.5,-20,0]) {
      translate([0,0,3.8]) cylinder(d=11,h=10);
      translate([0,0,-2]) cylinder(d=5.2,h=3.5+2);
   }

   screwHoles();
}

module screwHoles() {
   translate([-20.0,-29.5,0]) {
      translate([0,0,thick-6.9+0.1]) cylinder(d=5.2,h=6.9);
      translate([0,0,thick+0.1]) cylinder(d=3.2,h=30);
   }
   translate([12.5,-4.5,0]) {
      translate([0,0,thick-6.9+0.1]) cylinder(d=5.2,h=6.9);
      translate([0,0,thick+0.1]) cylinder(d=3.2,h=30);
   }
}

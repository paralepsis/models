$fn=30;

thick=8;

/* main body */
if (1) difference() {
   union() {
      linear_extrude(height=thick)
         polygon(points=[[16.998,-0.002], [-7.718,-0.002], [-7.718, -4.738],
                         [-12.604,-4.738], [-12.604,-5.502], [-15.302,-5.502],
                         [-15.302,-4.738], [-17.288,-4.738], [-17.288,-0.002],
                         [-22,-0.002], [-24.372,-2.372], [-24.372,-34.072],
                         [16.998,-34.072]]);

      translate([0,-100,0]) cube([16.998,100,thick]);
      translate([0,-100,-12]) cube([16.998,34.072,thick+12]);
   
      /* angled bit to fit in v-slot */
      translate([0,-100+34.072,-12]) translate([16.998-4,0,0]) rotate([-90,0,180])
         linear_extrude(height=34.072)
            polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
   }
   
   /* round head M5 hole */
   translate([0,-100+34.072,-12]) translate([16.998-8.5,-20,0]) {
      translate([0,0,3.8]) cylinder(d=11,h=20);
      translate([0,0,-2]) cylinder(d=5.2,h=3.5+2);
   }

   screwHoles();
}
else {
   // screwHoles();
   translate([16.998-8.5,-20,-2]) cylinder(d=5.2,h=50);
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

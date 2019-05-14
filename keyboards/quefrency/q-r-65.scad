% import("./quefrency-right-middle-65.stl");

// linear_extrude(height=1) projection() import("./quefrency-right-middle-65.stl");

difference() {
   import("./q-r-65-slice-filled.stl");

   translate([-71+4,-2,0]) lines(ct=6,odd=1);
   translate([-65+4,-45,0]) lines(ct=5);

   translate([14+4,-2,0]) mirror([0,0,0]) lines(ct=5,odd=0);
   translate([80+4,-45,0]) mirror([1,0,0]) lines(ct=5);

   // translate([-71,-2,0]) lines(ct=13,odd=1);
   // translate([-65,-45,0]) lines(ct=12);
}

module lines(ct,odd=0) {
   $fn=20;
   myrad=1.75;

   for (i=[0:ct]) {
      translate([i*12,27,-0.2]) hull() {
         cylinder(r=myrad,h=1.4);
         translate([0,7,0]) cylinder(r=myrad,h=1.4);
      }
      translate([i*12,0,-0.2]) hull() {
         cylinder(r=myrad,h=1.4);
         translate([0,21.5,0]) cylinder(r=myrad,h=1.4);
      }

      if (!odd || i != (ct)) {
         translate([i*12 + 6,12.5,-0.2]) hull() {
            cylinder(r=myrad,h=1.4);
            translate([0,21.5,0]) cylinder(r=myrad,h=1.4);
         }
         translate([i*12+6,0,-0.2]) hull() {
            cylinder(r=myrad,h=1.4);
            translate([0,7,0]) cylinder(r=myrad,h=1.4);
         }
      }
   }
}

module hexes() {
   translate([-60,-45,0]) 
   for (j=[0:7]) {
      for(i=[0:8]) {
         translate([i*17,j*10.5,-0.2]) cylinder($fn=6,h=1.4,r=4.5);
         translate([i*17+8.5,j*10.5+5,-0.2]) cylinder($fn=6,h=1.4,r=4.5);
      }
   }
}

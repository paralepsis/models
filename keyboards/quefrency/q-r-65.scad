% import("./quefrency-right-middle-65.stl");

perimeter();
bottom(thick=1.2);

module perimeter() {
   difference() {
      linear_extrude(height=13) projection() import("./quefrency-right-middle-65.stl");
      partCutouts();
   }
}

module partCutouts() {
   // reset and TRRS access
   if (1) translate([-63,31,-0.2]) cube([19,20,13.4]);

   if (1) {
      // Arduino Access
      translate([58,2,-0.2]) {
         cube([40,22,13.4]);
         translate([5,4,0]) cube([40,14,13.4]);
      }
   }
}

module bottom(thick=1) {
   difference() {
      linear_extrude(height=thick) projection() import("./q-r-65-slice-filled.stl");

      translate([-71+4,-2,0]) lines(ct=6,odd=1, thick=thick);
      translate([-65+4,-45,0]) lines(ct=5, odd=0, thick=thick);

      translate([14+4,-2,0]) mirror([0,0,0]) lines(ct=5,odd=0, thick=thick);
      translate([80+4,-45,0]) mirror([1,0,0]) lines(ct=5, odd=0, thick=thick);

      // translate([-71,-2,0]) lines(ct=13,odd=1, thick=thick);
      // translate([-65,-45,0]) lines(ct=12, odd=0, thick=thick);
   }
}

module lines(ct,odd=0,thick=1) {
   $fn=20;
   myrad=1.75;

   for (i=[0:ct]) {
      translate([i*12,27,-0.2]) hull() {
         cylinder(r=myrad,h=thick+0.4);
         translate([0,7,0]) cylinder(r=myrad,h=thick+0.4);
      }
      translate([i*12,0,-0.2]) hull() {
         cylinder(r=myrad,h=thick+0.4);
         translate([0,21.5,0]) cylinder(r=myrad,h=thick+0.4);
      }

      if (!odd || i != (ct)) {
         translate([i*12 + 6,12.5,-0.2]) hull() {
            cylinder(r=myrad,h=thick+0.4);
            translate([0,21.5,0]) cylinder(r=myrad,h=thick+0.4);
         }
         translate([i*12+6,0,-0.2]) hull() {
            cylinder(r=myrad,h=thick+0.4);
            translate([0,7,0]) cylinder(r=myrad,h=thick+0.4);
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

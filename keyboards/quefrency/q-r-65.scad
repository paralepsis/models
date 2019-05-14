% import("./quefrency-right-middle-65.stl");

// linear_extrude(height=1) projection() import("./quefrency-right-middle-65.stl");

difference() {
   import("./q-r-65-slice-filled.stl");

   translate([-60,-45,0]) 
   for (j=[0:7]) {
      for(i=[0:8]) {
         translate([i*17,j*10.5,-0.2]) cylinder($fn=6,h=1.4,r=4.5);
         translate([i*17+8.5,j*10.5+5,-0.2]) cylinder($fn=6,h=1.4,r=4.5);
      }
   }
}

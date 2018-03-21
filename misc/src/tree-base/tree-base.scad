$fn=100;

difference() {
   intersection() {
      scale([1,1,0.2]) sphere(d=90);
      translate([-55,-55,0]) cube([110,110,20]);
   }

   translate([-23,-2,1]) rotate([-6,0,0]) cube([46, 3.5,15]);
}

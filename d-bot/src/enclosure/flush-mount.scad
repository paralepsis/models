$fn=80;

bottomLip = 0;
thick = 7+8; /* minimum 7, add 8 to fit on the front */
magnetDepth = 3;
magnetDia = 8.25; /* include any slop */
len = 30;


/* note: need 4mm of thickness of form for 10mm bolts to work */
/* note: this file is a total mess. not sure how it got to this point. */

/* optional bottom lip */
translate([-9,-16,0]) cube([18,26,4]);

difference() {
   union() {
      translate([-15,-16,0]) {
         hull() {
            /* translate([5,0,0]) cube([20,10,len + 6*bottomLip]); */

            translate([7,0,2]) hull() {
               translate([15,0,0]) rotate([-90,0,0]) cylinder(r=2,h=thick);
               translate([1,0,0]) rotate([-90,0,0]) cylinder(r=2,h=thick);
               translate([15,0,len-4 + 6*bottomLip ]) rotate([-90,0,0]) cylinder(r=2,h=thick);
               translate([1,0, len-4 + 6*bottomLip]) rotate([-90,0,0]) cylinder(r=2,h=thick);
            }
         }

         /* angled bit to fit in v-slot */
         translate([19.5,0,0]) rotate([0,0,180])
            linear_extrude(height=len + 6*bottomLip)
            polygon(points=[[-0.1,0],[0,0],[1,1],[8,1],[9,0],[9,-0.1]]);
         
         /* bottom lip */
         if (bottomLip) {
            translate([7,thick-1,len+6*bottomLip-2]) hull() {
               translate([2,0,0]) cylinder(r=2,h=2);
               translate([2,5,0]) cylinder(r=2,h=2);
               translate([14,0,0]) cylinder(r=2,h=2);
               translate([14,5,0]) cylinder(r=2,h=2);
            }
         }

      }
   }

   /* bolt */
   translate([0,-2.2,10]) rotate([90,0,0]) {
      /* bolt hole */
      translate([0,0,14-4.8]) cylinder(h=15,d=5.2);

      /* cap holes (with a little gap to allow bridging) */
      translate([0,0,-20]) cylinder(h=30,d=11);

   }

   /* cutout for magnet */
   translate([0,-14+thick-magnetDepth-2, 23]) rotate([-90,0,0]) cylinder(d=magnetDia, h=20);
}


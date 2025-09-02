yOffset   = 0.0; // moves center hole of mount in Y axis; 0 for MRW Triple Ex (-1 also works for BMG)
xOffset   = -1.0; // moves center hole of mount in X axis; 0 works for BMG, -1 for MRW Triple Ex
backThick = 3;
top       = [37,0-yOffset,0];
botLeft   = [6.1,7.5-yOffset,0];
botRight  = [6.1,-7.5-yOffset,0];
dbLeft    = [24.88,12.5,0];
dbRight   = [24.88,-12.5,0];
endTop    = [29.5,-22.5,0];
endBot    = [23,-22.5,0];
$fn       = 80;

difference() {
   base();
   cutouts();
}




module base() {
   hull() {
      translate(top) cylinder(d=10,h=6-xOffset);

      // DB mount holes
      translate(dbLeft) cylinder(d=11,h=6-xOffset);
      translate(dbRight) cylinder(d=9,h=6-xOffset);

      // extend for y endstop
      translate([31,-26,0]) cylinder(d=2,h=6-xOffset);
      translate([22,-26,0]) cylinder(d=2,h=6-xOffset);
   }
   hull() {
      /* little arm to keep wires out of the way */
      translate([31,-24.5,0]) cylinder(d=2,h=6-xOffset);
      translate([31,-26,0]) cylinder(d=2,h=6-xOffset);
      translate([40,-24.5,0]) cylinder(d=2,h=6-xOffset);
      translate([40,-26,0]) cylinder(d=2,h=6-xOffset);
   }
   if (1) hull() {
      // just a little something to fix the RHS inside corner in a good spot
      translate([20,-15,0]) cube([1,2,6-xOffset]);

      // bottom carriage mount holes (used to be Y endstop screws on Y carriage)
      translate(botRight) cylinder(d=10,h=6-xOffset); // orig 5.1, that was wrong
      translate(botLeft) cylinder(d=10,h=6-xOffset);

   }
   translate(botRight) translate([0,-5,0]) cube([20,22.5,6-xOffset]);
}

module cutouts() {
   slop = 0.02;
   translate([0,0,-slop]) translate(top) cylinder(d=3.4,h=6+2*slop);
   translate([0,0,backThick]) translate(top) cylinder(d=6,h=6+2*slop);

   // bottom carriage mount holes (used to be Y endstop)
   translate([0,0,-slop]) translate(botLeft) cylinder(d=3.4,h=6+2*slop); // orig 5.1, that was wrong
   translate([0,0,backThick]) translate(botLeft) cylinder(d=6,h=6+slop);
   translate([0,0,-slop]) translate(botRight) cylinder(d=3.4,h=6+2*slop);
   translate([0,0,backThick]) translate(botRight) cylinder(d=6,h=6+slop);

   // DB mount holes
   if (0) {
      /* just holes */
      translate([0,0,-slop]) translate(dbLeft) cylinder(d=3.4,h=6+2*slop-xOffset);
      translate([0,0,-slop]) translate(dbRight) cylinder(d=3.4,h=6+2*slop-xOffset);
   }
   else {
      /* heat set inserts */
      translate(dbLeft) {
         translate([0,0,-slop]) cylinder(d2=4.7,d1=5.5,h=0.6+2*slop);
         translate([0,0,0]) cylinder(d=4.7,h=5);
         translate([0,0,5-slop]) cylinder(d1=4.75,d2=3.4,h=0.5+2*slop);
         translate([0,0,-slop]) cylinder(d=3.4,h=6+2*slop-xOffset);
      }
      translate(dbRight) {
         translate([0,0,-slop]) cylinder(d2=4.7,d1=5.5,h=0.6+2*slop);
         translate([0,0,0]) cylinder(d=4.7,h=5);
         translate([0,0,5-slop]) cylinder(d1=4.75,d2=3.4,h=0.5+2*slop);
         translate([0,0,-slop]) cylinder(d=3.4,h=6+2*slop-xOffset);
      }
   }

   // endstop mount holes
   translate([0,0,-slop]) translate(endTop) cylinder(d=2.5,h=6+2*slop);
   translate([0,0,4.5]) translate(endTop) rotate([0,0,30]) cylinder($fn=6,d=4.9,h=1.5+slop-xOffset);
   translate([0,0,-slop]) translate(endBot) cylinder(d=2.5,h=6+2*slop);
   translate([0,0,4.5]) translate(endBot) rotate([0,0,30]) cylinder($fn=6,d=4.9,h=1.5+slop-xOffset);

   // space for tk
   translate([0,-13/2, backThick]) hull() {
      cube([15.5,13,5+slop]);
      translate([0,1.5,0]) cube([16.8,10,5+slop]);
   }
   translate([0,-20,backThick+1]) cube([15.5,40,5+slop]);
   // translate([31.85,-18,backThick+1]) cube([15.5,60,5+slop]);
   translate([31.85,-23.5,backThick+1]) cube([15.5,60,5+slop]);
}

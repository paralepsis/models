hOffset   = 1;
backThick = 3;
top       = [37,0+hOffset,0];
botLeft   = [6.1,7.5+hOffset,0];
botRight  = [6.1,-7.5+hOffset,0];
dbLeft    = [24.88,12.5,0];
dbRight   = [24.88,-12.5,0];
endTop    = [29.5,-23.5+hOffset,0];
endBot    = [23,-23.5+hOffset,0];
$fn       = 80;

module shape() {
   //projection(cut=true)
   translate([0.7,-0.05,-1]) import("./dragonburner-railcore-slice-flat.stl");
}

// shape();

difference() {
   base();
   cutouts();
}




module base() {
   hull() {
      translate(top) cylinder(d=10,h=6);

      // DB mount holes
      translate(dbLeft) cylinder(d=11,h=6);
      translate(dbRight) cylinder(d=9,h=6);

      // extend for y endstop
      translate([31,-25-hOffset,0]) cylinder(d=2,h=6);
      translate([22,-25-hOffset,0]) cylinder(d=2,h=6);
   }
   if (1) hull() {
      // just a little something to fix the RHS inside corner in a good spot
      translate([20,-15,0]) cube([1,2,6]);

      // bottom carriage mount holes (used to be Y endstop screws on Y carriage)
      translate(botRight) cylinder(d=10,h=6); // orig 5.1, that was wrong
      translate(botLeft) cylinder(d=10,h=6);

   }
   translate(botRight) translate([0,-5,0]) cube([20,22.5,6]);
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
      translate([0,0,-slop]) translate(dbLeft) cylinder(d=3.4,h=6+2*slop);
      translate([0,0,-slop]) translate(dbRight) cylinder(d=3.4,h=6+2*slop);
   }
   else {
      /* heat set inserts */
      translate(dbLeft) {
         translate([0,0,-slop]) cylinder(d2=4.7,d1=5.5,h=0.6+2*slop);
         translate([0,0,0]) cylinder(d=4.7,h=5);
         translate([0,0,5-slop]) cylinder(d1=4.75,d2=3.4,h=0.5+2*slop);
         translate([0,0,-slop]) cylinder(d=3.4,h=6+2*slop);
      }
      translate(dbRight) {
         translate([0,0,-slop]) cylinder(d2=4.7,d1=5.5,h=0.6+2*slop);
         translate([0,0,0]) cylinder(d=4.7,h=5);
         translate([0,0,5-slop]) cylinder(d1=4.75,d2=3.4,h=0.5+2*slop);
         translate([0,0,-slop]) cylinder(d=3.4,h=6+2*slop);
      }
   }

   // endstop mount holes
   translate([0,0,-slop]) translate(endTop) cylinder(d=2.5,h=6+2*slop);
   translate([0,0,4.5]) translate(endTop) rotate([0,0,30]) cylinder($fn=6,d=4.9,h=1.5+slop);
   translate([0,0,-slop]) translate(endBot) cylinder(d=2.5,h=6+2*slop);
   translate([0,0,4.5]) translate(endBot) rotate([0,0,30]) cylinder($fn=6,d=4.9,h=1.5+slop);

   // space for tk
   translate([0,-13/2, backThick]) hull() {
      cube([15.5,13,5+slop]);
      translate([0,1.5,0]) cube([16.8,10,5+slop]);
   }
   translate([0,-20,backThick+1]) cube([15.5,40,5+slop]);
   translate([31.85,-18,backThick+1]) cube([15.5,60,5+slop]);
}

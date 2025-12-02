
yOffset   = 0.0; // moves center hole of mount in Y axis; 0 for MRW Triple Ex (-1 also works for BMG)
xOffset   = -1.0; // moves center hole of mount in X axis; 0 works for BMG, -1 for MRW Triple Ex
backThick = 3;
top       = [37,0-yOffset,0];
botLeft   = [6.1,7.5-yOffset,0];
botRight  = [6.1,-7.5-yOffset,0];
dbTopLeft = [37,12.5,0];
dbTopRight = [37,-12.5,0];
dbLeft    = [24.88,12.5,0];
dbRight   = [24.88,-12.5,0];
endTop    = [29.5,-22.5,0];
endBot    = [23,-22.5,0];
$fn       = 80;

separate=0; // separate carriage mount from the top support

if (1) difference() {
   base();
   cutouts();
}

if (0) {
   translate([15.5,-90,-59.8]) rotate([90,0,90]) import("/Volumes/HomeX/rbross/Desktop/DragonBurner-TeaKettle-Mount.stl");
   translate([19,-2.1,42.5]) rotate([0,0,180]) translate([150,-150,0]) rotate([0,180,-90]) import("/Volumes/HomeX/rbross/Downloads/Cowl_NoProbe.stl");

   // translate([0,1,0]) translate(dbLeft) cylinder(d=28,h=30);
   // translate([0,-1,0]) translate(dbRight) cylinder(d=28,h=30);
}

if (1) difference() {
   topper();
   topperCutouts();
}
 //topperCutouts();

module topper() {
   slop = 0.02;

   // translate([31.85,-30,6-xOffset]) cube([10.0,60,21]); // old top cutout
   if (1) hull() {
      translate([31.85,-21.7,11.5+6-xOffset]) rotate([0,90,0]) cylinder(d=8.5, h=4);
      translate([31.85,21.7,11.5+6-xOffset]) rotate([0,90,0]) cylinder(d=8.5, h=4);

      if (separate) {
         translate([31.85,-18,6-xOffset]) cube([5.0,2*18,1]); // old top cutout
      }
      else {
        translate([31.85,-17.5,6-xOffset-slop]) cube([5.0,2*17.5,1]); // old top cutout
        translate(dbTopLeft) translate([0,0,6-xOffset-slop]) cylinder(d=10,h=1);
        translate(dbTopRight) translate([0,0,6-xOffset-slop]) cylinder(d=10,h=1);
      }
   }
   if (separate) hull() {
      translate(dbTopLeft) translate([0,0,6-xOffset]) cylinder(d=10,h=8);
      translate(dbTopRight) translate([0,0,6-xOffset]) cylinder(d=10,h=8);
   }
   
}


module topperCutouts() {
   slop=0.02;

   // translate(top) translate([0,0,6-xOffset-slop]) cylinder(d=6,h=1.5); // little room
   translate(top) translate([0,0,6-xOffset-slop]) cylinder(d=6,h=10); // all the way through


   if (separate) {
      /* bolts to top heat set inserts */
      translate(dbTopLeft) translate([0,0,-slop]) cylinder(d=3.4,h=50); // all the way through
      translate([0,0,6-xOffset+4]) translate(dbTopLeft) translate([0,0,-slop]) cylinder(d=6,h=50);
      translate(dbTopRight) translate([0,0,-slop]) cylinder(d=3.4,h=50); // all the way through
      translate([0,0,6-xOffset+4]) translate(dbTopRight) translate([0,0,-slop]) cylinder(d=6,h=50);

      translate([31.85+2.1,-12.5,6-xOffset+8]) cube([20,25,20]);
   }

   /* PTFE passthrough */
   translate([20,-9,11.5+6-xOffset]) rotate([0,90,0]) cylinder(r=2, h=30);
   translate([31.85-slop,-11,11.5+6-xOffset]) cube([8,4,5]);

   pRad = 9; // was 2.6
   translate([20,0,11.5+6-xOffset]) rotate([0,90,0]) cylinder(r=pRad, h=30);
   translate([30,-pRad,11.5+6-xOffset]) cube([20,2*pRad,10]);

   /* bolts to hotend mount, with a little room for adjustment */
   for (i=[-1,1]) {
      hull() {
         translate([20,i*21.7,11.5+6-xOffset+0.5]) rotate([0,90,0]) cylinder(d=3.7, h=30);
         translate([20,i*21.7,11.5+6-xOffset-0.5]) rotate([0,90,0]) cylinder(d=3.7, h=30);
      }
      hull() {
         translate([20+15,i*21.7,11.5+6-xOffset+0.5]) rotate([0,90,0]) cylinder(d=6, h=10);
         translate([20+15,i*21.7,11.5+6-xOffset-0.5]) rotate([0,90,0]) cylinder(d=6, h=10);
      }
   }
}

module base() {
   hull() {
      // translate(top) cylinder(d=10,h=6-xOffset);
      translate(top) cylinder(d=10,h=6-xOffset);
      translate(dbTopLeft) cylinder(d=10,h=6-xOffset);
      translate(dbTopRight) cylinder(d=10,h=6-xOffset);

      // DB mount holes
      translate(dbLeft) cylinder(d=11,h=6-xOffset);
      translate(dbRight) cylinder(d=9,h=6-xOffset);

      // extend for y endstop
   }
   hull() {
      /* bit to get out to the hold the y-endstop */
      translate([2.8,0,0]) translate(dbRight) cylinder(d=9,h=6-xOffset); // kludge
      translate(dbRight) cylinder(d=9,h=6-xOffset);
      translate([31,-26,0]) cylinder(d=2,h=6-xOffset);
      translate([22,-26,0]) cylinder(d=2,h=6-xOffset);
   }
   if (1) hull() {
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
      translate([0,0,-slop]) translate(dbLeft) cylinder(d=3.4,h=10);
      translate([0,0,-slop]) translate(dbRight) cylinder(d=3.4,h=10);
   }
   else {
      /* heat set inserts */
      translate(dbLeft) {
         translate([0,0,-slop]) cylinder(d2=4.7,d1=5.5,h=0.6+2*slop);
         translate([0,0,0]) cylinder(d=4.7,h=3.5);
         translate([0,0,3.5-slop]) cylinder(d1=4.75,d2=3.4,h=0.5+2*slop);
         translate([0,0,-slop]) cylinder(d=3.4,h=10); // all the way through
      }
      translate(dbRight) {
         translate([0,0,-slop]) cylinder(d2=4.7,d1=5.5,h=0.6+2*slop);
         translate([0,0,0]) cylinder(d=4.7,h=3.5);
         translate([0,0,3.5-slop]) cylinder(d1=4.75,d2=3.4,h=0.5+2*slop);
         translate([0,0,-slop]) cylinder(d=3.4,h=10); // all the way through
      }
      if (separate) {
         /* heat set inserts */
         translate(dbTopLeft) {
            translate([0,0,-slop]) cylinder(d2=4.7,d1=5.5,h=0.6+2*slop);
            translate([0,0,0]) cylinder(d=4.7,h=3.5);
            translate([0,0,3.5-slop]) cylinder(d1=4.75,d2=3.4,h=0.5+2*slop);
            translate([0,0,-slop]) cylinder(d=3.4,h=10); // all the way through
         }
         translate(dbTopRight) {
            translate([0,0,-slop]) cylinder(d2=4.7,d1=5.5,h=0.6+2*slop);
            translate([0,0,0]) cylinder(d=4.7,h=3.5);
            translate([0,0,3.5-slop]) cylinder(d1=4.75,d2=3.4,h=0.5+2*slop);
            translate([0,0,-slop]) cylinder(d=3.4,h=10); // all the way through
         }
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
   // translate([31.85,-23.5,backThick+1]) cube([15.5,60,5+slop]); // old top cutout
}

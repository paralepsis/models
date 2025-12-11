use <BOSL2/std.scad>


yOffset   = 0.0; // moves center hole of mount in Y axis; 0 for MRW Triple Ex (-1 also works for BMG)
xOffset   = -1.0; // moves center hole of mount in X axis; 0 works for BMG, -1 for MRW Triple Ex
backThick = 3;
vTopRight = [37+13.25,-3.25,0];
vTopCntr  = [37+13.25,-3.25+15.75,0];
vTopLeft  = [37+13.25,-3.25+2*15.75,0];
top       = [37,0,0];
farLeft   = [35.5,-2.5+2*15.75,0];
midLeft   = [6.1+9,7.5+.5,0];
midRight  = [6.1+9,-7.5,0];
botLeft   = [6.1,7.5,0];
botRight  = [6.1,-7.5,0];
dbLeft    = [24.88,12.5+yOffset,0];
dbRight   = [24.88,-12.5+yOffset,0];
endTop    = [29.5,-22.5,0];
endBot    = [23,-22.5,0];
$fn       = 80;

centerOff = 13.5;

shape = [[1,0],[1,-12],[21,-15+yOffset],[21,-26.5],[41,-26.5],[41,-23.5],[32,-23.5],[32,-19],[45,-19], [49.5,-29],[56.5,-29],[56.5,41],[30,41],[30,18+yOffset],[19.5,18+yOffset],[19.5,9],[11,9],[9,12.5],[1,12.5]];
radii = [ 5,    5,      3,       1,         1,         1,         1,         1,       1, 1, 1,       1,      5,      3,      5,        3,          3,      3,      5];

xzCut  = [[-1,backThick+1],[15.5,backThick+1],[15.5,6-xOffset],[32-0.02,6-xOffset],[32-0.02,backThick+1],[49.5,backThick+1],[49.5,35],[-1,35]];
xzRad  = [0.1,    2, 0.1, 0.1, 2, 5,   .1,     0.1];
xzCut2  = [[-1,backThick+1],[15.5,backThick+1],[15.5,6-xOffset],[32-0.02,6-xOffset],[49.5,6-xOffset],[49.5,35],[-1,35]];
xzRad2 = [0.1,              2,                 0.1,             0.1,                15,   .1,     0.1];

yzCut  = [[-29-0.2,23], [-29+15+yOffset,29], [40-29+yOffset, 34.75], [51-29+yOffset, 27], [41+0.2, 13], [41+0.2,-1],[-29-0.2,-1]];
yzRad  = [3,3,3,3,3,0.1,0.1];


for (i=[0,10]) translate([65,-30+10+i,0]) difference() {
   cylinder(d=6.5,h=17.5);
   translate([0,0,-1]) cylinder(d=3.4,h=20);
}
for (i=[0,10]) translate([65,10+i,0]) difference() {
   cylinder(d=6.5,h=17.);
   translate([0,0,-1]) cylinder(d=3.4,h=20);
}
for (i=[0,10]) translate([15,20+i,0]) difference() {
   cylinder(d=6.5,h=16.5);
   translate([0,0,-1]) cylinder(d=3.4,h=20);
}


/* EARS */
// translate([56.5,41,0]) cylinder(d=6,h=0.3);
translate([56.5,-29,0]) cylinder(d=6,h=0.3);
translate([48.5,-29,0]) cylinder(d=6,h=0.3);
translate([41.5,-25,0]) cylinder(d=6,h=0.3);
translate([56.5+58,42,0]) cylinder(d=6,h=0.3);
translate([56.5+58,41-8,0]) cylinder(d=6,h=0.3);
translate([21,-26.5,0]) cylinder(d=6,h=0.3);

cableGuide();

if (1) difference() {
   intersection() {
      linear_extrude(height=34.7) polygon(round_corners(shape,radius=radii,$fn=64)); // extrude to whatever height makes sense
      rotate([90,0,90]) linear_extrude(height=60) polygon(round_corners(yzCut,radius=yzRad,$fn=64));
      // linear_extrude(height=2) polygon(round_corners(shape,radius=radii,$fn=64));
   }
   baseCutouts();
   topperCutouts();
   translate([27,18+yOffset,backThick+1]) cube([10,25,8]); // little cleanup

   translate([0,50+yOffset,0]) rotate([90,0,0]) linear_extrude(height=100) polygon(round_corners(xzCut2,radius=xzRad2,$fn=150));
   translate([0,9+yOffset,0]) rotate([90,0,0]) linear_extrude(height=17) polygon(round_corners(xzCut,radius=xzRad,$fn=64));
   translate([0,42+yOffset,0]) rotate([90,0,0]) linear_extrude(height=28) polygon(round_corners(xzCut,radius=xzRad,$fn=64));
   translate([0,-13+yOffset,0]) rotate([90,0,0]) linear_extrude(height=20) polygon(round_corners(xzCut,radius=xzRad,$fn=64));
}

module cableGuide() {
   wid = 7;
   ht  = 60;
   guidePts = [[-1,0], [-1,0-wid-6], [0.95,-wid-6], [0.95,-wid], [0+ht,0-wid], [ht,0]];
   guideRad = [  0.1,         0.1,           0.1,           2,            2,          2];

   guideXZ  = [[-5,0],[-5,11],[0.95,11],[0.95,7],[ht,7],[ht,0]];
   XZRad    = [  0.01,   0.01,     0.01,       3,     1,  0.00];


   translate([55,41,0]) difference() {
      intersection() {
         linear_extrude(height=9) polygon(round_corners(guidePts,radius=guideRad,$fn=64));
         rotate([90,0,0]) linear_extrude(height=10) polygon(round_corners(guideXZ, radius=XZRad, $fn=64));
      }

      for (i=[0:4]) {
         hull() {
            translate([12+10*i,-4,-1]) scale([1,0.3,1]) cylinder(d=6,h=10);
         }
      }
   }
}


module topperCutouts() {
   slop=0.02;

   /* PTFE passthrough */
   translate([20,0+yOffset,11.5+6-xOffset]) rotate([0,90,0]) cylinder(r=2.25, h=60);

   /* bolts to hotend mount, with a little room for adjustment */
   for (i=[-1,1]) {
      translate([40,i*21.7+yOffset,11.5+6-xOffset]) rotate([0,90,0]) cylinder(d=3.7, h=30);
      translate([53.5,i*21.7+yOffset,11.5+6-xOffset]) rotate([0,90,0]) cylinder(d=6, h=10);
   }

   translate([0,0+yOffset,11.5+6-xOffset]) rotate([14,0,0]) {
      translate([49.5,-17.5,0]) rotate([0,90,0]) insert();
      translate([49.5,20,0]) rotate([0,90,0]) insert();
   }
}

module insert()
{
   slop = 0.02;

   translate([0,0,-slop]) cylinder(d2=4.4,d1=5.3,h=0.6+2*slop);
   translate([0,0,0]) cylinder(d=4.4,h=3.5);
   translate([0,0,3.5-slop]) cylinder(d1=4.4,d2=3.4,h=0.5+2*slop);
   translate([0,0,-slop]) cylinder(d=3.4,h=10); // all the way through
}


module baseCutouts() {
   slop = 0.02;
   translate([0,0,-slop]) translate(top) cylinder(d=3.4,h=6+2*slop);
   translate([0,0,backThick]) translate(top) cylinder(d=6,h=40+2*slop);
   translate([0,0,-slop]) translate(botLeft) cylinder(d=3.4,h=6+2*slop); // orig 5.1, that was wrong
   translate([0,0,backThick]) translate(botLeft) cylinder(d=6,h=40+slop);
   translate([0,0,-slop]) translate(botRight) cylinder(d=3.4,h=6+2*slop);
   translate([0,0,backThick]) translate(botRight) cylinder(d=6,h=40+slop);
   translate([0,0,-slop]) translate(vTopLeft) cylinder(d=3.4,h=6+2*slop);
   translate([0,0,backThick]) translate(vTopLeft) cylinder(d=6,h=15+slop);
   translate([0,0,backThick+15]) translate(vTopLeft) cylinder(d1=6,d2=0.1,h=3);
   translate([0,0,-slop]) translate(vTopRight) cylinder(d=3.4,h=6+2*slop);
   translate([0,0,backThick]) translate(vTopRight) cylinder(d=6,h=15+slop);
   translate([0,0,backThick+15]) translate(vTopRight) cylinder(d1=6,d2=0.1,h=3);
   translate([0,0,-slop]) translate(farLeft) cylinder(d=3.4,h=6+2*slop);
   translate([0,0,backThick]) translate(farLeft) cylinder(d=6,h=40+slop);

   // DB mount holes
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

   // endstop mount holes
   translate([0,0,-slop]) translate(endTop) cylinder(d=2.5,h=6+2*slop);
   translate([0,0,4.5]) translate(endTop) rotate([0,0,30]) cylinder($fn=6,d=4.9,h=1.5+slop-xOffset);
   translate([0,0,-slop]) translate(endBot) cylinder(d=2.5,h=6+2*slop);
   translate([0,0,4.5]) translate(endBot) rotate([0,0,30]) cylinder($fn=6,d=4.9,h=1.5+slop-xOffset);

   // space for tk
   translate([0,-13/2+yOffset, backThick]) hull() {
      cube([15.5,13,5+slop]);
      translate([0,1.5,0]) cube([16.8,10,5+slop]);
   }
}

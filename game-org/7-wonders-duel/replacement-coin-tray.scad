/*
 * original tray dimensions: 118.75 x 67 x 33mm
 *
 */
//translate([-135,50,0]) import("./orig/7WD_Coin_Tray.stl");

boxWid = 118.75;
boxDep = 67;
boxHt  = 33;

wallThick = 1.52;
botThick  = 1.2;

magnetDim = 4.9; /* 3/16" with slop */
magnetHt  = 1.8; /* 1/16" with slop */
magnetSpace = 7+magnetDim; /* room on ends of tray for magnet to mount */

oneDim   = 23;
threeDim = 28;
sixDim   = 33;

filler = boxWid-2*magnetSpace-oneDim-threeDim-sixDim;

topHt  = 2.2;
topGap = 0.5; /* all the way around */

// rotate([180,0,0]) top();

tray();

module top() {
   difference() {
      translate([-boxWid/2+wallThick+topGap,-boxDep/2+wallThick+topGap,boxHt-topHt])
         cube([boxWid-2*wallThick-2*topGap,boxDep-2*wallThick-2*topGap,topHt+0.01]);

      /* magnet holes */
      magnetVoids();

      /* finger holes */
      for (i=[0:1]) mirror([0,i,0]) {
         translate([-boxWid/2+magnetSpace+filler/2+oneDim+threeDim/2,-8,botThick]) difference() {
            cylinder(d=threeDim-3,h=boxHt+0.01);
            translate([0,threeDim/2,boxHt+0.02]) cube([threeDim+0.01,threeDim+0.01,boxHt+0.02],center=true);
         }
      }
   }
}


module tray() {
   difference() {
      myLeft = -boxWid/2+magnetSpace;
   
      translate([-boxWid/2,-boxDep/2,0]) cube([boxWid,boxDep,boxHt]);
   
      /* coin slots */
      translate([myLeft+oneDim/2,0,botThick]) coinVoid(dim=oneDim);
      translate([myLeft+filler/2+oneDim+threeDim/2,0,botThick]) coinVoid(dim=threeDim);
      translate([myLeft+filler+oneDim+threeDim+sixDim/2,0,botThick]) coinVoid(dim=sixDim);

      translate([-boxWid/2+wallThick,-boxDep/2+wallThick,boxHt-topHt])
         cube([boxWid-2*wallThick,boxDep-2*wallThick,topHt+0.01]);

      /* magnet holes */
      magnetVoids();
   }
}

/* magnetVoids() -- place magnets top and bottom */
module magnetVoids() {
   $fn=40;

   /* two magnets stacked */
   translate([-boxWid/2+magnetSpace/2+1,0,boxHt-topHt-magnetHt]) cylinder(d=magnetDim,h=2*magnetHt);
   translate([+boxWid/2-magnetSpace/2-1,0,boxHt-topHt-magnetHt]) cylinder(d=magnetDim,h=2*magnetHt);
}
   
/* coinVoid -- quick method of getting slots for coins */
module coinVoid(len=boxDep-2*wallThick,dim=oneDim,ht=boxHt-botThick+0.01) {
   intersection() {
      union() {
         if (dim < ht-4) {
            /* don't make voids deeper than they need to be */
            translate([0,-len/2,dim/2+(ht-dim-4)]) rotate([-90,0,0]) cylinder($fn=80,d=dim,h=len);
            translate([-dim/2,-len/2,dim/2-0.01+(ht-dim-4)]) cube([dim,len,ht-dim/2+0.01]);
         }
         else {
            translate([0,-len/2,dim/2]) rotate([-90,0,0]) cylinder($fn=80,d=dim,h=len);
            translate([-dim/2,-len/2,dim/2-0.01]) cube([dim,len,ht-dim/2+0.01]);
         }
      }
      /* cut everything off at the top */
      translate([-dim/2,-len/2,0]) cube([dim,len,ht]);
   }
}


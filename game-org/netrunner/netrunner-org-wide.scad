/*
 * This code is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 
 * International License (CC BY-NC-ND 4.0). See https://creativecommons.org/licenses/by-nc-nd/4.0/
 *
 * Copyright (C) Robert B. Ross
 *
 * Note: polyround.scad is released under a different licence, described at the top of 
 *       the polyround.scad file. See https://github.com/Irev-Dev/Round-Anything/blob/master/polyround.scad
 *
 * Notes:
 * - This gets uglier the longer that I work on it.
 *
 * TODO:
 * 20250127:
 *
 * 20250126:
 *   - something at the ends of the chip space to keep chips from getting in the way of the magnets
 *     and also placing them.
 *   - clean up that little top corner where the cardChipSpace peeks out from under the card top
 *   - some sort of latching mechanism on the chip cover so it won't open?
 *     - endcaps with pins through that magnetically attach? need to think more...
 *     - double up magnets on chip cover
 *     - alternatively, go to a "slide on" approach?
 *       - shift chips towards cards to make more room for some sort of channel?
 *       - will want to make a new version before doing this. chip space may have to grow.
 *       - just glue on the end? some sort of cylindrical "link" with alignment holes?
 *
 *   - put in spots for M2 or M2.5 screws in the fake plates on top <defer>
 *
 *   - divot below cards at finger opening to help get them out <DONE>
 *   - add a rectangular form to the top, above cards and dish, to make sure things don't shift around <DONE>
 *   - layers of flipped top 1.3mm - 2.1mm were infill (i.e., too thick a top) -- compress top? <DONE>
 *   - maybe reduce height of the ridge between cards and chips <DONE>
 *   - reduce gap between chip cover and endcaps -- too wide @ current. <DONE>
 *   - just cut the lip around the bottom, consider bevel. <DONE>
 *   - a groove cut in the bottom allowing one to get a finger under the chip cover <DONE>
 *   - reduce thickness of top further (currently magHt+orgWall, I think) <DONE>
 *   - CRITICAL: magnet placement for cards is no longer accurate. <FIXED>
 *   - "overallHt" is conditional and a mess. Clean that up! <FIXED>
 */

/* common view/render options */
showChipTop  = 0;
showBottom   = 0;
showCardTop  = 0;
showCardTopZ = 0.1;
cutAway      = 0;

include <./polyround.scad>

/* fudge to get clean renders, to make things fit */
slop = 0.001;

/* dimensions related to chips */
chipDia       = 41.0;
chipDiaGap    = 1.5; // total gap for both sides
chipCt        = 53;
chipHt        = 3.4;
chipHtGap     = 2; // total gap for both sides

/* dimensions related to cards */
sleeveWid      = 93.0;
sleeveWidGap   = 2; // total gap for both sides
sleeveLen      = 67.0;
sleeveLenGap   = 2; // total gap for both sides
cardStackHt    = 34.5;
cardStackHtGap = 2; // total gap
cardStackLift  = 1.5; // make the card stacks start higher -- leave room for little gap underneath
rightStackOff  = 20; // shift right stack forward (20mm default)

/* dimensions related to placement of things relative to one another */
cardStackGap   = 1.5;
cardChipGap    = 11;
addChipCut = 3;

/* magnet dimensions (6mm dia x 3mm thick) */
magHt = 3.2;
magDia = 6.2;

$fn=40;

chipCoverThick = 3;
endcapExtra1 = chipCoverThick;
endcapExtra2 = endcapExtra1 + 2;

// difference() {
intersection() {
   union() {
      if (showChipTop) /* translate([0,15,15]) */  chipCover();
      if (showCardTop) translate([0,0,showCardTopZ]) fancyTop();
      if (showBottom) fancyBottom();
   }
   if (cutAway) translate([-5,-120,-5]) cube([150,200,100]);
}

// % translate([0,0,orgFloor+cardStackHtGap+cardStackHt+cardStackLift]) cube([300,300,0.1],center=true);
 // translate([0,0,orgFloor+cardStackHtGap+cardStackHt+cardStackLift+magHt+orgWall]) cube([300,300,0.1],center=true);


/* play stuff */
module display() {
   translate([00,-26,40]) cube([40,39,4.6]);
}

module batteryVoid() {
   translate([-90,2,0]) {
     translate([0,0,7.5]) rotate([90,0,90]) cylinder(d=12,h=90);
     translate([0,-6,-slop]) cube([90,12,7.5+slop]);
     translate([0,-5,10-slop]) cube([90,4,12.5+slop]);
   }
}

/* end play stuff */

/* Expand chip space to width of cards, calculate max. chips, shift cards left */
minChipLen    = chipHt * chipCt + chipHtGap;
cardStacksWid = 2*sleeveWid + 2*sleeveWidGap + cardStackGap;
chipLen       = max(minChipLen, cardStacksWid);
cardShiftX    = max(0, (chipLen - cardStacksWid) / 2);

/* dimensions of "dish" between cards */
dishRightGap = 8; /* leave some space on RHS (magnet) */
dishWid      = sleeveWid + sleeveWidGap - dishRightGap;
dishHt       = cardStackHt+cardStackHtGap+cardStackLift;
dishChipGap  = min(cardChipGap,4);
dishLen      = rightStackOff - cardStackGap + (cardChipGap - 4)/2;

/* calculate position of chips -- this puts chips basically right against the gap */
chipSpaceY = (chipDia + chipDiaGap + cardChipGap) / 2;

/* calculate positions of card spots */
leftCardStackX = -1 * (sleeveWid + sleeveWidGap + cardStackGap)/2 - cardShiftX;
leftCardStackY = -1 * (sleeveLen + sleeveLenGap + cardChipGap)/2;
rightCardStackX = (sleeveWid + sleeveWidGap + cardStackGap)/2 + cardShiftX;
rightCardStackY = -1 * ((sleeveLen + sleeveLenGap + cardChipGap)/2);

/* Calculate bounding box */
minX = -chipLen/2;
maxX = chipLen/2;
minY = leftCardStackY - (sleeveLen + sleeveLenGap)/2;
maxY = chipSpaceY + (chipDia + chipDiaGap)/2;
bbWid = maxX - minX;
bbLen = maxY - minY;

/* organizer calculations */
orgWall  = 2.0;
orgFloor = 1.6;
orgCeil  = 1.0; /* exclusive of magHt */
orgWid   = chipLen + 2*orgWall; // FIXME? no longer accurate

intMinX = minX - orgWall;
intMaxX = maxX + orgWall;
intMinY = minY - orgWall;
intMaxY = maxY + orgWall;

extMinX = intMinX - orgWall;
extMaxX = intMaxX + orgWall;
extMinY = intMinY - orgWall;
extMaxY = intMaxY + orgWall;

module voids(finger=true,cLen=chipLen) {
   /* Place chip space */
   translate([0,chipSpaceY,0]) chipSpace(len=cLen);

   /* Place left and right card stack spaces */
   myHt = cardStackHt+cardStackHtGap+cardStackLift+slop;

   translate([leftCardStackX,leftCardStackY,0]) cardSpace(ht=myHt,finger=finger);
   translate([rightCardStackX,rightCardStackY-rightStackOff,0]) cardSpace(ht=myHt,finger=finger);

   /* Place "dish" */
   dishX = rightCardStackX;
   dishY = -(dishChipGap+dishLen)/2;
   translate([dishX, dishY, 0]) dishSpace();

   /* magnet holes */
   magnetHoles();
}

module magnetHoles() {
   /* chips */
   translate([-chipLen/2+5,cardChipGap/2+chipDia/2-8,chipDia/2-magHt-0.5]) cylinder(d=magDia,h=magHt*2);
   translate([-chipLen/2+5,cardChipGap/2+chipDia/2+13,chipDia/2-magHt-0.5]) cylinder(d=magDia,h=magHt*2);
   translate([chipLen/2-5,cardChipGap/2+chipDia/2-8,chipDia/2-magHt-0.5]) cylinder(d=magDia,h=magHt*2);
   translate([chipLen/2-5,cardChipGap/2+chipDia/2+13,chipDia/2-magHt-0.5]) cylinder(d=magDia,h=magHt*2);

   /* cards */
   translate([intMinX+magDia,-0.5,cardStackHt+cardStackHtGap+cardStackLift+orgFloor-magHt]) cylinder(d=magDia,h=magHt*2);
   translate([intMaxX-magDia+1,-3,cardStackHt+cardStackHtGap+cardStackLift+orgFloor-magHt]) cylinder(d=magDia,h=magHt*2);
   translate([-6,intMinY-6,cardStackHt+cardStackHtGap+cardStackLift+orgFloor-magHt]) cylinder(d=magDia,h=magHt*2);
}

module dishSpace() {
   $fn=100;

   myRad = 15;
   myLen = dishLen;
   myWid = dishWid;
   myHt = cardStackHt+cardStackHtGap+cardStackLift+slop;

   hull() {
      translate([-myWid/2 + myRad - dishRightGap/2, 0, myRad]) rotate([90,0,0])
         translate([0,0,-myLen/2]) cylinder(r=myRad,h=myLen);
      translate([myWid/2 - myRad - dishRightGap/2, 0, myRad]) rotate([90,0,0])
         translate([0,0,-myLen/2]) cylinder(r=myRad,h=myLen);
      translate([-dishRightGap/2,0,(myHt-myRad)/2 + myRad]) cube([myWid,myLen,myHt-myRad], center=true);
   }
}

/* fancyBottom() -- bottom with magnet holes plus interior walls to be cut with voids */
module fancyBottom(ht=orgFloor) {
   myHt = ht;

   difference() {
      union() {
         difference() {
            union() {
               linear_extrude(height=cardStackHt+cardStackHtGap+cardStackLift+orgFloor)
                  fancyExterior(expand=0);
            }
            /* slant the back */
            translate([-(extMaxX-extMinX+slop)/2,0.88*chipDia+0.5*cardChipGap,0])
               rotate([-30,0,0]) cube([extMaxX-extMinX+slop,20,20]);
            chipCutBox(ugly=true,cover=false);
         }
         chipCover(cutout=false);
      }
      translate([0,0,orgFloor]) voids(cLen=chipLen-20);

      /* cut out top portion of chip area (chip cover goes there)
       *
       * Note: this is pretty sloppy
       */
      chipCutBox(ugly=false,cover=false);
      magnetHoles();

      /* notch in back for removing chip cover -- NOT DONE */
      translate([-(17)/2,0.88*chipDia+0.5*cardChipGap+7.2,0])
         cube([17,20,20]);

      /* clean bottom surface */
      translate([0,0,-10]) cube([300,300,20], center=true);
   }

   littleAngleBit();
}

module chipCover(cutout=true) {
   $fn=100;

   myCoverDia = chipDia + chipDiaGap + 2*chipCoverThick;
   myStartOff = -orgWid/2;
   greebleCt = 8;

   if (cutout) {
      color("green") difference() {
         intersection() {
            chipForm();
            chipCutBox(ugly=false,cover=true);
         }
         translate([0,chipSpaceY,0]) chipSpace(len=chipLen-20,cube=false);

         /* cut out the thin bit near the Y axis */
         translate([-1*(chipLen-20)/2,chipSpaceY-chipDia/2-1,chipDia/2]) cube([chipLen-20,5,12]);
         
         magnetHoles();
      }
   }
   else {
      chipForm();
   }
}


/* chipCutBox() - cuts out the top of the space for the chip cover
 *
 * Notes:
 * - this is ugly
 * - ugly cuts a big mess and is meant to clean up some parts that otherwise hang around on 
 *   the bottom
 * - inset (without ugly) will allow for creating a little space to help with fitting the cover
 */
module chipCutBox(ugly=true,cover=false) {
   myInset = 0.3; /* gap on L/R sides between cover and bottom */
   myMagSpace = 10; /* soaking up space on either end for magnets */
   myDia = chipDia + chipDiaGap;

   if (ugly) {
      /* this cleans up some corners that I don't want */
      translate([-(intMaxX-intMinX+2*slop)/2,cardChipGap/2,(chipDia+chipDiaGap)/2+orgFloor-addChipCut])
         cube([intMaxX-intMinX+2*slop,chipDia+chipDiaGap+orgWall+slop+10,myDia-chipDia/2+addChipCut+10]);
   } else if (!ugly && !cover) {
      /* this cleanly cuts the interior for the cover */
      if (0) translate([-(chipLen)/2,cardChipGap/2,(chipDia+chipDiaGap)/2+orgFloor-addChipCut])
         cube([chipLen,chipDia+chipDiaGap+orgWall+slop+10,myDia-chipDia/2+addChipCut+10]);
      else translate([-(chipLen)/2,cardChipGap/2,(chipDia+chipDiaGap)/2+orgFloor-addChipCut])
         cube([chipLen,chipDia+chipDiaGap+orgWall+slop+10,myDia-chipDia/2+addChipCut+10]);
   } else /* cover */ {
      /* this cleanly cuts the cover leaving a gap (meant to intersection()) */
      translate([-(chipLen-2*myInset)/2,cardChipGap/2+myInset,(chipDia+chipDiaGap)/2+orgFloor-addChipCut+myInset])
         cube([chipLen-2*myInset,chipDia+chipDiaGap+orgWall+slop+10,myDia-chipDia/2+addChipCut+10]);
   }
}


/* fancyExterior()
 * expand - a way to inset corners to help generate internal volume
 */
module fancyExterior(expand=orgWall) {
   myRad        = 2;
   cornerAdjX   = rightStackOff+5;
   cornerAdjY   = rightStackOff;
   cornerRad    = 4;
   
   exteriorPts = [
                  [0,intMinY-cornerAdjY,cornerRad],
                  [-cornerAdjX/2,intMinY-cornerAdjY/2, cornerRad],
                  [-cornerAdjX,intMinY,cornerRad],

                  [intMinX,intMinY,myRad],
                  [intMinX,intMaxY,myRad],
                  [intMaxX,intMaxY,myRad],
                  [intMaxX,intMinY-cornerAdjY,myRad],
                 ];

   if (expand > 0) {
      minkowski() { polygon(polyRound(exteriorPts,30)); circle(r=expand); }
   } else {
      polygon(polyRound(exteriorPts,30));
   }
}

module seamVoid(x=20,y=20,w=0.6) {
   myRad = 3;
   myHt  = 1;

   difference() {
      hull() {
         translate([-x/2+myRad,-y/2+myRad,0]) cylinder(r=myRad,h=myHt);
         translate([+x/2-myRad,-y/2+myRad,0]) cylinder(r=myRad,h=myHt);
         translate([-x/2+myRad,+y/2-myRad,0]) cylinder(r=myRad,h=myHt);
         translate([+x/2-myRad,+y/2-myRad,0]) cylinder(r=myRad,h=myHt);
      }
      translate([0,0,-slop]) hull() {
         translate([-x/2+myRad,-y/2+myRad,0]) cylinder(r=myRad-w,h=myHt+2*slop);
         translate([+x/2-myRad,-y/2+myRad,0]) cylinder(r=myRad-w,h=myHt+2*slop);
         translate([-x/2+myRad,+y/2-myRad,0]) cylinder(r=myRad-w,h=myHt+2*slop);
         translate([+x/2-myRad,+y/2-myRad,0]) cylinder(r=myRad-w,h=myHt+2*slop);
      }
   }
}

/* fancyTop()
 * inset - a way to inset corners to help generate internal volume
 */
module fancyTop() {
   myTopGap = 0.5; // space around the bottom walls and "ceiling" so top slides on/off
   myHt = cardStackHt+cardStackHtGap+cardStackLift+myTopGap+magHt+orgCeil;

   color("blue") difference() {
      /* note: this results in a top that is orgCeil+magHt thick, with a bevel orgWall tall */
      translate([0,0,orgFloor+slop]) {
         linear_extrude(height=myHt-orgWall) fancyTopShape(expand=orgWall+myTopGap);
         translate([0,0,myHt-orgWall]) minkowski() {
            linear_extrude(height=slop) fancyTopShape(expand=myTopGap);
            cylinder(r1=orgWall,r2=slop,h=orgWall);
         }
      }
      hull() chipCover(cutout=false);
      translate([0,0,orgFloor]) linear_extrude(height=cardStackHt+cardStackHtGap+cardStackLift) fancyExterior(expand=myTopGap);

      /* clean bottom surface */
      translate([0,0,-10]) cube([300,300,20], center=true);

      /* this rounds out things on the sides */
      /* note: fudging here b/c orgWid is no longer accurate */
      translate([-(orgWid+10)/2,-30+cardChipGap/2,-slop]) {
         cube([orgWid + 10, 30, cardStackHt-2], center = false);
         rotate([0,90,0]) cylinder($fn=160,r=cardStackHt-2,h=orgWid+10);
      }

      magnetHoles();

      randomCut();
      littleAngleBit(cutout=true);

      translate([leftCardStackX,leftCardStackY-sleeveLen/2,0]) holes(wid=10);
      translate([rightCardStackX,rightCardStackY-sleeveLen/2-rightStackOff,0]) holes();

      translate([leftCardStackX-14, leftCardStackY, myHt+1]) seamVoid(x=sleeveLen-4,y=sleeveLen-4);
      translate([rightCardStackX, rightCardStackY-8, myHt+1]) seamVoid(x=sleeveWid-14,y=sleeveWid-20);
   }

   /* add some bits back in */
   translate([leftCardStackX, leftCardStackY, cardStackHt+cardStackHtGap+cardStackLift+orgWall]) fancyTopCardHolder();
   translate([rightCardStackX, rightCardStackY-rightStackOff, cardStackHt+cardStackHtGap+cardStackLift+orgWall]) fancyTopCardHolder();
}

module randomCut(fudge=-1) {
   myRad=6;

   translate([-(orgWid+10)/2,cardChipGap/2-myRad+fudge,cardStackHt-2-2*slop]) {
      difference() {
         cube([orgWid + 20, myRad, myRad], center = false);
         translate([0,0,myRad]) rotate([0,90,0]) cylinder($fn=80,r=myRad+slop,h=orgWid+20+slop);
      }
   }
}


module holes(wid=16) {
   translate([-38,6,9]) rotate([90,0,0]) for (i=[0:2]) {
      for (j=[0:wid-1]) {
         translate([5*j+2.5*(i%2),5*i,0]) cylinder(r=1.25,h=14);
      }
   }	
}

module fancyTopShape(expand=0) {
   myRad        = 2;
   cornerAdjX   = rightStackOff+5;
   cornerAdjY   = rightStackOff;
   cornerRad    = 4;
   
   exteriorPts = [
                  [0,intMinY-cornerAdjY,cornerRad],
                  [-cornerAdjX/2,intMinY-cornerAdjY/2, cornerRad],
                  [-cornerAdjX,intMinY,cornerRad],

                  [intMinX,intMinY,myRad],
                  [intMinX,orgWall,myRad],
                  [intMaxX,orgWall,myRad],
                  [intMaxX,intMinY-cornerAdjY,myRad],
                 ];

   if (expand > 0) {
      minkowski() { polygon(polyRound(exteriorPts,30)); circle(r=expand); }
   } else {
      polygon(polyRound(exteriorPts,30));
   }
}

module intVolume(ht) {
   intRad = 1;
   intHt  = ht + orgFloor-slop;
   // orgWall

   linear_extrude(height=intHt) minkowski() { projection() voids(finger=false); circle(r=orgWall); }
}

/* volume for holding stack of chips */
module chipSpace(len,cube=true) {
   myLen = len;
   myDia = chipDia + chipDiaGap;

   hull() {
      rotate([0,-90,0]) translate([myDia/2,0,-myLen/2]) cylinder($fn=90, h=myLen, d=myDia);
      if (cube) translate([0,0,3*myDia/4]) cube([myLen,myDia,myDia/2], center=true);
   }
}

module fancyTopCardHolder(ht=1.0) {
   fingerRad =12;
   myWid = sleeveWid + sleeveWidGap-8;
   myLen = sleeveLen + sleeveLenGap-8;
   myHt  = ht - cardStackLift;
  
   hull() {
      translate([0,0,0+slop]) minkowski() { cube([myWid, myLen, 0.1],center=true); cylinder(d=4,h=0.1); }
      translate([0,0,-ht+slop]) minkowski() { cube([myWid-2*ht, myLen-2*ht, 0.1],center=true); cylinder(d=4,h=0.1); }
   }
}

/* volume for a single stack of cards, centered in XY, card bottoms at X plane */
module cardSpace(ht,finger=true) {
   fingerRad =12;
   myWid = sleeveWid + sleeveWidGap;
   myLen = sleeveLen + sleeveLenGap;
   myHt  = ht - cardStackLift;
  
   translate([0,0,myHt/2 + cardStackLift]) cube([myWid, myLen, myHt],center=true);

   /* this cuts below bottom of cards to allow easier removal */
   if (finger) {
      translate([0,-myLen/2-4,fingerRad/2+cardStackLift/4]) rotate([-90,0,0]) scale([1,0.5,1]) cylinder(r=fingerRad,h=10);
      translate([-fingerRad,-myLen/2-4,fingerRad/2+cardStackLift/4]) cube([fingerRad*2,10,myHt-fingerRad/2+slop+cardStackLift*.75]);
   }
}

module corner() {
   myLen = 25;
   myRad = 1;
   myDep = 2;
   
   pts = [
            [0, 0, 0.01],
            [0, myLen, 0.01],
            [0.35*myLen, myLen, myRad],
            [myLen, 0.35*myLen, myRad],
            [myLen, 0, 0.01],
         ];

   linear_extrude(height=myDep) polygon(polyRound(pts,10));
   translate([0,myDep,0]) rotate([90,0,0]) linear_extrude(height=myDep)
      polygon(polyRound(pts,10));
   translate([myDep,0,0]) rotate([0,-90,0]) linear_extrude(height=myDep)
     polygon(polyRound(pts,10));
}

% chipForm();

sleeve(expand=0.5);


/* sleeve() -- generates a form for cutting a sleeve running in the X direction centered at 
 *              [0, chipSpaceY, (chipDia+chipDiaGap)/2].
 *
 */
module sleeve(len=10, expand=0) {
   myIntRad     = (chipDia+chipDiaGap)/2;
   myChannelDep = myIntRad/2;
   myArmThick   = 2.0;
   offset       = 1.5;
   overshoot    = 40;

   sleeveCutPts = [
                     [-myIntRad-offset+expand, -expand, 1],
                     [-myIntRad-offset+expand, -myChannelDep+expand, 5],
                     [-myIntRad-offset+expand+2, -myChannelDep-2+expand, 10],
                     [-myIntRad-offset+expand+1, -myChannelDep-6-3*expand, 10],
                     [-myIntRad-offset-expand-myArmThick, -myChannelDep-expand, 5],
                     [-myIntRad-offset-expand-myArmThick, -expand, 1],
                     [-myIntRad-overshoot/2, -expand, 1],
                     [-myIntRad-overshoot/2, myIntRad+overshoot, 1],
                     [+slop, myIntRad+overshoot, .001],
                     [+slop, -expand, .001],
                  ];

   translate([0,chipSpaceY,myIntRad]) rotate([90,0,90]) translate([0,0,-len/2]) linear_extrude(height=len) union() {
         for (i=[0:1]) mirror([i,0,0]) polygon(polyRound(sleeveCutPts,10));
         circle($fn=40,d=chipDia+chipDiaGap+expand);
      }
}



module chipForm() {
   $fn=200;

   myCoverDia = chipDia + chipDiaGap + 2*chipCoverThick;
   myStartOff = -orgWid/2;
   greebleCt = 8;

   for (i=[0:greebleCt-1]) 
      translate([myStartOff + i*orgWid/(greebleCt-1), chipSpaceY, (chipDia + chipDiaGap)/2]) endcap();

   translate([0, chipSpaceY, (chipDia+chipDiaGap)/2]) rotate([0,90,0])
      translate([0,0,-orgWid/2]) cylinder(d=myCoverDia, h=orgWid);
}

module endcap() {
   myEndcapHt = 11;

   myDia1 = chipDia + chipDiaGap + 2*chipCoverThick + endcapExtra1;
   myDia2 = chipDia + chipDiaGap + 2*chipCoverThick + endcapExtra2;
   mySlantHt = myDia2 - myDia1;
   myDia3 = 25; /* little cutout in the end */
   myDia4 = myDia3 - mySlantHt;
   cutoutHt = 1;

   translate([myEndcapHt/2,0,0]) rotate([0,-90,0]) {
      if (1) difference() {
         union() {
            cylinder(d1=myDia1, d2=myDia2, h = mySlantHt);
            translate([0,0,mySlantHt-slop/2]) cylinder(d=myDia2, h=myEndcapHt-2*mySlantHt+slop);
            translate([0,0,myEndcapHt - mySlantHt]) cylinder(d2=myDia1, d1=myDia2, h = mySlantHt);
         }
         translate([0,0,myEndcapHt - cutoutHt+slop]) cylinder(d2=myDia3, d1=myDia4, h = cutoutHt);
         translate([0,0,-cutoutHt-2*slop]) cylinder(d1=myDia3, d2=myDia4, h = cutoutHt);
         translate([0,0,-slop]) cylinder(d1=myDia3, d2=myDia4, h = cutoutHt);
      }
   }
}

module littleAngleBit(cutout=false) {
   myInset = (cutout) ? 0.5: 0.25;

   translate([0,1.5,cardStackHt+cardStackGap+cardStackLift+orgFloor+0.25]) rotate([45,0,0]) cube([orgWid-40+2*myInset,2.75+myInset,2.75+myInset],center=true);
}

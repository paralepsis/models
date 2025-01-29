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
 *
 * TODO:
 * 20250129:
 *
 * 20250128:
 *   - consider cutting back right greeble off for printing flat
 *
 * 20250127:
 *   - need to look at back left. cover isn't complete.
 *
 *   - put in spots for M2 or M2.5 screws in the fake plates on top <defer>
 */

include <./polyround.scad>

/* fudge to get clean renders, to make things fit */
slop = 0.001;

/* dimensions related to chips */
chipDia       = 41.0;
chipDiaGap    = 1.5; // total gap for both sides
chipCt        = 53;
chipHt        = 3.4;
chipHtGap     = 2; // total gap for both sides
chipGreebleCt = 8;

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
cardChipGap    = 11; // 12 is def. good.
addChipCut = 3;

/* magnet dimensions (6mm dia x 3mm thick) */
magHt = 3.2;
magDia = 6.2;

$fn=40;

chipCoverThick    = 2;
endcapExtra1      = chipCoverThick;
endcapExtra2      = endcapExtra1 + 2;
endcapCutoutDia   = 25;
endcapCutoutSlant = endcapExtra2 - endcapExtra1;

/* VIEWS HERE */

/* common view/render options */
showChipCover              = 1;
showChipCoverGreeble       = 1;
showChipCoverGreebleCenter = 1;
showChipCoverGreebleBump   = 1;
showBottom     = 0;
showCardCover  = 0;
showCardTopZ   = 0.1;
cutAway        = 0;

intersection() {
   union() {
      if (showChipCover) translate([0,0,0])  chipCover();
      if (showCardCover) translate([0,0,showCardTopZ]) cardCover();
      if (showBottom) fancyBottom();
      if (showChipCoverGreeble) translate([-20,0,0]) chipCoverGreeble();
      if (showChipCoverGreebleCenter) translate([-10,0,0]) chipCoverGreebleCenter();
      if (showChipCoverGreebleCenter) translate([-10,0,0]) chipCoverGreebleBump();
   }
   if (cutAway) translate([-25,-120,-5]) cube([150,200,100]);
}

/* Expand chip space to width of cards, calculate max. chips, shift cards left */
minChipLen    = chipHt * chipCt + chipHtGap;
cardStacksWid = 2*sleeveWid + 2*sleeveWidGap + cardStackGap;
chipLen       = max(minChipLen, cardStacksWid);

/* dimensions of "dish" between cards */
dishRightGap = 8; /* leave some space on RHS (magnet) */
dishWid      = sleeveWid + sleeveWidGap - dishRightGap;
dishHt       = cardStackHt+cardStackHtGap+cardStackLift;
dishChipGap  = min(cardChipGap,4);
dishLen      = rightStackOff - cardStackGap + (cardChipGap - 4)/2;

/* calculate position of chips -- this puts chips basically right against the gap */
chipSpaceY = (chipDia + chipDiaGap + cardChipGap) / 2;
chipSpaceZ = (chipDia+chipDiaGap)/2+chipCoverThick;

/* calculate positions of card spots */
leftCardStackX = -1 * (sleeveWid + sleeveWidGap + cardStackGap)/2;
leftCardStackY = -1 * (sleeveLen + sleeveLenGap + cardChipGap)/2;
rightCardStackX = (sleeveWid + sleeveWidGap + cardStackGap)/2;
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
orgCeil  = 0.4; /* exclusive of magHt. This leaves ~1.3mm of space between top and 3mm magnets. */

orgWid   = chipLen + 2*orgWall; // FIXME? no longer accurate

/* exterior dimensions for bottom (interior of top, kind of) */
intMinX = minX - orgWall;
intMaxX = maxX + orgWall;
intMinY = minY - orgWall;
intMaxY = maxY + orgWall;

/* exterior dimensions of top */
extMinX = intMinX - orgWall;
extMaxX = intMaxX + orgWall;
extMinY = intMinY - orgWall;
extMaxY = intMaxY + orgWall;



/* voids() - This generates all the voids for the bottom, called from fancyBottom()
 * 
 * Note:
 * - I've been inconsistent about heights -- tried to pull all the orgFloor into here...
 * - FIXME: Scope creep here -- probably the chip tray leftovers should be elsewhere
 */
module voids(finger=true) {
   myHt  = orgFloor+cardStackHt+cardStackHtGap+cardStackLift;
   myLen = chipLen-2;

   /* Place chip void and cut space for sleeve */
   translate ([myLen/2-2,0,0]) chipVoid(len=myLen-6,sloppy=true,center=false);
   translate ([-3,0,0]) chipSleeve(cutLen=0.8*chipLen+6,sleeveLen=chipLen+5,void=true);


   /* Place left and right card stack spaces */
   translate([leftCardStackX,leftCardStackY,orgFloor]) cardVoid(ht=myHt+slop,finger=finger);
   translate([rightCardStackX,rightCardStackY-rightStackOff,orgFloor]) cardVoid(ht=myHt+slop,finger=finger);

   /* Place "dish" */
   dishX = rightCardStackX;
   dishY = -(dishChipGap+dishLen)/2;
   translate([dishX, dishY, orgFloor]) dishVoid();

   /* weird leftovers in chip tray 
    * Notes:
    *   - orgFloor is ignored in that part of the organizer 
    *   - I'm not sure why I need the 0.8?
    */
   translate([0,0,0.8]) intersection() {
      translate([-chipLen/2-3,chipSpaceY,chipDia/2+chipDiaGap]) {
         rotate([0,90,0]) cylinder(d=chipDia+2*chipDiaGap+2*chipCoverThick,h=8+slop);
      }
      translate([-chipLen/2-3,cardChipGap/2,chipDia/2+chipCoverThick])
         cube([8+slop,chipDia+2*chipDiaGap+2*chipCoverThick,chipDia/2+chipDiaGap]);
   }

   /* magnet holes */
   translate([0,0,0]) magnetVoids();
}

/* magnetVoids()
 * 
 * Notes:
 *   - Called for card bottom by voids()
 *   - Called for card top directly from cardCover
 */
module magnetVoids() {
   myUnderTopHt = cardStackHt+cardStackHtGap+cardStackLift+orgFloor-magHt;

   /* cards */
   translate([intMinX+magDia,-0.5,myUnderTopHt]) cylinder(d=magDia,h=magHt*2);
   translate([intMaxX-magDia+1,-3,myUnderTopHt]) cylinder(d=magDia,h=magHt*2);
   translate([-6,intMinY-6,myUnderTopHt]) cylinder(d=magDia,h=magHt*2);

   /* endcap of chips */
   translate([intMinX,chipSpaceY,chipDia/3+chipCoverThick]) rotate([0,90,0]) {
      //translate([0,0,-magHt-2]) cylinder(d2=magDia,d1=2,h=1);
      translate([0,0,-magHt]) cylinder(d=magDia,h=magHt*2);
      translate([0,0,+magHt-slop]) cylinder(d1=magDia,d2=2,h=2+slop);
   }
   if (0) translate([intMinX,chipSpaceY+17.5,chipDia/3+chipCoverThick]) rotate([0,90,0]) {
      translate([0,0,-magHt-2]) cylinder(d2=magDia,d1=2,h=2+slop);
      translate([0,0,-magHt]) cylinder(d=magDia,h=magHt*2);
      translate([0,0,+magHt-slop]) cylinder(d1=magDia,d2=2,h=2+slop);
   }
}

module dishVoid() {
   $fn=100;

   myRad = 15;
   myHt = cardStackHt+cardStackHtGap+cardStackLift+slop;

   hull() {
      translate([-dishWid/2 + myRad - dishRightGap/2, 0, myRad]) rotate([90,0,0])
         translate([0,0,-dishLen/2]) cylinder(r=myRad,h=dishLen);
      translate([dishWid/2 - myRad - dishRightGap/2, 0, myRad]) rotate([90,0,0])
         translate([0,0,-dishLen/2]) cylinder(r=myRad,h=dishLen);
      translate([-dishRightGap/2,0,(myHt-myRad)/2 + myRad]) cube([dishWid,dishLen,myHt-myRad], center=true);
   }
}

/* fancyBottom() -- bottom with magnet holes plus interior walls to be cut with voids */
module fancyBottom(ht=orgFloor) {
   myHt = ht;
   myWid = extMaxX-extMinX-2*orgWall; // kind of the min/max of the card area including walls of bottom

   difference() {
      basicBottomForm();

      /* cut out card and chip voids */
      voids();

      /* clean bottom surface */
      translate([0,0,-10]) cube([300,300,20], center=true);
   }

   /* just a little alignment bit between cards and chips */
   littleAngleBit();
}

module basicBottomForm(allGreebles=false) {
   myWid = extMaxX-extMinX-2*orgWall; // kind of the min/max of the card area including walls of bottom

   difference() {
      union() {
         linear_extrude(height=cardStackHt+cardStackHtGap+cardStackLift+orgFloor)
            fancyCardExterior(expand=0);
         translate([-myWid/2,cardChipGap/2-slop-orgWall,0]) cube([myWid,chipDia+orgWall,chipDia/2]);
      }

      /* slant the back -- FIXME ugly Y calc */
      translate([-(myWid+slop)/2,0.80*chipDia+0.5*cardChipGap,0])
         rotate([-30,0,0]) cube([myWid+slop,20,20]);
   }
   if (allGreebles) {
      chipForm(start=0,end=7);
   } else {
      chipForm(start=1,end=7);
   }
}


/* fancyCardExterior()
 * expand - a way to inset corners to help generate internal volume
 *
 */
module fancyCardExterior(expand=orgWall) {
   myRad        = 2;
   cornerAdjX   = rightStackOff+5;
   cornerAdjY   = rightStackOff;
   cornerRad    = 4;
   
   exteriorPts = [
                  [0,intMinY-cornerAdjY,cornerRad],
                  [-cornerAdjX/2,intMinY-cornerAdjY/2, cornerRad],
                  [-cornerAdjX,intMinY,cornerRad],

                  [intMinX,intMinY,myRad],
                  [intMinX,cardChipGap/2,myRad],
                  [intMaxX,cardChipGap/2,myRad],
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

/* cardCover()
 *
 * TODO:
 * - THIS IS MESSY!
 */
module cardCover() {
   myTopGap = 0.5; // space around the bottom walls and "ceiling" so top slides on/off
   myHt = cardStackHt+cardStackHtGap+cardStackLift+myTopGap+magHt+orgCeil;
   fudge = 0.5; /* (partially) addresses alignment with bottom near chips */

   color("blue") difference() {
      /* note: this results in a top that is orgCeil+magHt thick, with a bevel orgWall tall */
      translate([0,0,orgFloor+slop]) {
         linear_extrude(height=myHt-orgWall) fancyTopShape(expand=orgWall+myTopGap, fudge=fudge);
         translate([0,0,myHt-orgWall]) minkowski() {
            linear_extrude(height=slop) fancyTopShape(expand=myTopGap, fudge=fudge);
            cylinder(r1=orgWall,r2=slop,h=orgWall);
         }
      }

      /* make sure we aren't bumping the chip holding area (could be more robust) */
      hull() chipForm();

      /* cut out the interior, but not the "outsets" */
      difference() {
         translate([0,0,orgFloor]) linear_extrude(height=cardStackHt+cardStackHtGap+cardStackLift) fancyCardExterior(expand=myTopGap);

          /* Place left and right card stack "outsets" (void insets?...) */
          translate([leftCardStackX,leftCardStackY,myHt+slop-orgCeil-magHt]) topOutset();
          translate([rightCardStackX,rightCardStackY-rightStackOff,myHt+slop-orgCeil-magHt]) topOutset();
      }

      /* this rounds out things on the sides */
      /* note: FIXME fudging here b/c orgWid is no longer accurate */
      translate([-(orgWid+10)/2,-30+cardChipGap/2,-slop]) {
         cube([orgWid + 10, 30, cardStackHt-2], center = false);
         rotate([0,90,0]) cylinder($fn=160,r=cardStackHt-2,h=orgWid+10);
      }
      /* ... and this gets the bottom edge where cards and chips come together */
      translate([0,fudge,0]) backEdgeBevel();

      /* cut out magnet holes in top */
      magnetVoids();

      /* just a little alignment bit between cards and chips */
      littleAngleBit(cutout=true);

      /* little holes in the front, kind of a "grill" */
      translate([leftCardStackX,leftCardStackY-sleeveLen/2,0]) holes(wid=10);
      translate([rightCardStackX,rightCardStackY-sleeveLen/2-rightStackOff,0]) holes();

      /* add cosmetic seams on top surface */
      translate([leftCardStackX-14, leftCardStackY, myHt+1]) seamVoid(x=sleeveLen-4,y=sleeveLen-4);
      translate([rightCardStackX, rightCardStackY-8, myHt+1]) seamVoid(x=sleeveWid-14,y=sleeveWid-20);
   }

}

/* backEdgeBevel() - creates a shape to be used to bevel the edge between top and chips
 *
 */
module backEdgeBevel(fudge=-1) {
   myRad=6;

   translate([-(orgWid+10)/2,cardChipGap/2-myRad+fudge,cardStackHt-2-2*slop]) {
      difference() {
         cube([orgWid + 20, myRad, myRad], center = false);
         translate([0,0,myRad]) rotate([0,90,0]) cylinder($fn=80,r=myRad+slop,h=orgWid+20+slop);
      }
   }
}


/* holes() - creates a pattern of 2.5mm holes for cosmetic "grill"
 */
module holes(wid=16) {
   translate([-38,6,9]) rotate([90,0,0]) for (i=[0:2]) {
      for (j=[0:wid-1]) {
         translate([5*j+2.5*(i%2),5*i,0]) cylinder(r=1.25,h=14);
      }
   }	
}

module fancyTopShape(expand=0,fudge=0) {
   myRad        = 2;
   cornerAdjX   = rightStackOff+5;
   cornerAdjY   = rightStackOff;
   cornerRad    = 4;

   exteriorPts = [
                  [0,intMinY-cornerAdjY,cornerRad],
                  [-cornerAdjX/2,intMinY-cornerAdjY/2, cornerRad],
                  [-cornerAdjX,intMinY,cornerRad],

                  [intMinX,intMinY,myRad],
                  [intMinX,orgWall+fudge,myRad],
                  [intMaxX,orgWall+fudge,myRad],
                  [intMaxX,intMinY-cornerAdjY,myRad],
                 ];

   if (expand > 0) {
      minkowski() { polygon(polyRound(exteriorPts,30)); circle(r=expand); }
   } else {
      polygon(polyRound(exteriorPts,30));
   }
}


/* chipVoid() - volume for holding stack of chips
 */
module chipVoid(len=chipLen,sloppy=true,center=true) {
   myLen = len;
   myDia = chipDia + chipDiaGap;
   myOff = (center) ? 0 : -len/2;

   if (sloppy) translate([myOff,chipSpaceY,chipCoverThick]) rotate([0,-90,0]) translate([myDia/2,0,-myLen/2])
      cylinder($fn=90, h=myLen, d=myDia+slop);
   else translate([myOff,chipSpaceY,chipCoverThick]) rotate([0,-90,0]) translate([myDia/2,0,-myLen/2])
      cylinder($fn=90, h=myLen, d=myDia);
}

/* topOutset() - creates a raised region under the top that slightly intrudes into the card space,
 *               keeping cards from going anywhere
 */
module topOutset(ht=1.0) {
   fingerRad =12;
   myWid = sleeveWid + sleeveWidGap-8;
   myLen = sleeveLen + sleeveLenGap-8;
  
   hull() {
      translate([0,0,ht+slop]) minkowski() { cube([myWid, myLen, 0.1],center=true); cylinder(d=4,h=0.1); }
      translate([0,0,0]) minkowski() { cube([myWid-2*ht, myLen-2*ht, 0.1],center=true); cylinder(d=4,h=0.1); }
   }
}

/* volume for a single stack of cards, centered in XY, card bottoms at X plane */
module cardVoid(ht,finger=true) {
   fingerRad =12;
   myWid = sleeveWid + sleeveWidGap;
   myLen = sleeveLen + sleeveLenGap;
   myHt  = ht - cardStackLift;
  
   translate([0,0,myHt/2 + cardStackLift]) cube([myWid, myLen, myHt],center=true);

   /* this cuts below bottom of cards to allow easier removal */
   if (finger) {
      translate([0,-myLen/2-4,fingerRad/2+cardStackLift/4]) rotate([-90,0,0]) scale([1,0.5,1])
         cylinder(r=fingerRad,h=10);
      translate([-fingerRad,-myLen/2-4,fingerRad/2+cardStackLift/4])
         cube([fingerRad*2,10,myHt-fingerRad/2+slop+cardStackLift*.75]);
   }
}

module chipCover() {
   translate ([0,0,0]) difference() {
      intersection() {
         basicBottomForm(allGreebles=true);
         translate ([-1,0,0]) chipSleeve(cutLen=0.8*chipLen,sleeveLen=chipLen+.5,void=false);
      }

      /* cut out space for chips underneath */
      translate ([chipLen/2,0,0]) chipVoid(len=chipLen-6,sloppy=true,center=false);

      /* weird, but sort of a cutout to get the greebles back on the side near the chips */
      translate([0,0,0]) difference() {
         translate([-orgWid/2,-cardChipGap/2,chipSpaceZ+9.5])
            cube([orgWid,chipDia,chipDia]);
         chipForm(start=1,end=7);
      }

      /* cut a bit off the LHS (IS THIS THE BEST WAY TO DO THIS?) */
      translate([-chipLen/2+.5, chipSpaceY, chipSpaceZ])
         rotate([0,-90,0]) cylinder(d=chipDia+chipDiaGap+2*chipCoverThick+18,h=4);

      /* chamfer inside of RHS */
      translate([chipLen/2-4,chipSpaceY,chipSpaceZ])
         rotate([0,90,0]) cylinder($fn=120,d1=chipDia+chipDiaGap, d2=chipDia+chipDiaGap+1.5,h=4);
   }
}


/* WORKING */

/* chipCoverGreeble() - this is the back LHS greeble, with a cutout in the middle so it may be printed flat
 */
module chipCoverGreeble() {
   difference() {
      chipCoverGreebleForm();

      /* do the cutout, difference()'ing in this case */
      chipCoverGreebleCutout();
      chipCoverGreebleBumpCutout(expand=0.01);
   }
}

module chipCoverGreebleCenter() {
   intersection() {
      chipCoverGreebleForm();

      /* do the cutout, intersection()'ing in this case */
      chipCoverGreebleCutout(expand=-0.2);
   }
}

/* chipCoverGreebleBump() - little bump that covers the channel hole
 */
module chipCoverGreebleBump() {
   intersection() {
      chipCoverGreebleForm();

      /* do the cutout, intersection()'ing in this case */
      chipCoverGreebleBumpCutout(expand=-0.2);
   }
}

module chipCoverGreebleBumpCutout(expand=0) {

   /* little rounded bit off to side to cover channel hole */
   translate([-chipLen/2-2.25-expand,chipSpaceY-23, chipSpaceZ-7]) rotate([0,-90,0]) {
      translate([0,0,-8]) cylinder($fn=60,d=19+expand,h=3+8+expand);
      translate([0,0,3+expand-slop]) cylinder($fn=60,d1=19+expand,d2=15+expand,h=2);

      /* key */
      rotate([0,0,-60]) translate([-9.5,0,-8]) cylinder($fn=60,d=4+expand,h=3+8);
   }
}

module chipCoverGreebleForm() {
   difference() {
      /* basic form, although it starts off too long */
      union() {
         chipForm(start=0,end=0);

         /* little rounded bit off to side to cover channel hole */
         translate([-chipLen/2-2.25,chipSpaceY-23, chipSpaceZ-7]) rotate([0,-90,0]) {
            cylinder($fn=60,d=19,h=3);
            translate([0,0,3-slop]) cylinder($fn=60,d1=19,d2=15,h=2);
         }
      }

      /* remove top half of cylinder at right location to overhang bottom */
      translate([-chipLen/2+0.5-slop, chipSpaceY, chipSpaceZ])
         rotate([0,90,0]) cylinder(d=chipDia+chipDiaGap+2*chipCoverThick+8,h=chipLen+8);

      /* remove bottom half to match with tray LHS back edge */
      translate([-chipLen/2+2.75, chipSpaceY, (chipSpaceZ+0.5)/2])
         cube([10,chipDia+chipDiaGap+2*chipCoverThick+10,(chipDia+chipDiaGap+2*chipCoverThick+1)/2],center=true);

      /* remove below XY plane to match rest of organizer */
      translate([-chipLen/2-10, chipSpaceY, -5+slop])
         cube([30,chipDia+chipDiaGap+2*chipCoverThick+10,10],center=true);

      /* cut out magnet */
      magnetVoids();
   }
}

module chipCoverGreebleCutout(expand=0) {
   myDia = endcapCutoutDia-endcapCutoutSlant;

   /* remove center of endcap, will fill in with separate piece (chipCoverGreebleCenter()) */
   translate([-chipLen/2-15+expand, chipSpaceY, chipSpaceZ])
      rotate([0,90,0]) cylinder($fn=80,d=myDia+expand,h=16);

   /* chamfer cutout on the interior where the center goes */
   translate([-chipLen/2-8+expand, chipSpaceY, chipSpaceZ]) rotate([0,90,0])  {
      cylinder(d1=myDia+expand,d2=myDia+4+expand,h=2);
      translate([0,0,2-slop]) cylinder(d=myDia+4+expand,h=8);
   }
}

/* chipSleeve() -- generates a form for cutting a sleeve running in the X direction centered at 
 *              [0, chipSpaceY, chipSpaceZ].
 *
 */
module chipSleeve(cutLen=10, sleeveLen=20, void=false) {
   myIntRad     = chipSpaceZ; // FIXME remove this var
   myArmThick   = 3;
   myOffset     = 0.3;
   overshoot    = 40;
   bigDia       = chipDia+chipDiaGap+2*chipCoverThick+endcapExtra2;

   if (void) /* this is a void */ {
      difference() {
         translate([0,chipSpaceY,myIntRad]) rotate([90,0,90]) translate([0,0,-sleeveLen/2])
            linear_extrude(height=sleeveLen) intersection() {
            translate([-bigDia/2,0]) square([bigDia+slop,bigDia+slop]);
            circle($fn=80,d=bigDia+myOffset);
         }
         chipVoid(len=sleeveLen,sloppy=false);
      }
      translate([0,chipSpaceY,myIntRad]) rotate([90,0,90]) translate([0,0,-sleeveLen/2]) 
         linear_extrude(height=cutLen) rotate(-12) {
         translate([-bigDia/2+3/2,-7.5+slop]) square([myArmThick,15],center=true);
         translate([-bigDia/2+2.0,-15]) scale([1,1.1]) circle($fn=30, d=5);
      }
   }
   else /* intersecting to get a part */ {
      translate([0,chipSpaceY,myIntRad]) rotate([90,0,90]) translate([0,0,-sleeveLen/2])
         linear_extrude(height=sleeveLen) intersection() {
         translate([-bigDia/2,myOffset]) square([bigDia+slop,bigDia+slop-myOffset]);
         circle($fn=80,d=bigDia);
      }
      translate([0,chipSpaceY,myIntRad]) rotate([90,0,90]) translate([0,0,-sleeveLen/2]) 
         linear_extrude(height=cutLen) rotate(-12) {
         translate([-bigDia/2+3/2,-7.5+slop]) square([myArmThick-2*myOffset,15],center=true);
         translate([-bigDia/2+2.0,-15]) scale([1,1.1]) circle($fn=30,d=5-2*myOffset);
      }
   }
}


module chipForm(start=0,end=7) {
   $fn=200;

   myCoverDia = chipDia + chipDiaGap + 2*chipCoverThick;
   myEndcapHt = 11;
   myStartOff = -orgWid/2-myEndcapHt/2-0.5+3;
   myTotWid   = -2*myStartOff;
   greebleCt  = chipGreebleCt; /* numbered [ 0 .. greebleCt-1 ] */

   for (i=[start:end]) 
      translate([myStartOff + i*myTotWid/(greebleCt-1), chipSpaceY, myCoverDia/2]) endcap(ht=myEndcapHt);

   translate([0, chipSpaceY, myCoverDia/2]) rotate([0,90,0])
      translate([0,0,-(myTotWid-myEndcapHt/2)/2]) cylinder(d=myCoverDia, h=myTotWid-myEndcapHt/2);
}

module endcap(ht=10) {
   myEndcapHt = ht;
   myCoverDia = chipDia + chipDiaGap + 2*chipCoverThick;

   myDia1 = chipDia + chipDiaGap + 2*chipCoverThick + endcapExtra1;
   myDia2 = chipDia + chipDiaGap + 2*chipCoverThick + endcapExtra2;
   mySlantHt = myDia2 - myDia1;
   myDia3 = endcapCutoutDia;
   myDia4 = myDia3 - endcapCutoutSlant;
   cutoutHt = 1;


   translate([myEndcapHt/2,0,0]) rotate([0,-90,0]) {
      if (1) difference() {
         union() {
            cylinder(d1=myCoverDia, d2=myDia2, h = mySlantHt);
            translate([0,0,mySlantHt-slop/2]) cylinder(d=myDia2, h=myEndcapHt-2*mySlantHt+slop);
            translate([0,0,myEndcapHt - mySlantHt]) cylinder(d2=myCoverDia, d1=myDia2, h = mySlantHt);
         }
         translate([0,0,myEndcapHt - cutoutHt+slop]) cylinder(d2=myDia3, d1=myDia4, h = cutoutHt);
         translate([0,0,-cutoutHt-2*slop]) cylinder(d1=myDia3, d2=myDia4, h = cutoutHt);
         translate([0,0,-slop]) cylinder(d1=myDia3, d2=myDia4, h = cutoutHt);
      }
   }
}

module littleAngleBit(cutout=false) {
   myInset = (cutout) ? 0.5: 0.25;

   translate([0,1.5,cardStackHt+cardStackGap+cardStackLift+orgFloor+0.25]) rotate([45,0,0])
      cube([orgWid-40+2*myInset,2.75+myInset,2.75+myInset],center=true);
}

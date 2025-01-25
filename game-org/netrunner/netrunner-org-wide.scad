include <./polyround.scad>

/* fudge to get clean renders, to make things fit */
slop = 0.001;
bigSlop = 0.5;

/* dimensions related to chips */
chipDia       = 41.0;
chipDiaGap    = 1.5; // total gap for both sides
chipCt        = 53;
chipHt        = 3.4;
chipHtGap     = 2; // total gap for both sides
chipFillRight = 0;

/* dimensions related to cards */
sleeveWid      = 93.0;
sleeveWidGap   = 2; // total gap for both sides
sleeveLen      = 67.0;
sleeveLenGap   = 2; // total gap for both sides
cardStackHt    = 35;
cardStackHtGap = 2; // total gap
cardStackLift  = 2; // make the card stacks start higher -- facilitates magnets
rightStackOff  = 20; // shift right stack forward

/* dimensions related to placement of things relative to one another */
cardStackGap   = 1.5;
cardChipGap    = 10;

/* overall height */
overallHt = max(cardStackHt+cardStackHtGap+cardStackLift, chipDia+chipDiaGap);

$fn=40;

chipCoverThick = 2;
endcapExtra1 = chipCoverThick;
endcapExtra2 = endcapExtra1 + 2;
endcapHt     = 11;

if (0) chipCover();
if (0) translate([0,0,00]) fancyTop();
if (1) fancyBottom();

/* Expand chip space to width of cards, calculate max. chips, shift cards left */
minChipLen    = chipHt * chipCt + chipHtGap;
cardStacksWid = 2*sleeveWid + 2*sleeveWidGap + cardStackGap;
chipLen       = max(minChipLen+chipFillRight, cardStacksWid);
cardShiftX    = max(0, (chipLen - cardStacksWid) / 2);

/* dimensions of "dish" between cards */
dishRightGap = 7; /* leave some space on RHS (magnet) */
dishWid      = sleeveWid + sleeveWidGap - dishRightGap;
dishLenGap   = sleeveLenGap;
dishHt       = cardStackHt+cardStackHtGap+cardStackLift;
dishChipGap  = min(cardChipGap,4);
dishLen      = rightStackOff - cardStackGap + (cardChipGap - 4)/2;

/* calculate position of chips */
chipSpaceY = (chipDia + chipDiaGap + cardChipGap) / 2;

/* calculate positions of card spots */
leftCardStackX = -1 * (sleeveWid + sleeveWidGap + cardStackGap)/2 - cardShiftX;
leftCardStackY = -1 * (sleeveLen + sleeveLenGap + cardChipGap)/2;
rightCardStackX = (sleeveWid + sleeveWidGap + cardStackGap)/2 + cardShiftX;
rightCardStackY = -1 * ((sleeveLen + sleeveLenGap + cardChipGap)/2);

/* Calculate bounding box */
// minX = leftCardStackX - (sleeveWid + sleeveWidGap)/2;
// maxX = rightCardStackX + (sleeveWid + sleeveWidGap)/2;
minX = -chipLen/2;
maxX = chipLen/2;
minY = leftCardStackY - (sleeveLen + sleeveLenGap)/2;
maxY = chipSpaceY + (chipDia + chipDiaGap)/2;
bbWid = maxX - minX;
bbLen = maxY - minY;
bbHt = overallHt;

echo("Void dimensions: ", bbWid, " x ", bbLen, " x ", bbHt);

/* organizer calculations */
orgWall  = 2.0;
orgFloor = 1.6;
orgWid   = chipLen + 2*orgWall; // FIXME? no longer accurate
orgLen   = bbLen + 2*orgWall;

intMinX = minX - orgWall;
intMaxX = maxX + orgWall;
intMinY = minY - orgWall;
intMaxY = maxY + orgWall;

extMinX = intMinX - orgWall;
extMaxX = intMaxX + orgWall;
extMinY = intMinY - orgWall;
extMaxY = intMaxY + orgWall;


module voids(finger=true,chipFill=false) {
   /* Place chip space */
   if (chipFill) {
      /* leave RHS filled in (magnet?) */
      translate([-chipFillRight/2,chipSpaceY,0]) chipSpace(len=minChipLen);
   } else {
      /* don't expand chip space, just shift it */
      translate([0,chipSpaceY,0]) chipSpace(len=chipLen);
   }

   /* Place left and right card stack spaces */
   myHt = cardStackHt+cardStackHtGap+cardStackLift;

   translate([leftCardStackX,leftCardStackY,0]) cardSpace(ht=myHt,finger=finger);
   translate([rightCardStackX,rightCardStackY-rightStackOff,0]) cardSpace(ht=myHt,finger=finger);

   /* Place "dish" */
   dishX = rightCardStackX;
   dishY = -(dishChipGap+dishLen)/2;
   translate([dishX, dishY, 0]) dishSpace();
}

module dishSpace() {
   $fn=100;

   myRad = 15;
   myLen = dishLen;
   myWid = dishWid;
   myHt = cardStackHt+cardStackHtGap+cardStackLift;

   hull() {
      translate([-myWid/2 + myRad - dishRightGap/2, 0, myRad]) rotate([90,0,0])
         translate([0,0,-myLen/2]) cylinder(r=myRad,h=myLen);
      translate([myWid/2 - myRad - dishRightGap/2, 0, myRad]) rotate([90,0,0])
         translate([0,0,-myLen/2]) cylinder(r=myRad,h=myLen);
      translate([-dishRightGap/2,0,(myHt-myRad)/2 + myRad]) cube([myWid,myLen,myHt-myRad], center=true);
   }
}

/* fancyBottom() -- bottom with magnet holes plus interior walls to be cut with voids */
module fancyBottom(ht=cardStackLift) {
   myHt = ht;

   difference() {
      union() {
         linear_extrude(height=myHt) fancyExterior();
         linear_extrude(height=cardStackHt+cardStackHtGap+cardStackLift) fancyExterior(expand=0);
      }
      translate([0,0,orgFloor]) voids(chipFill=false);
      translate([-(extMaxX-extMinX)/2,cardChipGap/2,(chipDia+chipDiaGap)/2+orgFloor])
         cube([extMaxX-extMinX,chipDia+chipDiaGap+orgWall+slop,overallHt-chipDia/2]);

      /* slant the back */
      translate([-(extMaxX-extMinX+slop)/2,0.9*chipDia+0.5*cardChipGap,0]) rotate([-30,0,0]) cube([extMaxX-extMinX+slop,20,20]);

      /* clean bottom surface */
      translate([0,0,-10]) cube([300,300,20], center=true);
   }

   // color("red") translate([minX-5,minY+1,0]) cylinder(d=5.5, h=ht+5);
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

/* fancyTop()
 * inset - a way to inset corners to help generate internal volume
 */
module fancyTop() {
   myHt = cardStackHt+cardStackHtGap+cardStackLift;

   difference() {
      translate([0,0,orgFloor]) {
         linear_extrude(height=myHt) fancyTopShape(expand=orgWall);
         translate([0,0,myHt]) minkowski() {linear_extrude(height=slop) fancyTopShape(expand=0); cylinder(r1=orgWall,r2=slop,h=orgWall);}
      }
      hull() chipCover();

      /* clean bottom surface */
      translate([0,0,-10]) cube([300,300,20], center=true);

      /* note: fudging here b/c orgWid is no longer accurate */
      translate([-(orgWid+10)/2,-30+cardChipGap/2,-slop]) {
         cube([orgWid + 10, 30, cardStackHt], center = false);
         rotate([0,90,0]) cylinder($fn=80,r=cardStackHt,h=orgWid+10);
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
module chipSpace(len,fill) {
   myLen = len;
   myDia = chipDia + chipDiaGap;

   hull() {
      rotate([0,-90,0]) translate([myDia/2,0,-myLen/2]) cylinder($fn=90, h=myLen, d=myDia);
      translate([0,0,3*myDia/4]) cube([myLen,myDia,myDia/2], center=true);
   }
}

/* volume for a single stack of cards */
module cardSpace(ht=overallHt,finger=true) {
   fingerRad =12;
   myWid = sleeveWid + sleeveWidGap;
   myLen = sleeveLen + sleeveLenGap;
   myHt  = ht - cardStackLift;
  
   translate([0,0,myHt/2 + cardStackLift]) cube([myWid, myLen, myHt],center=true);

   if (finger) {
      translate([0,-myLen/2-4,fingerRad/2+cardStackLift]) rotate([-90,0,0]) scale([1,0.5,1]) cylinder(r=fingerRad,h=10);
      translate([-fingerRad,-myLen/2-4,cardStackLift+fingerRad/2]) cube([fingerRad*2,10,myHt-fingerRad/2+slop]);
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

module chipCover() {
   $fn=100;

   myCoverDia = chipDia + chipDiaGap + 2*chipCoverThick;
   myStartOff = -orgWid/2;
   greebleCt = 8;

   difference() {
      union() {
         for (i=[0:greebleCt-1]) 
            translate([myStartOff + i*orgWid/(greebleCt-1), chipSpaceY, (chipDia + chipDiaGap)/2]) endcap();

         translate([0, chipSpaceY, (chipDia+chipDiaGap)/2]) rotate([0,90,0])
            translate([0,0,-orgWid/2]) cylinder(d=myCoverDia, h=orgWid);
      }
      /* clean bottom surface */
      translate([0,0,-10]) cube([300,300,20], center=true);
   }
}

module endcap() {

   myDia1 = chipDia + chipDiaGap + 2*chipCoverThick + endcapExtra1;
   myDia2 = chipDia + chipDiaGap + 2*chipCoverThick + endcapExtra2;
   mySlantHt = myDia2 - myDia1;

   translate([endcapHt/2,0,0]) rotate([0,-90,0]) {
      cylinder(d1=myDia1, d2=myDia2, h = mySlantHt);
      translate([0,0,mySlantHt-slop/2]) cylinder(d=myDia2, h = endcapHt - 2*mySlantHt + slop);
      translate([0,0,endcapHt - mySlantHt]) cylinder(d2=myDia1, d1=myDia2, h = mySlantHt);
   }
}


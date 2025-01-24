include <./polyround.scad>

/* fudge to get clean renders, to make things fit */
slop = 0.001;
bigSlop = 0.5;

/* dimensions related to chips */
chipDia    = 41.0;
chipDiaGap = 1.5; // total gap for both sides
chipCt     = 55;
chipHt     = 3.4;
chipHtGap  = 2; // total gap for both sides

/* dimensions related to cards */
sleeveWid      = 93.0;
sleeveWidGap   = 2; // total gap for both sides
sleeveLen      = 67.0;
sleeveLenGap   = 2; // total gap for both sides
cardStackHt    = 32;
cardStackHtGap = 2; // total gap
cardStackLift  = 2; // make the card stacks start higher -- facilitates magnets
rightStackOff  = 20; // shift right stack forward

/* dimensions related to placement of things relative to one another */
cardStackGap   = 1.;
cardChipGap    = 2;

/* overall height */
overallHt = max(cardStackHt+cardStackHtGap+cardStackLift, chipDia+chipDiaGap);

$fn=40;

chipCoverThick = 2;
endcapExtra1 = chipCoverThick;
endcapExtra2 = endcapExtra1 + 2;
endcapHt     = 11;

if (1) chipCover();
if (1) fancyTop();


/* Expand chip space to width of cards, calculate max. chips, shift cards left */
minChipLen    = chipHt * chipCt + chipHtGap;
cardStacksWid = 2*sleeveWid + 2*sleeveWidGap + 2*cardStackGap;
chipLen       = max(minChipLen, cardStacksWid);
cardShiftX    = max(0, (chipLen - cardStacksWid) / 2);
// echo("max. chips: ",floor(chipLen/chipHt));

/* dimensions of "dish" between cards */
dishWid    = chipLen - cardStacksWid;
dishLen    = sleeveLen;
dishLenGap = sleeveLenGap;
dishHt     = overallHt;

/* calculate position of chips */
chipSpaceY = (chipDia + chipDiaGap + cardChipGap) / 2;

/* calculate positions of card spots */
leftCardStackX = -1 * ((sleeveWid + sleeveWidGap)/2 + cardStackGap) - cardShiftX;
leftCardStackY = -1 * ((sleeveLen + sleeveLenGap + cardChipGap)/2);
rightCardStackX = (sleeveWid + sleeveWidGap)/2 + cardStackGap + cardShiftX;
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
orgWid   = chipLen + 2*orgWall;
orgLen   = bbLen + 2*orgWall;

intMinX = minX - orgWall;
intMaxX = maxX + orgWall;
intMinY = minY - orgWall;
intMaxY = maxY + orgWall;

extMinX = intMinX - orgWall;
extMaxX = intMaxX + orgWall;
extMinY = intMinY - orgWall;
extMaxY = intMaxY + orgWall;


if (1) difference() {
   fancyBottom();
}

module voids(finger=true) {
   /* Place chip space */
   if (1) {
      translate([0,chipSpaceY,0]) chipSpace(len=chipLen);
   } else {
      /* don't expand chip space, just shift it */
      translate([0,chipSpaceY,0]) chipSpace(len=minChipLen,finger);
   }

   /* Place left and right card stack spaces */
   myHt = cardStackHt+cardStackHtGap+cardStackLift;

   translate([leftCardStackX,leftCardStackY,0]) cardSpace(ht=myHt,finger=finger);
   translate([rightCardStackX,rightCardStackY-rightStackOff,0]) cardSpace(ht=myHt,finger=finger);

   /* Place "dish" */
   dishX = rightCardStackX;
   dishY = -1*(rightStackOff-cardChipGap)/2-cardChipGap/2;
   translate([dishX, dishY, 0]) dishSpace();
}

module dishSpace() {
   $fn=100;

   myRad = 10;
   myLen = rightStackOff-cardChipGap; // Y dim -- historical reasons
   myWid = sleeveWid + sleeveWidGap;
   myHt = cardStackHt+cardStackHtGap+cardStackLift;

   hull() {
      translate([-myWid/2 + myRad, 0, myRad]) rotate([90,0,0])
         translate([0,0,-myLen/2]) cylinder(r=myRad,h=myLen);
      translate([myWid/2 - myRad, 0, myRad]) rotate([90,0,0])
         translate([0,0,-myLen/2]) cylinder(r=myRad,h=myLen);
      translate([0,0,(myHt-myRad)/2 + myRad]) cube([myWid,myLen,myHt-myRad], center=true);
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
      translate([0,0,orgFloor]) voids();
      translate([-(extMaxX-extMinX)/2,cardChipGap/2,(chipDia+chipDiaGap)/2+orgFloor])
         cube([extMaxX-extMinX,chipDia+chipDiaGap+orgWall+slop,overallHt-chipDia/2]);
      translate([-(extMaxX-extMinX+slop)/2,0.9*chipDia,0]) rotate([-30,0,0]) cube([extMaxX-extMinX+slop,20,20]);
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

module OLDfancyExterior(inset=0) {
   myRad        = 2;
   cornerAdjX   = rightStackOff+5;
   cornerAdjY   = rightStackOff;
   cornerRad    = 4;
   
   exteriorPts = [
                  [0,extMinY-cornerAdjY+inset,cornerRad],
                  [-cornerAdjX/2,extMinY-cornerAdjY/2+inset, cornerRad],
                  [-cornerAdjX,extMinY+inset,cornerRad],

                  [extMinX+inset,extMinY+inset,myRad],
                  [extMinX+inset,extMaxY-inset,myRad],
                  [extMaxX-inset,extMaxY-inset,myRad],
                  [extMaxX-inset,extMinY-cornerAdjY+inset,myRad],
                 ];

  polygon(polyRound(exteriorPts,30));
}

/* fancyTop()
 * inset - a way to inset corners to help generate internal volume
 */
module fancyTop() {
   myHt = cardStackHt+cardStackHtGap+cardStackLift;

   translate([0,0,orgFloor+1]) {
      linear_extrude(height=myHt) fancyTopShape(expand=orgWall);
      translate([0,0,myHt]) minkowski() {linear_extrude(height=slop) fancyTopShape(expand=0); cylinder(r1=orgWall,r2=slop,h=orgWall);}
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
                  [intMinX,0,myRad],
                  [intMaxX,0,myRad],
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
module chipSpace(len) {
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
      translate([0,-myLen/2-4,fingerRad+cardStackLift]) rotate([-90,0,0]) cylinder(r=fingerRad,h=10);
      translate([-fingerRad,-myLen/2-4,cardStackLift+fingerRad]) cube([fingerRad*2,10,myHt-fingerRad]);
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

   for (i=[0:greebleCt-1]) 
      translate([myStartOff + i*orgWid/(greebleCt-1), chipSpaceY, (chipDia + chipDiaGap)/2]) endcap();

   if (0) {
      translate([-orgWid/2, chipSpaceY, (chipDia + chipDiaGap)/2]) endcap();
      translate([orgWid/2, chipSpaceY, (chipDia + chipDiaGap)/2]) endcap();
      translate([orgWid/4, chipSpaceY, (chipDia + chipDiaGap)/2]) endcap();
      translate([-orgWid/4, chipSpaceY, (chipDia + chipDiaGap)/2]) endcap();
      translate([0, chipSpaceY, (chipDia + chipDiaGap)/2]) endcap();
   }

   translate([0, chipSpaceY, (chipDia+chipDiaGap)/2]) rotate([0,90,0])
      translate([0,0,-orgWid/2]) cylinder(d=myCoverDia, h=orgWid);
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


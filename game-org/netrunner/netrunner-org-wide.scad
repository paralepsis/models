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
cardStackHt    = 35;
cardStackHtGap = 2; // total gap
cardStackLift  = 2; // make the card stacks start higher -- facilitates magnets

/* dimensions related to placement of things relative to one another */
cardStackGap   = 1.;
cardChipGap    = 2;

/* overall height */
overallHt = max(cardStackHt+cardStackHtGap+cardStackLift, chipDia+chipDiaGap);

$fn=40;

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
   orgBottom();
}

module voids() {
   /* Place chip space */
   if (1) {
      translate([0,chipSpaceY,0]) chipSpace(len=chipLen);
   } else {
      /* don't expand chip space, just shift it */
      translate([0,chipSpaceY,0]) chipSpace(len=minChipLen);
   }

   /* Place left and right card stack spaces */
   if (1) {
      myHt = cardStackHt+cardStackHtGap+cardStackLift;

      translate([leftCardStackX,leftCardStackY,0]) cardSpace(ht=myHt);
      translate([rightCardStackX,rightCardStackY,0]) cardSpace(ht=myHt);
   } else {
      myHt = overallHt;

      translate([leftCardStackX,leftCardStackY,0]) cardSpace(ht=myHt);
      translate([rightCardStackX,rightCardStackY,0]) cardSpace(ht=myHt);
   }

   if (0) {
      /* Place "dish" */
      dishX = 0;
      dishY = -1 * ((dishLen + dishLenGap + cardChipGap)/2);
      translate([dishX, dishY, 0]) dishSpace();
   }
}


/* draw a simple box to verify bounding box */
% translate([minX+bbWid/2,minY+bbLen/2,bbHt/2 + orgFloor]) cube([bbWid,bbLen,bbHt],center=true);

module dishSpace() {
   myRad = 10;
   myLen = dishLen + dishLenGap;

   hull() {
      translate([dishWid/2 - myRad, myLen/2 - myRad, myRad]) sphere(r=myRad);
      translate([dishWid/2 - myRad, myLen/2 - myRad, myRad]) cylinder(r=myRad,h=dishHt-myRad);
      translate([-dishWid/2 + myRad, myLen/2 - myRad, myRad]) sphere(r=myRad);
      translate([-dishWid/2 + myRad, myLen/2 - myRad, myRad]) cylinder(r=myRad,h=dishHt-myRad);
      translate([dishWid/2 - myRad, -myLen/2 + myRad, myRad]) sphere(r=myRad);
      translate([dishWid/2 - myRad, -myLen/2 + myRad, myRad]) cylinder(r=myRad,h=dishHt-myRad);
      translate([-dishWid/2 + myRad,-myLen/2 + myRad, myRad]) sphere(r=myRad);
      translate([-dishWid/2 + myRad,-myLen/2 + myRad, myRad]) cylinder(r=myRad,h=dishHt-myRad);
   }
}


/* enclosure volume: bottom */
module orgBottom(ht=cardStackLift+orgFloor) {
   difference() {
      union() {
         hull() {
            myRad = 1.5;
            myHt = ht;

            translate([extMinX+myRad, extMinY+myRad, -orgFloor]) cylinder(r=myRad,h=myHt);
            translate([extMinX+myRad, extMaxY-myRad, -orgFloor]) cylinder(r=myRad,h=myHt);
            translate([extMaxX-myRad, extMinY+myRad, -orgFloor]) cylinder(r=myRad,h=myHt);
            translate([extMaxX-myRad, extMaxY-myRad, -orgFloor]) cylinder(r=myRad,h=myHt);
         }
         intVolume(ht=cardStackHt+cardStackHtGap+cardStackLift);
      }
      translate([0,0,orgFloor]) voids();
      translate([-(extMaxX-extMinX)/2,cardChipGap/2,(chipDia+chipDiaGap)/2+orgFloor])
         cube([extMaxX-extMinX,chipDia+chipDiaGap+orgWall+slop,overallHt-chipDia/2]);
   }
}

/* fancyBottom() -- bottom with magnet holes plus interior walls to be cut with voids */
module fancyBottom(ht=cardStackLift+orgFloor) {
   myHt = ht;

   difference() {
      union() {
         linear_extrude(height=myHt) fancyExterior();
         intVolume(ht=cardStackHt+cardStackHtGap+cardStackLift);
      }
      translate([0,0,orgFloor]) voids();
      translate([-(extMaxX-extMinX)/2,cardChipGap/2,(chipDia+chipDiaGap)/2+orgFloor])
         cube([extMaxX-extMinX,chipDia+chipDiaGap+orgWall+slop,overallHt-chipDia/2]);
   }

   color("red") translate([minX-5,minY+1,0]) cylinder(d=5.5, h=ht+5);
}

module fancyExterior() {
   myRad        = 50;
   cornerAdjX   = 10;
   cornerAdjY   = 35;
   cornerFlareX = 15;
   cornerFlareY = 05;
   cornerRad    = 10;
   
   exteriorPts = [
                  [extMinX+cornerAdjX,extMinY,myRad],
                  [extMinX-cornerFlareX,extMinY-cornerFlareY,cornerRad],
                  [extMinX,extMinY+cornerAdjY,myRad],
  
                  [extMinX,extMaxY-cornerAdjY,myRad],
                  [extMinX-cornerFlareX,extMaxY+cornerFlareY,cornerRad],
                  [extMinX+cornerAdjX,extMaxY,myRad],
  
                  [extMaxX-cornerAdjX,extMaxY,myRad],
                  [extMaxX+cornerFlareX,extMaxY+cornerFlareY,cornerRad],
                  [extMaxX,extMaxY-cornerAdjY,myRad],

                  [extMaxX,extMinY+cornerAdjY,myRad],
                  [extMaxX+cornerFlareX,extMinY-cornerFlareY,cornerRad],
                  [extMaxX-cornerAdjX,extMinY,myRad],
                 ];

  polygon(polyRound(exteriorPts,30));
}

module intVolume(ht) {
   intRad = 1;
   intHt  = ht + orgFloor-slop;

   intPts = [
               [intMinX, intMinY, intRad],
               [intMinX, intMaxY, intRad],
               [intMaxX, intMaxY, intRad],
               [intMaxX, intMinY, intRad],
            ];

   linear_extrude(height=intHt) polygon(polyRound(intPts,10));
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
module cardSpace(ht=overallHt) {
   fingerRad =12;
   myWid = sleeveWid + sleeveWidGap;
   myLen = sleeveLen + sleeveLenGap;
   // myHt  = cardStackHt + cardStackHtGap;
   myHt  = ht - cardStackLift;
  
   translate([0,0,myHt/2 + cardStackLift]) cube([myWid, myLen, myHt],center=true);

   translate([0,-myLen/2-4,fingerRad+cardStackLift]) rotate([-90,0,0]) cylinder(r=fingerRad,h=10);
   translate([-fingerRad,-myLen/2-4,cardStackLift+fingerRad]) cube([fingerRad*2,10,myHt-fingerRad]);
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


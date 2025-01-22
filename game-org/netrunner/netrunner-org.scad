include <./polyround.scad>

/* dimensions related to chips */
chipDia    = 38.1;
chipDiaGap = 1.5; // total gap for both sides
chipCt     = 55;
chipHt     = 3.4;
chipHtGap  = 2; // total gap for both sides

/* dimensions related to cards */
sleeveWid      = 67.1;
sleeveWidGap   = 2; // total gap for both sides
sleeveLen      = 91.0;
sleeveLenGap   = 2; // total gap for both sides
cardStackHt    = 30;
cardStackHtGap = 2; // total gap
cardStackLift  = 4; // make the card stacks start higher -- facilitates magnets

/* dimensions related to placement of things relative to one another */
cardStackGap   = 1.5;
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

if (1) difference() {
   fancyBottom(ht=chipDia/2);
   voids();
}
else {
   fancyBottom();
   voids();
}

module voids() {
   /* Place chip space */
   translate([0,chipSpaceY,0]) chipSpace(len=chipLen);

   /* Place left card stack space */
   translate([leftCardStackX,leftCardStackY,0]) cardSpace();

   /* Place right card stack space */
   translate([rightCardStackX,rightCardStackY,0]) cardSpace();

   /* Place "dish" */
   dishX = 0;
   dishY = -1 * ((dishLen + dishLenGap + cardChipGap)/2);
   translate([dishX, dishY, 0]) dishSpace();
}


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

echo("Interior dimensions: ", bbWid, " x ", bbLen, " x ", bbHt);

/* draw a simple box to verify bounding box */
% translate([minX+bbWid/2,minY+bbLen/2,bbHt/2]) cube([bbWid,bbLen,bbHt],center=true);

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

orgWall  = 2.0;
orgFloor = 1.6;
orgWid   = chipLen + 2*orgWall;
orgLen   = bbLen + 2*orgWall;

/* enclosure volume: bottom */
module orgBottom(ht) {
   hull() {
      myRad = 1.5;
      myHt = ht;

      translate([minX-orgWall+myRad, minY-orgWall+myRad, -orgFloor]) cylinder(r=myRad,h=myHt);
      translate([minX-orgWall+myRad, maxY+orgWall-myRad, -orgFloor]) cylinder(r=myRad,h=myHt);
      translate([maxX+orgWall-myRad, minY-orgWall+myRad, -orgFloor]) cylinder(r=myRad,h=myHt);
      translate([maxX+orgWall-myRad, maxY+orgWall-myRad, -orgFloor]) cylinder(r=myRad,h=myHt);
   }
}


module fancyBottom(ht=2) {
   myRad        = 5;
   myHt         = ht;
   cornerAdj    = 15;
   cornerFlareX = 95;
   cornerFlareY = 75;
   cornerRad    = 10;
   
   bottomPts = [
                [minX-orgWall+cornerAdj,minY-orgWall,myRad],
                [minX-orgWall-cornerFlareX,minY-orgWall-cornerFlareY,cornerRad],
                [minX-orgWall,minY-orgWall+cornerAdj,myRad],

                [minX-orgWall,maxY+orgWall-cornerAdj,myRad],
                [minX-orgWall-cornerFlareX,maxY+orgWall+cornerFlareY,cornerRad],
                [minX-orgWall+cornerAdj,maxY+orgWall,myRad],

                [maxX+orgWall-cornerAdj,maxY+orgWall,myRad],
                [maxX+orgWall+cornerFlareX,maxY+orgWall+cornerFlareY,cornerRad],
                [maxX+orgWall,maxY+orgWall-cornerAdj,myRad],

                [maxX+orgWall,minY-orgWall+cornerAdj,myRad],
                [maxX+orgWall+cornerFlareX,minY-orgWall-cornerFlareY,cornerRad],
                [maxX+orgWall-cornerAdj,minY-orgWall,myRad],
               ];

   linear_extrude(height=myHt) polygon(polyRound(bottomPts,30));

   translate([minX-4,minY-2,0]) cylinder(d=5.5, h=5);
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
module cardSpace() {
   myWid = sleeveWid + sleeveWidGap;
   myLen = sleeveLen + sleeveLenGap;
   // myHt  = cardStackHt + cardStackHtGap;
   myHt  = overallHt - cardStackLift;
  
   translate([0,0,myHt/2 + cardStackLift]) cube([myWid, myLen, myHt],center=true);
}


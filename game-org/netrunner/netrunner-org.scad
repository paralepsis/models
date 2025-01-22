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

/* dimensions related to placement of things relative to one another */
cardStackGap   = 1.5;
cardChipGap    = 2;

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
dishHt     = cardStackHt + cardStackHtGap;

/* calculate position of chips */
chipSpaceY = (chipDia + chipDiaGap + cardChipGap) / 2;

/* calculate positions of card spots */
leftCardStackX = -1 * ((sleeveWid + sleeveWidGap)/2 + cardStackGap) - cardShiftX;
leftCardStackY = -1 * ((sleeveLen + sleeveLenGap + cardChipGap)/2);
rightCardStackX = (sleeveWid + sleeveWidGap)/2 + cardStackGap + cardShiftX;
rightCardStackY = -1 * ((sleeveLen + sleeveLenGap + cardChipGap)/2);

difference() {
   orgBottom();
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
   dishY = -1 * (dishLen + dishLenGap + cardChipGap)/2;
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
bbHt = max(chipDia + chipDiaGap, cardStackHt + cardStackHtGap);

/* draw a simple box to verify bounding box */
% translate([minX+bbWid/2,minY+bbLen/2,bbHt/2]) cube([bbWid,bbLen,bbHt],center=true);

module dishSpace() {
   myRad = 7;

   hull() {
      translate([dishWid/2 - myRad, dishLen/2 - myRad, myRad]) sphere(r=myRad);
      translate([dishWid/2 - myRad, dishLen/2 - myRad, myRad]) cylinder(r=myRad,h=dishHt-myRad);
      translate([-dishWid/2 + myRad, dishLen/2 - myRad, myRad]) sphere(r=myRad);
      translate([-dishWid/2 + myRad, dishLen/2 - myRad, myRad]) cylinder(r=myRad,h=dishHt-myRad);
      translate([dishWid/2 - myRad, -dishLen/2 + myRad, myRad]) sphere(r=myRad);
      translate([dishWid/2 - myRad, -dishLen/2 + myRad, myRad]) cylinder(r=myRad,h=dishHt-myRad);
      translate([-dishWid/2 + myRad,-dishLen/2 + myRad, myRad]) sphere(r=myRad);
      translate([-dishWid/2 + myRad,-dishLen/2 + myRad, myRad]) cylinder(r=myRad,h=dishHt-myRad);
   }
}

orgWall  = 2.0;
orgFloor = 1.6;
orgWid   = chipLen + 2*orgWall;
orgLen   = bbLen + 2*orgWall;
orgHt    = 10;

/* enclosure volume: bottom */
module orgBottom() {
   hull() {
      myRad = 1.5;

      translate([minX-orgWall+myRad, minY-orgWall+myRad, -orgFloor]) cylinder(r=myRad,h=orgHt);
      translate([minX-orgWall+myRad, maxY+orgWall-myRad, -orgFloor]) cylinder(r=myRad,h=orgHt);
      translate([maxX+orgWall-myRad, minY-orgWall+myRad, -orgFloor]) cylinder(r=myRad,h=orgHt);
      translate([maxX+orgWall-myRad, maxY+orgWall-myRad, -orgFloor]) cylinder(r=myRad,h=orgHt);
   }
}

/* volume for holding stack of chips */
module chipSpace(len) {
   myLen = len;
   myDia = chipDia + chipDiaGap;

   rotate([0,-90,0]) translate([myDia/2,0,-myLen/2]) cylinder($fn=90, h=myLen, d=myDia);
}

/* volume for a single stack of cards */
module cardSpace() {
   myWid = sleeveWid + sleeveWidGap;
   myLen = sleeveLen + sleeveLenGap;
   myHt  = cardStackHt + cardStackHtGap;
  
   translate([0,0,myHt/2]) cube([myWid, myLen, myHt],center=true);
}


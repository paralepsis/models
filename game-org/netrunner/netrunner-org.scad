chipDia    = 38.1;
chipDiaGap = 1.5; // total gap for both sides

chipCt     = 35;
chipHt     = 3.4;
chipHtGap  = 2; // total gap for both sides

sleeveWid      = 67.1;
sleeveWidGap   = 2; // total gap for both sides
sleeveLen      = 91.0;
sleeveLenGap   = 2; // total gap for both sides
cardStackHt    = 30;
cardStackHtGap = 2; // total gap
cardStackGap   = 1.5;

cardChipGap    = 2;

$fn=40;


/* Expand chip space to width of cards, calculate max. chips */
minChipLen    = chipHt * chipCt + chipHtGap;
cardStacksWid = 2*sleeveWid + 2*sleeveWidGap + cardStackGap;
chipLen       = max(minChipLen, cardStacksWid);
echo("max. chips: ",floor(chipLen/chipHt));

/* Place chip space */
chipSpaceY = (chipDia + chipDiaGap + cardChipGap) / 2;
translate([0,chipSpaceY,0]) chipSpace(len=chipLen);

/* Place left card stack space */
leftCardStackX = -1 * ((sleeveWid + sleeveWidGap)/2 + cardStackGap/2);
leftCardStackY = -1 * ((sleeveLen + sleeveLenGap + cardChipGap)/2);
translate([leftCardStackX,leftCardStackY,0]) cardSpace();

/* Place right card stack space */
rightCardStackX = (sleeveWid + sleeveWidGap)/2 + cardStackGap/2;
rightCardStackY = -1 * ((sleeveLen + sleeveLenGap + cardChipGap)/2);
translate([rightCardStackX,rightCardStackY,0]) cardSpace();

/* Calculate bounding box */
minX = leftCardStackX - (sleeveWid + sleeveWidGap)/2;
maxX = rightCardStackX + (sleeveWid + sleeveWidGap)/2;
minY = leftCardStackY - (sleeveLen + sleeveLenGap)/2;
maxY = chipSpaceY + (chipDia + chipDiaGap)/2;
bbWid = maxX - minX;
bbLen = maxY - minY;
bbHt = max(chipDia + chipDiaGap, cardStackHt + cardStackHtGap);

/* draw a simple box to verify bounding box */
% translate([minX+bbWid/2,minY+bbLen/2,bbHt/2]) cube([bbWid,bbLen,bbHt],center=true);


module chipSpace(len) {
   myLen = len;
   myDia = chipDia + chipDiaGap;

   rotate([0,-90,0]) translate([myDia/2,0,-myLen/2]) cylinder($fn=90, h=myLen, d=myDia);
}

module cardSpace() {
   myWid = sleeveWid + sleeveWidGap;
   myLen = sleeveLen + sleeveLenGap;
   myHt  = cardStackHt + cardStackHtGap;
  
   translate([0,0,myHt/2]) cube([myWid, myLen, myHt],center=true);
}

containerWall2();

/* simpleContainerWall() -- corrugated metal wall
 *
 * NOTE: Wall is positioned such that bottom left is at x=0,z=0, and back
 *       of wall is on y axis, but back left bottom corner is not at origin
 *       because of the shape of the wall.
 */
module simpleContainerWall(height = 45, length = 90) {
   containerWall(height=height, length=length, flat=3.0, ow=1.5, ot=1.5);
}

module containerWall(height = 45, length = 90, flat=3.0, ow=1.5, ot=1.5) {
   thickness = 0.8;
   reqFlatLen = flat; // requested flat length, possibly adjusted
   ptOffW = 1.0; // width
   ptOffT = 1.5; // thick

   origPanelLen = 2*(reqFlatLen + ptOffW);
   panelCount = floor(length/origPanelLen);

   /* tweak panel length to hit overall length target */
   diff = length - panelCount*origPanelLen;
   flatLen = reqFlatLen + diff / (panelCount*2); // two flatLens per panel
   newPanelLen = 2*(flatLen+ptOffW);

   for (i = [ 0 : panelCount - 1 ]) {
      translate([i * newPanelLen, -1*(ptOffT), 0])
         linear_extrude(height = height) {
            polygon(points = [[0,0],
                              [flatLen, 0],
                              [flatLen + ptOffW, ptOffT],
                              [2*flatLen + ptOffW, ptOffT],
                              [2*flatLen + 2*ptOffW, 0],
                              [2*flatLen + 2*ptOffW, ptOffT - thickness],
                              [2*flatLen + 2*ptOffW, -1* thickness],
                              [flatLen+2*ptOffW,-1* thickness],
                              [flatLen+ptOffW,-1*(ptOffT+thickness)],
                              [ptOffW,-1*(ptOffT+thickness)],
                              [0,-1*thickness]]);
        }
   }
}

/* containerWall2() -- asymmetric */
module containerWall2(height = 45, length = 90, flat=4.0, ow=1.5, ot=1.5) {
   thickness = 0.8;
   reqFlatLen = flat; // requested flat length, possibly adjusted
   ptOffW = 0.25; // width
   ptOffT = 1.2; // thick
   littleFlatLen = 1;

   origPanelLen = reqFlatLen + 2*ptOffW + littleFlatLen;
   panelCount = floor(length/origPanelLen);

   /* tweak panel length to hit overall length target */
   diff = length - panelCount*origPanelLen;
   flatLen = reqFlatLen + diff / (panelCount); // two flatLens per panel
   newPanelLen = flatLen + 2*ptOffW + littleFlatLen;

   for (i = [ 0 : panelCount - 1 ]) {
      translate([i * newPanelLen, -1*(ptOffT), 0])
         linear_extrude(height = height) {
            polygon(points = [[0,0],
                              [flatLen, 0],
                              [flatLen + ptOffW, ptOffT],
                              [flatLen + ptOffW + littleFlatLen, ptOffT],
                              [flatLen + 2*ptOffW + littleFlatLen, 0],
                              [flatLen + 2*ptOffW + littleFlatLen, ptOffT - thickness],
                              [flatLen + 2*ptOffW + littleFlatLen, -1* thickness],
                              [flatLen+2*ptOffW,-1* thickness],
                              [flatLen+ptOffW,-1*(ptOffT+thickness)],
                              [ptOffW,-1*(ptOffT+thickness)],
                              [0,-1*thickness]]);
        }
   }
}

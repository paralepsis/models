metalSide();

/* metalSide() -- corrugated metal wall with a flat backside
 */
module metalSide(height = 45, length = 90) {
   thickness = 0.8;
   flatLen = 3.0;
   pointOffset = 1.5;

   singlePanelLength = 2*flatLen + 2*pointOffset;

   for (i = [ 0 : floor(length / singlePanelLength) - 1 ]) {
      translate([i * singlePanelLength, 0, 0])
         linear_extrude(height = height) {
            polygon(points = [[0,0],
                              [flatLen, 0],
                              [flatLen + pointOffset, pointOffset],
                              [2*flatLen + pointOffset, pointOffset],
                              [2*flatLen + 2*pointOffset, 0],
                              [2*flatLen + 2*pointOffset, pointOffset + thickness],
                              [0,pointOffset + thickness]],
                    paths = [[6,5,4,3,2,1,0,6]]);
        }
   }
}

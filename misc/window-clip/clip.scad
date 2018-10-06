for (i=[0:5]) {
   translate([20*i, 0, 0]) clip(clipThick=4+i, pincerWidth=20.8 - 1 + 0.25*i);
}

module clip(clipThick=5, pincerWidth=20.8, notchWidth=4.4) {
   linear_extrude(height=clipThick)
      shape(pincerWidth=pincerWidth, notchWidth=notchWidth);
}

module shape(pincerWidth = 20.8, notchWidth = 4.4) {
   echo("pincerWidth = ", pincerWidth);
   polygon(points=[[-notchWidth-4,0],
                   [10,0],
                   [10,5],
                   [9.5,5], // bottom right clip corner
                   [8,3],
                   [7.5,3],
                   [7.5,7],
                   [4,8],
                   [4,pincerWidth+2],
                   [7.5,pincerWidth+3],
                   [7.5,pincerWidth+7],
                   [8,pincerWidth+7],
                   [9.5,pincerWidth+5],
                   [10,pincerWidth+5],
                   [10,pincerWidth+10],
                   [3,pincerWidth+10],
                   [0,pincerWidth+7],
                   [0,4],
                   [-notchWidth-0.5,4],
                   [-notchWidth-0.5,6],
                   [-notchWidth-0.5,8],
                   [-notchWidth,8], // LHS hook
                   [-notchWidth,10],
                   [-notchWidth-1,10],
                   [-notchWidth-4,10]]);
}
              

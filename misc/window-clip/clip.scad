clip();

module clip(clipThick=9, pincerWidth=21.05, notchWidth=5) {
   linear_extrude(height=clipThick)
      shape(pincerWidth=pincerWidth, notchWidth=notchWidth);
}

module shape(pincerWidth = 21.05, notchWidth = 4.4, spineThick=3) {
   echo("pincerWidth = ", pincerWidth);
   polygon(points=[[-notchWidth-3.5,0],
                   [spineThick+6,0],
                   [spineThick+6,5],
                   [spineThick+5.5,5], // bottom right clip corner
                   [spineThick+4,3],
                   [spineThick+3.5,3],
                   [spineThick+3.5,7],
                   [spineThick,8],
                   [spineThick,pincerWidth+2],
                   [spineThick+3.5,pincerWidth+3],
                   [spineThick+3.5,pincerWidth+7],
                   [spineThick+4,pincerWidth+7],
                   [spineThick+5.5,pincerWidth+5],
                   [spineThick+6,pincerWidth+5],
                   [spineThick+6,pincerWidth+10],
                   [3,pincerWidth+10],
                   [0,pincerWidth+7],
                   [0,3],
                   [-notchWidth-0.5,3],
                   [-notchWidth-0.5,9],
                   [-notchWidth,9], // LHS hook
                   [-notchWidth,11],
                   [-notchWidth-3.5,11]]);
}
              

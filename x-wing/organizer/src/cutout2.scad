inset = 0.5;
cornerRad=3.75;
trayHt=25;
xDim = 160;
yDim = 165;

epsilon = 0.1;

translate([0,0,-1.1]) difference() {
   translate([-1,-1,1]) cube([xDim+2,yDim+2,trayHt-2]);
   trayHull();
   translate([cornerRad,-2,-0.1]) cube([xDim -2*cornerRad, yDim+4, trayHt+0.5]);
   translate([-2,cornerRad,-0.1]) cube([xDim+4, yDim-2*cornerRad, trayHt+0.5]);
}

/* trayHull() -- this is the hull of the thing */
module trayHull() {
   hull() {
      /* top, slightly inset */
      translate([cornerRad, cornerRad, -epsilon])
         cylinder($fn=30, r=cornerRad,h=trayHt+epsilon);
      translate([xDim - cornerRad, cornerRad, -epsilon]) 
         cylinder($fn=30, r=cornerRad,h=trayHt+epsilon);
      translate([cornerRad, yDim - cornerRad, -epsilon]) 
         cylinder($fn=30, r=cornerRad,h=trayHt+epsilon);
      translate([xDim - cornerRad, yDim - cornerRad, -epsilon]) 
         cylinder($fn=30, r=cornerRad,h=trayHt+2*epsilon);
   }
}

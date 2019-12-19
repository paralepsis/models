% import("../orig/Accesory-Tray-25mm-HF.stl");

cornerRad=3.75;
trayHt=25;
xDim = 160;
yDim = 165;
wallThick = 2.4;
bottomThick = 1.5;

epsilon = 0.1;

tray();

/* tray() -- final form, with magnet holes removed */
module tray() {
   difference() {
      /* remove anything that might have come out of the intended hull */
      intersection() {
         baseShape();
         trayHull();
      }

      /* cut out magnet holes */
      magnetHoles();
   }
}

/* baseShape() -- tray with cut out interior */
module baseShape() {
   difference() {
      trayHull();

      /* cut out interior */
      translate([wallThick, wallThick, bottomThick]) 
         cube([xDim - 2*wallThick, yDim - 2*wallThick, trayHt]);
   }

   cornerPosts();

   /* interior walls */
   translate([92.4, 2.4-epsilon, 0]) cube([1.2, 101 - epsilon, trayHt]);
   translate([2.4-epsilon, 37, 0]) cube([90+2*epsilon, 1.2, trayHt]);
}


translate([epsilon, 102.2,0]) cube([20,1.2,25]);
translate([epsilon, 102.2,0]) cube([30,1.2,15]);
translate([20+epsilon,102.2,15]) rotate([-90,0,0]) cylinder(r=10,h=1.2);

translate([93.6-20, 102.2,0]) cube([20,1.2,25]);
translate([93.6-30, 102.2,0]) cube([30,1.2,15]);
translate([93.6-20,102.2,15]) rotate([-90,0,0]) cylinder(r=10,h=1.2);

/* corner rounded posts */
module cornerPosts() {
   postRad = 5.5;
   translate([postRad, postRad, 0])
      cylinder($fn=30, r=postRad,h=trayHt);
   translate([xDim - postRad, postRad, 0]) 
      cylinder($fn=30, r=postRad,h=trayHt);
   translate([postRad, yDim - postRad, 0]) 
      cylinder($fn=30, r=postRad,h=trayHt);
   translate([xDim - postRad, yDim - postRad, 0]) 
      cylinder($fn=30, r=postRad,h=trayHt);
}

module magnetHoles() {
   magnetOffset = 1.75;
   magnetRad = 3.25;

   /* bottom */
   translate([magnetOffset+magnetRad, magnetOffset+magnetRad, -epsilon])
      cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
   translate([xDim - magnetOffset-magnetRad, magnetOffset+magnetRad, -epsilon])
      cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
   translate([magnetOffset+magnetRad, yDim - magnetOffset-magnetRad, -epsilon])
      cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
   translate([xDim -magnetOffset-magnetRad, yDim - magnetOffset-magnetRad, -epsilon])
      cylinder($fn=20, r=magnetRad, h=3.25+epsilon);

   /* top */
   translate([magnetOffset+magnetRad, magnetOffset+magnetRad, 21.75])
      cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
   translate([xDim - magnetOffset-magnetRad, magnetOffset+magnetRad, 21.75])
      cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
   translate([magnetOffset+magnetRad, yDim - magnetOffset-magnetRad, 21.75])
      cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
   translate([xDim -magnetOffset-magnetRad, yDim - magnetOffset-magnetRad, 21.75])
      cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
}

/* trayHull() -- this is the hull of the thing */
module trayHull() {
   hull() {
      translate([cornerRad, cornerRad, 0])
         cylinder($fn=30, r=cornerRad,h=trayHt);
      translate([xDim - cornerRad, cornerRad, 0]) 
         cylinder($fn=30, r=cornerRad,h=trayHt);
      translate([cornerRad, yDim - cornerRad, 0]) 
         cylinder($fn=30, r=cornerRad,h=trayHt);
      translate([xDim - cornerRad, yDim - cornerRad, 0]) 
         cylinder($fn=30, r=cornerRad,h=trayHt);
   }
}

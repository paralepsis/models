inset = 0.5;
cornerRad=3.75;
trayHt=46.5;
xDim = 160;
yDim = 165;
wallThick = 2.4;
bottomThick = 1.5;

bottomMagnets = 1;

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
}

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
   if (bottomMagnets) {
      translate([magnetOffset+magnetRad, magnetOffset+magnetRad, -epsilon])
         cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
      translate([xDim - magnetOffset-magnetRad, magnetOffset+magnetRad, -epsilon])
         cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
      translate([magnetOffset+magnetRad, yDim - magnetOffset-magnetRad, -epsilon])
         cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
      translate([xDim -magnetOffset-magnetRad, yDim - magnetOffset-magnetRad, -epsilon])
         cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
   }

   /* top */
   translate([magnetOffset+magnetRad, magnetOffset+magnetRad, trayHt-3.25])
      cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
   translate([xDim - magnetOffset-magnetRad, magnetOffset+magnetRad, trayHt-3.25])
      cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
   translate([magnetOffset+magnetRad, yDim - magnetOffset-magnetRad, trayHt-3.25])
      cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
   translate([xDim -magnetOffset-magnetRad, yDim - magnetOffset-magnetRad, trayHt-3.25])
      cylinder($fn=20, r=magnetRad, h=3.25+epsilon);
}

/* trayHull() -- this is the hull of the thing */
module trayHull() {
   botRad = cornerRad - inset;
   topInset = 0.75;

   hull() {
      /* bottom may be smaller */
      translate([cornerRad, cornerRad, 0])
         cylinder($fn=30, r=botRad,h=1);
      translate([xDim - cornerRad, cornerRad, 0]) 
         cylinder($fn=30, r=botRad,h=1);
      translate([cornerRad, yDim - cornerRad, 0]) 
         cylinder($fn=30, r=botRad,h=1);
      translate([xDim - cornerRad, yDim - cornerRad, 0]) 
         cylinder($fn=30, r=botRad,h=1);

      /* this creates a slight inset around top edge */
      if (1) {
         /* near top */
         translate([cornerRad, cornerRad, trayHt-1-topInset])
            cylinder($fn=30, r=cornerRad,h=1);
         translate([xDim - cornerRad, cornerRad, trayHt-1-topInset]) 
            cylinder($fn=30, r=cornerRad,h=1);
         translate([cornerRad, yDim - cornerRad, trayHt-1-topInset]) 
            cylinder($fn=30, r=cornerRad,h=1);
         translate([xDim - cornerRad, yDim - cornerRad, trayHt-1-topInset]) 
            cylinder($fn=30, r=cornerRad,h=1);
      }

      /* top, slightly inset */
      translate([cornerRad, cornerRad, trayHt-1])
         cylinder($fn=30, r=cornerRad-topInset,h=1);
      translate([xDim - cornerRad, cornerRad, trayHt-1]) 
         cylinder($fn=30, r=cornerRad-topInset,h=1);
      translate([cornerRad, yDim - cornerRad, trayHt-1]) 
         cylinder($fn=30, r=cornerRad-topInset,h=1);
      translate([xDim - cornerRad, yDim - cornerRad, trayHt-1]) 
         cylinder($fn=30, r=cornerRad-topInset,h=1);
   }
}

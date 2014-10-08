badgeWidth = 50;
badgeHeight = 80;
badgeThick = 1.5;
badgeCornerRad = 3;

holderThick = 2;

difference() {
   holderOutline();
   badgeCutout();
}

module badgeCutout() {
   translate([0,0,holderThick/2 - badgeThick/2]) 
      linear_extrude(height=badgeThick) hull() {
         translate([0,0,0])
            circle(r=badgeCornerRad);
         translate([badgeWidth - 2 * badgeCornerRad,0,0])
            circle(r=badgeCornerRad);
         translate([0,badgeHeight - 2 * badgeCornerRad,0])
            circle(r=badgeCornerRad);
         translate([badgeWidth - 2 * badgeCornerRad, badgeHeight - 2 * badgeCornerRad,0])
            circle(r=badgeCornerRad);
      }
}

module holderOutline() {
   holderCornerRad = badgeCornerRad + holderThick;

   linear_extrude(height=holderThick) hull() {
      translate([-1*holderThick,-1*holderThick,0])
         circle(r=holderCornerRad);
      translate([-1*holderThick,badgeHeight,0])
         circle(r=holderCornerRad);
      translate([badgeWidth,-1*holderThick,0])
         circle(r=holderCornerRad);
      translate([badgeWidth,badgeHeight,0])
         circle(r=holderCornerRad);
   }
}

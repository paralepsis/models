include <./polyround.scad>

idX = 80;
idY = 152;
odX = 96;
odY = 168;

baseHt = 7;
enforcerHt = 30;
enforcerInsetY = 12;

insidePts  = [[-idX/2,-idY/2,2], [-idX/2,idY/2,2], [idX/2,idY/2,2], [idX/2,-idY/2,2]];
outsidePts = [[-odX/2,-odY/2,2], [-odX/2,odY/2,2], [odX/2,odY/2,2], [odX/2,-odY/2,2]];

difference() {
   linear_extrude(height=baseHt) polygon(polyRound(outsidePts,3));
   translate([0,0,-0.1]) linear_extrude(height=baseHt+0.2) polygon(polyRound(insidePts,3));
}

mirror([0,0,0]) enforcer();
mirror([1,0,0]) enforcer();
mirror([0,1,0]) enforcer();
mirror([1,0,0]) mirror([0,1,0]) enforcer();

module enforcer() {
   hull() {
      translate([idX/2,idY/2-enforcerInsetY,baseHt-0.1])
         cube([(odX-idX)/2,14,.1]);
      translate([idX/2,idY/2-enforcerInsetY,baseHt-0.1])
         cube([(odX-idX)/2,2,enforcerHt]);
   }
}


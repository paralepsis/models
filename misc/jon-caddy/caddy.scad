wid    = 220;
dep    = 230;
botThk = 3;
botHt  = 30;
bevel  = 5;

$fn=60;

orangePos = [0,70,0];
module orange() {
   color("orange") translate([0,0,35]) sphere(r=35);
}

bittersPos = [-70,70,0];
module bitters() {
   color("blue") cylinder(r=22.5, h=100);
}

jiggerPos = [70,70,0];
module jigger() {
   color("grey") cylinder(r=25, h=60);
}

yetiPos = [60,-60,0];
module yeti() {
   color("grey") cylinder(r=45, h=80);
}

module base() {
   difference() {
      hull() {
         translate([-wid/2+bevel,-wid/2+bevel,0]) cylinder(r=bevel,h=botHt);
         translate([wid/2-bevel,-wid/2+bevel,0]) cylinder(r=bevel,h=botHt);
         translate([-wid/2+bevel,wid/2-bevel,0]) cylinder(r=bevel,h=botHt);
         translate([wid/2-bevel,wid/2-bevel,0]) cylinder(r=bevel,h=botHt);
      }

      translate([0,0,botThk]) {
         translate(orangePos) opening() orange();
         translate(bittersPos) opening() bitters();
         translate(jiggerPos) opening() jigger();
         translate(yetiPos) opening() yeti();
      }
   }
}

difference() {
   cylinder(d=230,h=20);
   for(i=[0:4]) rotate([0,0,(360/5)*i]) translate([150,0,-1]) cylinder(r=50,h=30);
}

module opening(scaleXY=1.05, openHeight=50) {
   linear_extrude(height=openHeight) scale([scaleXY,scaleXY,1]) projection()
      children();
}

// base();

if (0) {
   translate(orangePos) orange();
   translate(bittersPos) bitters();
   translate(jiggerPos) jigger();
   translate(yetiPos) yeti();
}

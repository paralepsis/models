mountDia     = 40.5;
mountHt      = 20;
mountHoleDia = 11;

headHt     = 28;
headBotDia = 23;
headTopDia = 24.5;
headOutDia = headTopDia + 1.7*4;

hoseDia    = 14.5;

$fn=120;

whole();

module testBits() {
   translate([50,0,0]) difference() {
      cylinder(d=mountDia+2*1.7,h=mountHt+1);
      translate([0,0,1.]) cylinder(d=mountDia,h=mountHt+0.1);
      translate([0,0,-1]) cylinder(d=mountHoleDia,h=100);
   }

   difference() {
      cylinder(h=10+headHt-0.1,d=headOutDia);
      translate([0,0,-0.1]) cylinder(h=10.2,d=hoseDia);
      translate([0,0,10]) cylinder(h=headHt,d1=headBotDia,d2=headTopDia);
      translate([-hoseDia/2,0,-0.1]) cube([hoseDia,20,10+headHt+0.2]);
   }
}

module whole() {
   difference() {
      hull() {
         cylinder(d=mountDia+2*1.7,h=mountHt+1);
         translate([0,0,mountHt+headTopDia/2+6]) rotate([90,0,0]) translate([0,0,(-10-headHt)/2]) cylinder(h=10+headHt+2,d=headOutDia);
      }

      translate([0,0,-0.1]) cylinder(d=mountDia,h=mountHt+0.1);
      translate([0,0,mountHt+0.2]) cylinder(d=mountHoleDia,h=100);
      translate([0,0,mountHt+headTopDia/2+6]) rotate([90,0,0])
         translate([0,0,(-10-headHt)/2]) {
            translate([0,0,-3.1]) cylinder(h=10.2+6,d=hoseDia);
            translate([0,0,12.5]) cylinder(h=headHt+1,d1=headBotDia,d2=headTopDia);
            translate([-hoseDia/2,0,-2]) cube([hoseDia,20,10+headHt+6]);
      }
   }
}



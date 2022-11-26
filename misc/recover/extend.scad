totThk=22;
botThk=10;
ht=115;
len=58;
buttLen=28;
strapLen=20;
strapHt = 5;

holeOffX=15;
holeOffY=9;
holeGap=92;

$fn=40;

difference() {
   union() {
      cube([len,ht,botThk]);
      translate([len-buttLen,0,0]) cube([buttLen,ht,totThk]);
   }


   translate([len-buttLen+2.5,3,-1]) cube([strapLen,strapHt,totThk+2]);
   translate([len-buttLen+2.5,ht-3-strapHt,-1])
      cube([strapLen,strapHt,totThk+2]);
   for(i=[0:19]) {
      translate([len,i*6,-1]) rotate([0,0,30]) cylinder($fn=6,r=2,h=totThk+2);
   }

   translate([holeOffX,holeOffY,-1]) cylinder(d=3,h=totThk);
   translate([holeOffX,holeOffY+holeGap,-1]) cylinder(d=3,h=totThk);

   hull() {
      translate([holeOffX-5,holeOffY+10,-1]) cylinder(d=5,h=totThk+2);
      translate([holeOffX-5,holeOffY+holeGap-10,-1]) cylinder(d=5,h=totThk+2);
      translate([-1,holeOffY,-1]) cube([1,holeGap,totThk+2]);
   }

   translate([len-buttLen+12,3,0]) triCutouts();

}

module triCutouts() {
   translate([2,14,-1]) triCutout();
   translate([0,40,-1]) rotate([0,0,180]) triCutout();
   translate([2,42,-1]) triCutout();
   translate([0,66,-1]) rotate([0,0,180]) triCutout();
   translate([2,42+26,-1]) triCutout();
   translate([0,92,-1]) rotate([0,0,180]) triCutout();
}

module triCutout() {
   translate([-8,0,0]) hull() {
      cylinder(d=4,h=totThk+2);
      translate([0,12,0]) cylinder(d=4,h=totThk+2);
      translate([12,6,0]) cylinder(d=4,h=totThk+2);
   }
}


use <BOSL2/std.scad>

$fn=40;

totHt   = 92;
botThk  =  1;
innerOD = 233.5; // with a little room
cardLen = 97; // with a little room, after sleeving
wallThk = 1.0;
cardOrgHt = 50;

for (i=[0:3]) rotate ([0,0,90*i]) outsideQuarter();


back(innerOD/2-(cardLen+2*wallThk)/2-0.75) longCards();

shortLen = innerOD - 2.25 - (cardLen+2*wallThk/2);
cornerWid = innerOD - .75 - (cardLen+2*wallThk);
fwd(innerOD/2-shortLen/2) left(innerOD/2-(cardLen+2*wallThk)/2) shortCards(len=shortLen);
fwd(innerOD/2-shortLen/2) right(innerOD/2-(cornerWid)/2) cornerBox(len=shortLen,wid=cornerWid,ht=82);

module cornerBox(len, wid, ht) {
   rotate([0,0,90]) difference() {
      up((ht+1+2)/2-1) cuboid([len, wid, ht+botThk+1+2], rounding=2);
      up((ht-botThk+1)/2+botThk) cuboid([len-4*wallThk, wid-4*wallThk, ht-botThk+1], rounding=0.5);
      down(1.5) cube([400,400,3], center=true);
      up(ht+1.5) cube([400,400,3], center=true);
   }
}
module shortCards(len) {
   rotate([0,0,90]) difference() {
      up((cardOrgHt+botThk+1+2)/2-1) cuboid([len, cardLen + 2*wallThk, cardOrgHt+botThk+1+2], rounding=2);
      up((cardOrgHt+1)/2+botThk) cuboid([len-2*wallThk, cardLen, cardOrgHt+1], rounding=0.5);
      down(1.5) cube([400,400,3], center=true);
      up(cardOrgHt+botThk+1.5) cube([400,400,3], center=true);
   }
}

module longCards() {
   difference() {
      up((cardOrgHt+botThk+1+2)/2-1) cuboid([innerOD, cardLen + 2*wallThk, cardOrgHt+botThk+1+2], rounding=2);
      up((cardOrgHt+1)/2+botThk) cuboid([innerOD-2*wallThk, cardLen, cardOrgHt+1], rounding=0.5);
      down(1.5) cube([400,400,3], center=true);
      up(cardOrgHt+botThk+1.5) cube([400,400,3], center=true);
   }
}

module box() {
   difference() {
      // basic shape, no bevel on bottom surface
      up((totHt+1)/2-1) cuboid([289,289,totHt+1],rounding=1);
      down(1.1/2) cube([290,290,1.1],center=true);
   
      up(92-10+11/2) cuboid([255,255,11],rounding=1);
      up((totHt+2)/2-1) cuboid([235,235,totHt+2],rounding=0.2);
   
   }
}

module key(xtra=0,ht=60) {
   back(11) right(263/2) {
      cylinder(d=15+xtra*2,h=ht);
      translate([-3.5-xtra,-20,0]) cube([7+2*xtra,15,ht]);
   }
}

module outsideQuarter() {
   rotate([0,0,90]) key();
   
   intersection() {
      difference() {
         box();
         down(1) key(ht=63,xtra=0.5);
      }
      cube([150,150,100]);
   }
}


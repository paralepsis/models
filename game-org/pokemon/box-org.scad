use <BOSL2/std.scad>

$fn=40;

totHt   = 92;
botThk  =  1;
innerOD = 233.5; // with a little room
cardLen = 97; // with a little room, after sleeving
wallThk = 1.6;
cardOrgHt = 50;
cornerBoxInsertHt = 40;

shortLen = innerOD - 2 - (cardLen+2*wallThk);
cornerWid = innerOD - .75 - (cardLen+2*wallThk);

if (0) for (i=[0:3]) rotate ([0,0,90*i]) outsideQuarter();
if (0) outsideQuarter();
if (0) back(innerOD/2-(cardLen+2*wallThk)/2-0.75) longCards(ht=80);
if (1) fwd(innerOD/2-shortLen/2) left(innerOD/2-(cardLen+4+2*wallThk)/2) shortCards(len=shortLen);

if (0) fwd(innerOD/2-shortLen/2) right(innerOD/2-(cornerWid)/2) cornerBox(len=shortLen,wid=cornerWid,ht=82);
if (0) fwd(innerOD/2-shortLen/2) right(innerOD/2-(cornerWid)/2) cornerBoxInsert(len=shortLen,wid=cornerWid,ht=cornerBoxInsertHt);

module cornerBox(len, wid, ht) {
   rotate([0,0,90]) difference() {
      up((ht+1+2)/2-1) cuboid([len, wid, ht+botThk+1+2], rounding=2);
      up((ht-botThk+1)/2+botThk) cuboid([len-9*wallThk, wid-9*wallThk, ht-botThk+1], rounding=0.5);
      up(ht-(cornerBoxInsertHt)/2-0.3+1) cuboid([len-3*wallThk, wid-3*wallThk, cornerBoxInsertHt+1], rounding=0.2);
      down(1.5) cube([400,400,3], center=true);
      up(ht+1.5) cube([400,400,3], center=true);
      // cube([300,300,300]);
      up(ht) rotate([90,0,0]) down((shortLen+2)/2) cylinder(h=shortLen+2, d=35);
   }
}

module cornerBoxInsert(len, wid, ht) {
   up(82-ht/2+0.3) rotate([0,0,90]) difference() {
      cuboid([len-2*wallThk-2, wid-2*wallThk-2, ht+2], rounding=2.);
      up(botThk/2) cuboid([len-5*wallThk-2, wid-5*wallThk-2, ht-botThk], rounding=0.25);
      down(ht/2+1.5) cube([400,400,3], center=true);
      up(ht/2+1) cube([400,400,3], center=true);
      // down(150) cube([300,300,300]);
   }
}

module shortCards(len) {
   rotate([0,0,90]) difference() {
      up((cardOrgHt+botThk+1+2)/2-1) cuboid([len, cardLen+4 + 2*wallThk, cardOrgHt+botThk+1+2], rounding=2);
      up((cardOrgHt+1)/2+botThk) cuboid([len-2*wallThk, cardLen+4 , cardOrgHt+1], rounding=0.5);
      down(1.5) cube([400,400,3], center=true);
      up(cardOrgHt+botThk+1.5) cube([400,400,3], center=true);
   }
}

module longCards(ht=cardOrgHt) {
   whatsLeft = innerOD-3*wallThk-80;
   echo(whatsLeft/3);

   difference() {
      up((ht+botThk+1+2)/2-1) cuboid([innerOD, cardLen + 2*wallThk, ht+botThk+1+2], rounding=2);

      // left(innerOD/2-innerOD/10-i*(innerOD/5)) up((ht+1)/2+botThk) cuboid([innerOD/5-2*wallThk, cardLen, ht+1], rounding=0.5);
      left(innerOD/2-40) up((ht+1)/2+botThk) cuboid([80-2*wallThk, cardLen, ht+1], rounding=0.5);
      for (i=[0:2]) {
         left(innerOD/2-80-whatsLeft/6-i*(whatsLeft/3+wallThk))
             up((ht+1)/2+botThk) cuboid([whatsLeft/3, cardLen, ht+1], rounding=0.5);
      }

      up((ht+1)/2+botThk+60) cuboid([innerOD-2*wallThk, cardLen, ht+1], rounding=0.5);
      up(60+botThk) rotate([0,90,0]) down((innerOD-10)/2) cylinder(h=innerOD-10, d=35);

      // flat top and bottom
      down(1.5) cube([400,400,3], center=true);
      up(ht+botThk+1.5) cube([400,400,3], center=true);
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

module key(xtra=0,ht=30) {
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
         down(1) key(ht=33,xtra=0.5);
      }
      cube([150,150,100]);
   }
}


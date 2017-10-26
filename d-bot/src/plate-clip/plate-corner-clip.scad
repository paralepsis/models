/* configuration parameters */
bedHt     = 4.15;
plateHt   = 3.125;
plateOff  = 15.5;
corkOff   = 8;
nutHt     = 4;
washerDia = 8;
washerOff = 4.75;
boltDia   = 10;
clipTopThick = 1.4; 
clipBotThick = 7.5;

clipThick = bedHt+max(plateHt,nutHt)+clipTopThick+clipBotThick;

$fn=40;

module clipBasicForm() { clipBasicFormC(); }

if (1) rotate([180,0,0]) {
   difference() {
      clipBasicForm();
      assembly(slot=1);

      /* M5 bolt holes through bottom to lock down */
      translate([21.75,2.85, -clipBotThick-0.2]) cylinder(d=5,h=clipBotThick);
      translate([2.85,21.75, -clipBotThick-0.2]) cylinder(d=5,h=clipBotThick);
   }

   difference() {
      intersection() {
         support();
         clipBasicForm();
      }
      translate([0,0,0]) slotForm(mainDia=boltDia);
   }
}

module support() {
   width = 0.4;

   translate([corkOff-width,corkOff-width,-clipBotThick]) difference() {
      cube([35 - corkOff+width, 35 - corkOff+width, bedHt+clipBotThick]);
      translate([width,width,-0.1]) cube([35 - corkOff+width, 35 - corkOff+width, clipThick+0.2]);
   }
}

module clipBasicFormC() {
   translate([0,0,-clipBotThick]) {
      if (1) hull() {
         cylinder(r=5,h=clipThick);
         translate([24,0,0]) cylinder(r=5,h=clipThick);
         translate([0,plateOff-3.5,0]) cylinder(r=5,h=clipThick);
         translate([27,plateOff-0.5,0]) cylinder(r=2,h=clipThick);
      }
      hull() {
         cylinder(r=5,h=clipThick);
         translate([00,24,0]) cylinder(r=5,h=clipThick);
         translate([plateOff-3.5,0,0]) cylinder(r=5,h=clipThick);
         translate([plateOff-0.5,27,0]) cylinder(r=2,h=clipThick);
      }
   }
}

/* deprecated */
module clipBasicFormA() {
   translate([0,0,-clipBotThick]) {
      difference() {
         union() {
            if (1) hull() {
               cylinder(r=5,h=clipThick);
               translate([30,0,0]) cylinder(r=5,h=clipThick);
               translate([0,plateOff-3,0]) cylinder(r=5,h=clipThick);
               translate([33,plateOff,0]) cylinder(r=2,h=clipThick);
            }
            hull() {
               cylinder(r=5,h=clipThick);
               translate([00,30,0]) cylinder(r=5,h=clipThick);
               translate([plateOff-3,0,0]) cylinder(r=5,h=clipThick);
               translate([plateOff,33,0]) cylinder(r=2,h=clipThick);
            }
         } /* union */
      }

      if (0) linear_extrude(height=clipThick)
         polygon(points=[[0,0],[35,0], [35,plateOff], [35,plateOff+2],
                         [plateOff+2,plateOff+2], [plateOff+2, 35],
                         [plateOff, 35], [0,35], [0, 0]]);
   }
}

/* big overlap with glass plate */
module clipBasicFormB() {
   translate([0,0,-clipBotThick]) {
      difference() hull() {
         cylinder(r=5,h=clipThick);
         translate([30,0,0]) cylinder(r=5,h=clipThick);
         translate([00,30,0]) cylinder(r=5,h=clipThick);
         // translate([30,30,0]) cylinder(r=5,h=clipThick);
 linear_extrude(height=clipThick) polygon(points=[[0,0],[35,0], [35,plateOff], [plateOff, 35], [0,35], [0, 0]]);
      }
   }
}

module assembly(slot=0, access=1) {
   /* heated bed */
   color("red")
      cube([40, 40, bedHt]);

   /* plate */
   color("blue") 
      translate([plateOff, plateOff, bedHt]) cube([40 - plateOff, 40 - plateOff, plateHt]);

   /* cork */
   color("brown") 
      translate([corkOff, corkOff, -10]) cube([40 - corkOff, 40 - corkOff, 10]);

   /* bolt, etc. */
   color("grey") 
      translate([washerOff, washerOff, -10]) cylinder(d=boltDia,h=10);
   color("grey") 
      translate([washerOff, washerOff, 0]) cylinder(d=washerDia,h=nutHt+bedHt);

   if (slot) slotForm();

   if (access) {
      color("green") hull() {
         translate([washerOff, washerOff, nutHt + bedHt -0.1]) cylinder(d=washerDia,h=5);
         translate([washerOff+1, washerOff+1, nutHt + bedHt -0.1]) cylinder(d=washerDia,h=5);
      }
   }
}
module slotForm(mainDia=washerDia) {
   /* slot to allow clearing bolt when sliding on */
   color ("grey") {
      translate([washerOff, washerOff, 0]) {
         rotate([0,0,45]) translate([0,-0.5*mainDia, 0])
            cube([1.4*40+5, mainDia, nutHt+bedHt]);
      }

      translate([washerOff, washerOff, 0]) {
         rotate([0,0,45]) translate([0,-0.5*boltDia, -10]) cube([1.4*40+5, boltDia, 10]);
      }
   }
}

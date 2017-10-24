/* configuration parameters */
bedHt     = 2;
plateHt   = 3.125;
plateOff  = 10;
corkOff   = 10;
nutHt     = 4;
washerDia = 6;
washerOff = 5;
boltDia   = 8;
clipTopThick = 2;
clipBotThick = 2;

clipThick = bedHt+max(plateHt,nutHt)+clipTopThick+clipBotThick;

$fn=40;

// clipBasicForm();

if (1) difference() {
   clipBasicForm();
   assembly(slot=1);
}

difference() {
   support();
   translate([0,0,clipBotThick]) slotForm();
}

module support() {
   width = 0.4;

   translate([plateOff-width,plateOff-width,-clipBotThick]) difference() {
      cube([35 - plateOff+width, 35 - plateOff+width, clipThick]);
      translate([width,width,-0.1]) cube([35 - plateOff+width, 35 - plateOff+width, clipThick+0.2]);
   }
}

module clipBasicForm() {
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

// assembly(slot=1);

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
      color("green") 
         translate([washerOff, washerOff, nutHt + bedHt -0.1]) cylinder(d=washerDia,h=5);
   }
}
module slotForm() {
   /* slot to allow clearing bolt when sliding on */
   color ("grey") {
      translate([washerOff, washerOff, 0]) {
         rotate([0,0,45]) translate([0,-0.5*washerDia, 0])
            cube([1.4*40+5, washerDia, nutHt+bedHt]);
      }

      translate([washerOff, washerOff, 0]) {
         rotate([0,0,45]) translate([0,-0.5*boltDia, -10]) cube([1.4*40+5, boltDia, 10]);
      }
   }
}

/* customizable card box
 *
 * This work is derived from zxqueb (from Clevland, OH)'s:
 *   http://www.thingiverse.com/thing:92518
 *
 *   Parametric Card Box by zxqueb is licensed under the Creative
 *   Commons - Attribution license.
 *
 *   Downloaded on November 9, 2015.
 *
 * Imperial logo is from Rasek fighter's:
 *   http://www.thingiverse.com/thing:1114731
 *
 *   Star Wars Imperial Logo by Rasekfighter is licensed under the
 *   Creative Commons - Public Domain Dedication license.
 *
 *   Downloaded on November 9, 2015.
 *
 * Changes:
 * - Reformatted and commented to be a little easier to read.
 * - Adjusted to be "tall" rather than "flat".
 * - ...
 *
 * Notes:
 * - Funny mix of all caps and other coding styles is my fault.
 * - 63.5 x 88 mm is standard FF sleeve
 * - 41 x 63 mm is small FF sleeve size
 */

CARD_SIZE_LONG_EDGE =16; // this must include the small portion.
CARD_SIZE_SHORT_EDGE = 66;
CARD_STACK_HEIGHT = 91;
WALL_THICKNESS = 2;
TAB_THICKNESS = 10;
EXTRA_SPACE = .25;

smCardLongEdge  = 6;
smCardShortEdge = 43;
smCardHeight    = 66;
smCardBoost     = CARD_STACK_HEIGHT - smCardHeight - 2;

CARD_LONG_EDGE = CARD_SIZE_LONG_EDGE + (WALL_THICKNESS*2);
CARD_SHORT_EDGE = CARD_SIZE_SHORT_EDGE + (WALL_THICKNESS*2);
ALL_EXTRA_SPACE = (EXTRA_SPACE *2);

LID_OUTSIDE_LONG_THICKNESS = CARD_LONG_EDGE + (WALL_THICKNESS*2);
LID_OUTSIDE_SHORT_THICKNESS = CARD_SHORT_EDGE + (WALL_THICKNESS*2);

SPACE_BETWEEN_BOTTOM_AND_LID = LID_OUTSIDE_LONG_THICKNESS + (WALL_THICKNESS*2)+ 2;

HEIGHT = CARD_STACK_HEIGHT + WALL_THICKNESS;

color("grey") {
translate([53.5,28.5,38]) rotate([0,90,0]) scale([1.5,1.5,1]) import("./logo-imperial.stl");
translate([29.2,28.8,38]) rotate([0,90,0]) scale([1.5,1.5,1]) import("./logo-imperial.stl");

boxBottom();
boxTop();
}

/* boxBottom() -- this part has the tabs that bend
 */
module boxBottom() {
//*Start wedge 1
translate ([((CARD_LONG_EDGE/2) -(TAB_THICKNESS/2)),
            -WALL_THICKNESS-EXTRA_SPACE,
            HEIGHT-WALL_THICKNESS-1-EXTRA_SPACE]) 
   difference (){
      cube ([TAB_THICKNESS,
             WALL_THICKNESS+EXTRA_SPACE,
             WALL_THICKNESS+EXTRA_SPACE]);

      translate ([0, WALL_THICKNESS+(EXTRA_SPACE),0]) rotate ([135,0,0])  
      cube ([(TAB_THICKNESS+3),
             sqrt(((WALL_THICKNESS+EXTRA_SPACE)*(WALL_THICKNESS+EXTRA_SPACE))+((WALL_THICKNESS+EXTRA_SPACE)*(WALL_THICKNESS+EXTRA_SPACE))),
             sqrt(((WALL_THICKNESS+EXTRA_SPACE)*(WALL_THICKNESS+EXTRA_SPACE))+((WALL_THICKNESS+EXTRA_SPACE)*(WALL_THICKNESS+EXTRA_SPACE)))]);

   }

//*Start wedge 2
translate ([((CARD_LONG_EDGE/2) - (TAB_THICKNESS/2)),
            CARD_SHORT_EDGE,
            HEIGHT-WALL_THICKNESS-1-EXTRA_SPACE])
   difference () {
      cube ([TAB_THICKNESS,
             WALL_THICKNESS+EXTRA_SPACE,
             WALL_THICKNESS+EXTRA_SPACE]);

      translate ([0 ,0 ,0]) rotate ([-45,0,0])
      cube ([(TAB_THICKNESS+3),
             sqrt(((WALL_THICKNESS+EXTRA_SPACE)*(WALL_THICKNESS+EXTRA_SPACE))+((WALL_THICKNESS+EXTRA_SPACE)*(WALL_THICKNESS+EXTRA_SPACE))),
             sqrt(((WALL_THICKNESS+EXTRA_SPACE)*(WALL_THICKNESS+EXTRA_SPACE))+((WALL_THICKNESS+EXTRA_SPACE)*(WALL_THICKNESS+EXTRA_SPACE)))]);
   }


/* tab */
translate ([((CARD_LONG_EDGE/2) -(TAB_THICKNESS/2)),
            -WALL_THICKNESS-EXTRA_SPACE,
            HEIGHT-1])
   cube ([TAB_THICKNESS, WALL_THICKNESS+EXTRA_SPACE, 1]); 

/* tab */
translate ([((CARD_LONG_EDGE/2) -(TAB_THICKNESS/2)),
            CARD_SHORT_EDGE,HEIGHT-1])
   cube ([TAB_THICKNESS, WALL_THICKNESS+EXTRA_SPACE, 1]);

/* bottom plate */
translate ([-WALL_THICKNESS-EXTRA_SPACE, -WALL_THICKNESS-EXTRA_SPACE, 0 ])
   cube ([CARD_LONG_EDGE + (WALL_THICKNESS*2)+ALL_EXTRA_SPACE,
          CARD_SHORT_EDGE + (WALL_THICKNESS*2)+ALL_EXTRA_SPACE,
          WALL_THICKNESS]);

difference() {
   /* main body */
   cube ([CARD_LONG_EDGE,CARD_SHORT_EDGE,HEIGHT]);

   /* first tab cutout */      
   translate([((CARD_LONG_EDGE / 2) + (TAB_THICKNESS/2)),
                   -.5,
                   0.6*(HEIGHT+ WALL_THICKNESS)])
           cube ([2, CARD_SHORT_EDGE + 2, HEIGHT]);

   /* second tab cutout */
   translate([((CARD_LONG_EDGE / 2) - ((TAB_THICKNESS/2)+2)),
              -.5,
              0.6*(HEIGHT+ WALL_THICKNESS)])
      cube ([2, CARD_SHORT_EDGE + 2, HEIGHT ]);

   /* diff out the interior */
   translate([WALL_THICKNESS,
              WALL_THICKNESS,
              WALL_THICKNESS])
      cube ([CARD_LONG_EDGE - (WALL_THICKNESS*2),
             CARD_SHORT_EDGE - (WALL_THICKNESS*2),
             HEIGHT]);

   /* diff out spot to grab cards */
   translate([-0.4, WALL_THICKNESS + CARD_SHORT_EDGE/2, HEIGHT])
      rotate([0,90,0])
         cylinder(r=12,
                  h=CARD_LONG_EDGE+2*WALL_THICKNESS+ALL_EXTRA_SPACE + 0.1,
                  $fn=80);
}
      /* small card region */
      difference() {
         translate([WALL_THICKNESS - 0.1,
                 (CARD_SHORT_EDGE - (smCardShortEdge + 2*WALL_THICKNESS))/2,
                 WALL_THICKNESS])
            cube([smCardLongEdge+WALL_THICKNESS+ALL_EXTRA_SPACE + 0.1,
                  smCardShortEdge+2*WALL_THICKNESS+ALL_EXTRA_SPACE,
                  smCardHeight + smCardBoost]);

         translate([WALL_THICKNESS,
                 (CARD_SHORT_EDGE - (smCardShortEdge + 2*WALL_THICKNESS))/2 + WALL_THICKNESS,
                 WALL_THICKNESS+smCardBoost])
            cube([smCardLongEdge,
                  smCardShortEdge,
                  smCardHeight+0.1]);

   /* diff out spot to grab cards */
   translate([-0.4, WALL_THICKNESS + CARD_SHORT_EDGE/2, HEIGHT])
      rotate([0,90,0])
         cylinder(r=12,
                  h=CARD_LONG_EDGE+2*WALL_THICKNESS+ALL_EXTRA_SPACE + 0.1,
                  $fn=80);
      }
}


/* boxTop() -- this part has the slots for the little tabs only.
 */
module boxTop() {
   translate ([SPACE_BETWEEN_BOTTOM_AND_LID, 0, 0]) {
      difference() {
         cube ([LID_OUTSIDE_LONG_THICKNESS+ALL_EXTRA_SPACE,
                LID_OUTSIDE_SHORT_THICKNESS+ALL_EXTRA_SPACE,
                HEIGHT]);

         translate([((LID_OUTSIDE_LONG_THICKNESS+ALL_EXTRA_SPACE) / 2)-((TAB_THICKNESS+1)/2),
                    -.5,
                    WALL_THICKNESS]) 
            cube ([(TAB_THICKNESS+1),
                   LID_OUTSIDE_SHORT_THICKNESS + 2,
                   WALL_THICKNESS+1.15 ]); 	//*Tab Hole

         translate([WALL_THICKNESS,
                    WALL_THICKNESS,
                    WALL_THICKNESS]) 
            cube ([LID_OUTSIDE_LONG_THICKNESS - (WALL_THICKNESS*2)+ALL_EXTRA_SPACE,
                   LID_OUTSIDE_SHORT_THICKNESS - (WALL_THICKNESS*2)+ALL_EXTRA_SPACE,
                   HEIGHT]);		//*Hole
      }
   }
}

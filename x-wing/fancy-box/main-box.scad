include <./polyround.scad>

id_X = 241;
id_Y = 146;

in_wall_thick  = 3;
out_wall_thick = 3;
lip_thick      = 3;

card_Y = 95;
card_X = 20;

token_Y = 53;

squarish_Y = 86;
card_cutout_left = -id_X/2+lip_thick+116+in_wall_thick;
squarish_cutout_left = card_cutout_left+card_X+in_wall_thick;

od_X = id_X + 2*out_wall_thick;
od_Y = id_Y + 2*out_wall_thick;
od_Z = 118;

id_edge_Z = 67;

bot_Z = 2;

difference() {
   v_top_cutout_points = [[-id_X/2,-id_Y/2,0.5],[od_X/2+1,-id_Y/2,0.5],
                          [od_X/2+1,id_Y/2,0.5],[-id_X/2,id_Y/2,0.5]];
   top_cutout_points = [[-id_X/2,-id_Y/2,0.5],[id_X/2,-id_Y/2,0.5],
                        [id_X/2,id_Y/2,0.5],[-id_X/2,id_Y/2,0.5]];

   card_cutout_points = [[card_cutout_left,-id_Y/2,1],
                         [card_cutout_left+card_X,-id_Y/2,1],
                         [card_cutout_left+card_X,-id_Y/2+card_Y,1],
                         [card_cutout_left,-id_Y/2+card_Y,1]];

   main_form();

   translate([0,0,106]) linear_extrude(height=20)
      polygon(polyRound(v_top_cutout_points,3));
   translate([0,0,67+bot_Z]) linear_extrude(height=50)
      polygon(polyRound(top_cutout_points,3));
   translate([0,0,bot_Z]) linear_extrude(height=160)
      polygon(polyRound(card_cutout_points,3));

   token_cutout();
   big_cutout();
   squarish_cutout();
   finger_cutouts();
   rim_cutout();
}

rim();

module rim_cutout() {
   translate([-od_X/2-2,-od_Y/2-1,od_Z-2]) rotate([0,90,0])
      cylinder($fn=40,d=3,h=od_X+4);
   translate([-od_X/2-2,od_Y/2+1,od_Z-2]) rotate([0,90,0])
      cylinder($fn=40,d=3,h=od_X+4);
}

module rim() {
   translate([-od_X/2,-od_Y/2+1.5,od_Z]) rotate([0,90,0]) cylinder($fn=40,d=3,h=od_X);
   translate([-od_X/2,od_Y/2-1.5,od_Z]) rotate([0,90,0]) cylinder($fn=40,d=3,h=od_X);
}

module finger_cutouts() {
   translate([0,0,67-30+bot_Z+0.1]) {
      rotate([0,90,0]) translate([0,0,-10]) cylinder(d=20,h=20);
      translate([-10,-10,0]) cube([20,20,30]);
   }
   translate([20,0,67-30+bot_Z+0.1]) {
      rotate([0,90,0]) translate([0,0,-10]) cylinder(d=20,h=20);
      translate([-10,-10,0]) cube([20,20,30]);
   }

   translate([20,-47,67-30+bot_Z+0.1]) {
      rotate([0,90,0]) translate([0,0,-10]) cylinder(d=20,h=20);
      translate([-10,-10,0]) cube([20,20,30]);
   }

   translate([20,45,bot_Z]) {
      difference() {
         scale([1,1,1.9]) rotate([0,90,0]) translate([0,0,-10]) cylinder(d=20,h=20);
         translate([-10.5,-10.5,-30]) cube([21,21,30]);
      }
   }
}

module squarish_cutout() {
   squarish_cutout_points = [[squarish_cutout_left,id_Y/2-lip_thick-squarish_Y,1],
                             [id_X/2-lip_thick,id_Y/2-lip_thick-squarish_Y,1],
                             [id_X/2-lip_thick,id_Y/2-lip_thick,1],
                             [squarish_cutout_left,id_Y/2-lip_thick,1]];
   squarish_cutout_pointsb = [[squarish_cutout_left,id_Y/2-lip_thick-squarish_Y,1],
                              [id_X/2,id_Y/2-lip_thick-squarish_Y,1],
                              [id_X/2,id_Y/2,1],
                              [squarish_cutout_left,id_Y/2,1]];


   translate([0,0,bot_Z]) linear_extrude(height=67.1)
      polygon(polyRound(squarish_cutout_points,3));
   hull() {
   translate([0,0,bot_Z]) linear_extrude(height=67.1-2)
      polygon(polyRound(squarish_cutout_points,3));
   translate([0,0,bot_Z]) linear_extrude(height=67.1-2*lip_thick-2)
      polygon(polyRound(squarish_cutout_pointsb,3));
   }
}

module token_cutout() {
   token_cutout_points = [[squarish_cutout_left,-id_Y/2,1],
                          [id_X/2,-id_Y/2,1],
                          [id_X/2,-id_Y/2+token_Y,1],
                          [squarish_cutout_left,-id_Y/2+token_Y,1]];

   difference() {
      translate([0,0,bot_Z]) linear_extrude(height=160)
         polygon(polyRound(token_cutout_points,3));

      for(i=[0:8]) {
         off = (id_X/2 - squarish_cutout_left)/10 * (i+1);

         translate([squarish_cutout_left+off,-id_Y/2-1,bot_Z-0.1])
            cube([0.88, token_Y+2,10]);
      }
   }
}

module big_cutout() {
   big_cutout_points1 = [[-id_X/2+lip_thick,-id_Y/2+lip_thick,2],
                         [-id_X/2+lip_thick+116,-id_Y/2+lip_thick,2],
                         [-id_X/2+lip_thick+116,id_Y/2-lip_thick,0.1],
                         [-id_X/2+lip_thick,id_Y/2-lip_thick,2]];
   big_cutout_points1b = [[-id_X/2,-id_Y/2,2],
                          [-id_X/2+lip_thick+116,-id_Y/2,2],
                          [-id_X/2+lip_thick+116,id_Y/2,0.1],
                          [-id_X/2,id_Y/2,2]];

   big_cutout_points2 = [[-id_X/2+lip_thick+116-1,id_Y/2-lip_thick-43,2],
                         [-id_X/2+lip_thick+116+23,id_Y/2-lip_thick-43,2],
                         [-id_X/2+lip_thick+116+23,id_Y/2-lip_thick,2],
                         [-id_X/2+lip_thick+116-1,id_Y/2-lip_thick,0.1]];
   big_cutout_points2b = [[-id_X/2+lip_thick+116-1,id_Y/2-lip_thick-43,2],
                          [-id_X/2+lip_thick+116+23,id_Y/2-lip_thick-43,2],
                          [-id_X/2+lip_thick+116+23,id_Y/2,2],
                          [-id_X/2+lip_thick+116-1,id_Y/2,0.1]];

   translate([0,0,bot_Z]) linear_extrude(height=67.1)
      polygon(polyRound(big_cutout_points1,3));
   hull() {
      translate([0,0,bot_Z]) linear_extrude(height=67.1-2)
         polygon(polyRound(big_cutout_points1,3));
      translate([0,0,bot_Z]) linear_extrude(height=67.1-2*lip_thick-2)
         polygon(polyRound(big_cutout_points1b,3));
   }

   translate([0,0,bot_Z]) linear_extrude(height=67.1)
      polygon(polyRound(big_cutout_points2,3));
   hull() {
      translate([0,0,bot_Z]) linear_extrude(height=67.1-2)
         polygon(polyRound(big_cutout_points2,3));
      translate([0,0,bot_Z]) linear_extrude(height=67.1-2*lip_thick-2)
         polygon(polyRound(big_cutout_points2b,3));
   }
}

module main_form() {
   perimeter_points = [[-od_X/2, -od_Y/2, 2], [od_X/2, -od_Y/2, 2],
                       [od_X/2, od_Y/2, 2], [-od_X/2, od_Y/2, 2]];

   linear_extrude(height=od_Z) polygon(polyRound(perimeter_points,3));
}


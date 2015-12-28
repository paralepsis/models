rows    =  3;
cols    =  4;
hole    = 26.5; // units = mm
spacing =  5; // units = mm
height  = 25; // units = mm
sides   = 1; // 1 = more support, 0 = big opening

$fn=80;

outline_x = cols * (hole + spacing) + spacing;
outline_y = hole + 2 * spacing + (rows-1) * 0.85*(hole + spacing);

holder();

module holder() {
   difference() {
      union() {
         cube([outline_x, outline_y, 2.4]);
         translate([0,outline_y-2,0]) cube([outline_x, 2, height]);
         translate([0, 0, height-2.4]) cube([outline_x, outline_y, 2.4]);
         cube([2,outline_y, height]);
         translate([outline_x-2,0,0]) cube([2,outline_y, height]);
      }
     
      // RHS cutout
      translate([outline_x - 2.05, 0, 0]) { 
         if (sides == 1) side_cutout();
         else old_side_cutout();
      }
   
      // LHS cutout
      translate([-0.05, 0,0]) {
         if (sides == 1) side_cutout();
         else old_side_cutout();
      }
   
      // back cutout
      translate([0, outline_y+0.15,height/2]) rotate([0,90,-90]) hull() {
         translate([0,14,0]) cylinder(r=5,h=4);
         translate([0,outline_x - 14,0]) cylinder(r=5,h=4);
      }
   
      // cylindrical holes, top and bottom
      for (j=[0:rows - 1]) {
         for (i=[0:cols - 1 - j % 2]) {
            translate([hole/2+spacing+i*(hole+spacing)+(j%2)*((hole+spacing)/2),
                       hole/2+spacing+0.85*j*(hole+spacing), 1.5]) {
                  translate([0,0,0.95]) cylinder(h=height+1, r=hole/2);
                  cylinder(h=1, r1=hole/2-0.75, r2=hole/2);
            }
   
            // back side, for tops of bottles when stacking
            translate([hole/2+spacing+i*(hole+spacing)+(j%2)*((hole+spacing)/2),
                       hole/2+spacing+0.85*j*(hole+spacing), -0.35])
               cylinder(h=1, r1=5, r2=4);
   
         }
      }
   }
}

module old_side_cutout() {
   translate([0,0,height/2]) rotate([0,90,0]) hull() {
      translate([0,14,0]) cylinder(r=5,h=4);
      translate([0,outline_y - 14,0]) cylinder(r=5,h=4);
   }
}

module side_cutout() {
   translate([0, 0, height/2]) rotate([0,90,0]) {
      for (j=[0:rows-1]) hull() {
         if (j==0) {
            translate([0,14,0]) cylinder(r=5,h=4);
         }
         else {
            translate([0,j*outline_y/rows + spacing/2+5,0]) cylinder(r=5,h=4);
         }

         if (j==rows-1) {
            translate([0,outline_y - 14,0]) cylinder(r=5,h=4);
         }
         else {
            translate([0,(j+1)*outline_y/rows - spacing/2-5,0])
               cylinder(r=5,h=4);
         }
      }
   }
}

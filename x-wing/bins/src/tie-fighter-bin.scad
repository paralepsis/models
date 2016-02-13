include <./bintools.scad>

// Harbor Frieght Medium
// 46.5mm tall
// 48.6mm tall with legs
// 80mm wide, 77 bottom
// 54mm length, 52 bottom

$fn=20;

triple_tie_fighter_solid_bottom();
// single_tie_fighter_outline();
// tieFighterBlank();

module single_tie_fighter_outline() {
   translate([0,0,46.5]) rotate([180,0,0]) {
      blankCutout(height=46.5 - 0.1, outlineScale=1.2) tieFighterBlank();
   }
}

module triple_tie_fighter_solid_bottom() {
   translate([0,0,46.5]) rotate([180,0,0]) {
      //roundShapedBox(xDimTop=52, yDimTop=77, xDimBottom=54,
      //               yDimBottom=80, ht=46.5, wallThick=1.6);
      roundShapedBox(xDimTop=54, yDimTop=80, xDimBottom=54,
                     yDimBottom=80, ht=46.5, wallThick=1.6);
      translate([0,0,46.5-1.2]) roundBoxBottom(xDim=54,yDim=80,ht=1.2);

      difference() {
         union() {
            translate([0,0,0.1]) blankOutline(height=46.5 - 0.1, outlineScale=1.2) tieFighterBlank();
            translate([5.5,21.3,0.1]) blankOutline(height=46.5 - 0.1, outlineScale=1.2) tieFighterBlank();
            translate([-5.5,-21.3,0.1]) blankOutline(height=46.5 - 0.1, outlineScale=1.2) tieFighterBlank();
         }
         union() {
            tieFighterBlank();
            translate([5.5,21.3,0]) tieFighterBlank();
            translate([-5.5,-21.3,0]) tieFighterBlank();
         }
      }

      // blankCutout(height=46.5 - 0.1, outlineScale=1.2) tieFighterBlank();
      // translate([6,20.3,0]) blankCutout(height=46.5 - 0.1, outlineScale=1.2) tieFighterBlank();
      // translate([-6,-20.3,0]) blankCutout(height=46.5 - 0.1, outlineScale=1.2) tieFighterBlank();
   }
}

module tieFighterBlank() {
   translate([0,0,41/2]) rotate([180,0,0]) {
      // import("../orig/tie-fighter.stl");

      translate([-14.75,0,0]) panel();
      translate([14.75,0,0]) panel();

      /* cross-brace (whatever it is called) */
      translate([0,0,41/4-0.5]) cube([33,2.75*2,43/2], center=true);

      // rotate([0,90,0]) translate([0,0,-33/2]) cylinder(r=2.75,h=33);
      rotate([0,95,0]) translate([2,0,-33/2+2]) cylinder(r=2.75,h=10);
      rotate([0,95,180]) translate([2,0,-33/2+2]) cylinder(r=2.75,h=10);
      // rotate([0,90,0]) translate([0,0,-33/2+1]) cylinder(r2=3.5,r1=2.75,h=10);
      // rotate([0,-90,0]) translate([0,0,-33/2+1]) cylinder(r2=3.5,r1=2.75,h=10);

      /* cockpit and projection thereof */
      translate([0,0,-1]) sphere(r=6.5);
      translate([0,0,-1]) cylinder(r=6.5,h=41/2+1);

      /* peg hole and back of cockpit */
      translate([0,4,41/4-2-0.5]) cube([10,8,41/2+4+1], center=true);
      translate([0,0,-12-1]) cylinder(r=2.5,h=12);
   }
}

module panel() {
   epsilon = 0.001;
   a = [0 - epsilon, 41/2];
   // b = [22.5/2, 41/2];
   b = [34/2, 41/2]; // was 33/2
   c = [34/2, 0];
   d = [22.5/2, -41/2];
   e = [0 - epsilon, -41/2];

     /* basic panel */
   rotate([0,0,-90]) rotate([90,0,0]) translate([0,0,-2.75])
   linear_extrude(height=5.5) {
      polygon(points=[a,b,c,d,e],paths=[[0,1,2,3,4,5,0]]);
      mirror([1,0,0]) polygon(points=[a,b,c,d,e],paths=[[0,1,2,3,4,5,0]]);
   }
}




module double_x_wing_box_solid_bottom(ht=46.5/2, bling=1) {
   translate([0,0,ht]) rotate([180,0,0]) difference() {
      union() {
         roundShapedBox(xDimTop=53, yDimTop=78.5, xDimBottom=54,
                        yDimBottom=80, ht=ht, wallThick=1.6);
         // roundBox(xDim=54,yDim=80,ht=ht);

         // translate([0,0,ht-1.2]) roundBoxBottom(xDim=54,yDim=80,ht=1.2);
         translate([0,0,ht-1.2]) roundBoxBottom(xDim=53,yDim=78.5,ht=1.2);
      
         // NOTE: outline does not *quite* come to top of box in this design!
         translate([1.1,-15.6,0.1]) blankOutline(height=ht-0.1)
            import("../orig/x-wing-blank.stl");
         rotate([0,0,180]) translate([1.1,-15.6,0.1]) blankOutline(height=ht-0.1)
            import("../orig/x-wing-blank.stl");
      }
      union() {
         translate([1.1,-15.6,0]) import("../orig/x-wing-blank.stl");
         rotate([0,0,180]) translate([1.1,-15.6,0])
            import("../orig/x-wing-blank.stl");

         // Add icons to the ends
         if (bling) {
            translate([0,80/2-0.2,12.5]) rotate([-90,0,0]) scale([0.28,0.28,0.2]) import("../orig/icons/rebel-t70.stl");
            translate([0,-80/2+0.2,12.5]) rotate([-90,0,180]) scale([0.28,0.28,0.2]) import("../orig/icons/rebel-t70.stl");
         }
      }
   }
}


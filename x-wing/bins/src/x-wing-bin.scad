include <./bintools.scad>

// Harbor Frieght Medium
// 46.5mm tall
// 48.6mm tall with legs
// 80mm wide, 77 bottom
// 54mm length, 52 bottom

$fn=20;

double_x_wing_box_solid_bottom(bling=0);


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


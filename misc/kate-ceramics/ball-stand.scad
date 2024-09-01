module ballForm() {
   color("white") translate([0,0,67/2]) rotate([90,0,0]) cylinder($fn=80,h=15,d=67);
}

difference() {
   union() {
      translate([0,0,1]) scale([1,0.7,0.25]) sphere($fn=100,d=80);
      scale([1,0.7,1]) cylinder($fn=100,d=80,h=1.01);
   }

   translate([0,6,1]) rotate([-8,0,0]) ballForm();
   translate([0,0,-15]) cube([100,100,30],center=true);
}

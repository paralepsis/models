module cactusForm() {
   color("green") translate([0,0,95/2]) cube([18,13,95],center=true);
}

difference() {
   union() {
      translate([0,0,0]) scale([0.8,0.7,0.25]) sphere($fn=100,d=80);
      // scale([0.8,0.7,1]) cylinder($fn=100,d=80,h=1.01);
   }

   translate([0,1,1]) rotate([-6,0,0]) cactusForm();
   translate([0,0,-15]) cube([100,100,30],center=true);
}

module ballForm() {
   color("white") translate([0,0,(62*.9)/2]) rotate([90,0,0]) scale([1,0.95,1]) cylinder($fn=80,h=14,d=62);
}

difference() {
   union() {
      translate([0,0,.9]) scale([1,0.7,0.25]) sphere($fn=100,d=80);
      scale([1,0.7,1]) cylinder($fn=100,d=80,h=.91);
   }

   translate([0,6,1.5]) rotate([-6,0,0]) ballForm();
   translate([0,0,-15]) cube([100,100,30],center=true);

    // cube([50,50,50]);
}

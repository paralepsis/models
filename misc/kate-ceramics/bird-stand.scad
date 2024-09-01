module birdForm() {
   color("grey") translate([0,0,80/2]) rotate([90,0,0]) cylinder($fn=80,h=15,d=80);
}

if (1) difference() {
   union() {
      translate([0,0,.9]) scale([1,0.7,0.25]) sphere($fn=100,d=90);
      scale([1,0.7,1]) cylinder($fn=100,d=90,h=.91);
   }

   translate([0,6,1.5]) rotate([-5,0,0]) birdForm();
   translate([0,0,-15]) cube([100,100,30],center=true);

    // cube([50,50,50]);
}


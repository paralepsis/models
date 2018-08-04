$fn=60;

module outline() {
   difference() {
      hull() {
         translate([0,15,0]) scale([1.1,1,1]) cylinder(r=15,h=5);
         translate([0,-15,-1]) scale([1,1.2,1]) rotate([-3,0,0]) cylinder(r=15,h=17);

         translate([0,15.25,3]) scale([1.1,1,0.8]) sphere(r=15);
         // translate([0,-10,5]) scale([1,1.2,1]) sphere(r=15);
      }
      translate([-50,-50,-50]) cube([100,100,50]);
   }
}

module shoeVolume() {
   intersection() {
      outline();

      /* heel cutout */
      translate([25,0,-0.10]) rotate([90,0,-90]) linear_extrude(height=50)
         polygon(points=[[-40,20], [-40,0], [19,0], [19,3], [8,0], [40,0], [40,20]]); 
   }
}

if (1) difference() {
   shoeVolume();
   treadCutout();
   translate([0,0,3]) scale([0.8,0.8,0.8]) outline();
   hull() {
      translate([0,-13.0,3.]) scale([1,1.4,1]) cylinder(r=13,h=20);
      translate([0,-5.5,3]) scale([1,1.4,1]) cylinder(r=13,h=20);
   }
}

module treadCutout() {
   intersection() {
      translate([0,0,-0.1]) scale([0.9,0.9,1.0]) outline();
      union() {
         translate([15,-32,-0.5]) rotate([0,-90,0]) for (i=[0:4.5:12]) {
            translate([0,i,0]) cylinder($fn=3, r=3, h=30);
         }
         translate([15,-30,-0.5]) rotate([0,-90,0]) for (i=[24:4.5:57]) {
            translate([0,i,0]) cylinder($fn=3, r=3, h=30);
         }
      }
   }
}

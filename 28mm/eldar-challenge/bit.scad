$fn=50;

mirror([1 /* this is the one to swap */,0,0]) cannonMount();

module cannonMount() {
   difference() {
      union() {
         /* general form */
         difference() {
            union() {
               linear_extrude(height=3)
                  polygon([[-3,-6], [1.25,-4.3], [3,-7], [8.75,-0.75],
                           [8.75,0.75], [7,2.75], [8,5], [-3,8]]);
               translate([8.1,0,0]) cylinder(r=1.0,h=3);
            }
   
            translate([0,0,-0.5]) cube([5,8,4]);
            translate([0,8.5,-0.5]) cylinder(r=2.5,h=5);
            translate([8,3.5,-0.5]) cylinder(r=1.3,h=5);
         }
   
         /* bumps */
         translate([4.25,-3,3]) rotate([0,0,-45]) scale([1,1.75,1])
            sphere(r=1);
         translate([5.25,-4,1.5]) rotate([0,0,-45]) scale([1,1.75,1])
            sphere(r=1);
         translate([-1.25,-2.25,3]) scale([1,1.75,1]) sphere(r=1);

         translate([4.25,-3,0]) rotate([0,0,-45]) scale([1,1.75,1])
            sphere(r=1);
         translate([-1.25,-2.25,0]) scale([1,1.75,1]) sphere(r=1);
   
         /* cable at bottom */
         if (1) translate([0,0,0.4]) union() {
            difference() {
               translate([-2.5,1.5,1.1]) cableCircle();
               translate([-17,-5,-2]) cube([15,20,5]);
               translate([-3,0,-2]) cube([15,20,5]);
            }
            // translate([-11.5,-5.5,0]) rotate([0,0,-30]) cube([4,4,1]);
         }
      }
   
      // translate([-50,-50,-10]) cube([100,100,10]);
   }
}

module cableCircle() {
   scale([0.6,0.6,0.70]) {
      rotate_extrude($fn=100) translate([14,0,0]) circle(r=1.5,$fn=40);
      for ($i=[0:71]) {
          rotate([0,0,$i * 8]) translate([14,0,0]) rotate([90,0,0]) nodule();
      }
   }
}

module nodule() {
    hull() rotate_extrude($fn=50) translate([1,0,0]) circle(r=1, $fn=80);
}


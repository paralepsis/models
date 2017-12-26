
$fn=40;

 translate([0,0,29]) rotate([180,0,0]) cover();

module cover() {
   difference() {
      union() {
         difference() {
            outside();
            translate([0,0,-0.1]) inside();
         }
         mounts();

         // add back in a little edge around the inside opening
         if (1) difference() {
            hull() {
               translate([17,11,23.5]) cylinder(r=1,h=4);
               translate([17,31,23.5]) cylinder(r=1,h=4);
               translate([43,11,23.5]) cylinder(r=1,h=4);
               translate([43,31,23.5]) cylinder(r=1,h=4);
            }
            hull() {
               translate([18,12,0]) cylinder(r=1,h=40);
               translate([18,30,0]) cylinder(r=1,h=40);
               translate([42,12,0]) cylinder(r=1,h=40);
               translate([42,30,0]) cylinder(r=1,h=40);
            }
         }
      }
      moreCutouts();
   }
}

module moreCutouts() {
   translate([5,48/2,2]) cylinder(d=8,h=33);
   translate([-3.2,48/2-5+1,2]) cube([8.2,8,33]);
   translate([58-5,48/2,2]) cylinder(d=8,h=33);
   translate([58-5,48/2-5+1,2]) cube([8.2,8,33]);

   hull() {
      translate([58-5.5,48/2,-0.1]) cylinder(d=4,h=1.7);
      translate([58-3,48/2,-0.1]) cylinder(d=4,h=1.7);
   }
   hull() {
      translate([5.5,48/2,-0.1]) cylinder(d=4,h=1.7);
      translate([3,48/2,-0.1]) cylinder(d=4,h=1.7);
   }
}

// these are the bits on the ends for screws
module mounts(ht=27.5) {
   difference() {
      union() {
         translate([5,48/2,0]) cylinder(d=10,h=ht);
         translate([-2,48/2-5,0]) cube([7,10,ht]);
         translate([58-5,48/2,0]) cylinder(d=10,h=ht);
         translate([58-5,48/2-5,0]) cube([7,10,ht]);
      }
   }
}

// rough outside form
module outside(ht=27.5) {
   translate([-2.2,-2.2,0]) hull() {
      cylinder(r=1,h=ht);
      translate([62.4,52.4,0]) cylinder(r=1,h=ht);
      translate([0,52.4,0]) cylinder(r=1,h=ht);
      translate([62.4,0,0]) cylinder(r=1,h=ht);
   }
}

// rough inside form, with openings for wiring
module inside(ht=26) {
   hull() {
      cylinder(r=1,h=ht);
      translate([58,48,0]) cylinder(r=1,h=ht);
      translate([0,48,0]) cylinder(r=1,h=ht);
      translate([58,0,0]) cylinder(r=1,h=ht);
   }

   hull() {
      translate([18,12,0]) cylinder(r=1,h=40);
      translate([18,30,0]) cylinder(r=1,h=40);
      translate([42,12,0]) cylinder(r=1,h=40);
      translate([42,30,0]) cylinder(r=1,h=40);
   }

   // openings for wiring
   translate([-4,4,-1.5]) cube([10,9,ht-1.5]);
   translate([-4,32,-1.5]) cube([10,9,ht-1.5]);
   translate([55,5,-1.5]) cube([10,9,ht-1.5]);
   translate([55,32,-1.5]) cube([10,9,ht-1.5]);
   translate([22,45,-1.5]) cube([9,10,ht-1.5]);
}



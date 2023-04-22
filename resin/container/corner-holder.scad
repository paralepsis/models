$fn=80;

module bottom(r1=11.5,r2=13.5,r3=17,r4=20) {
   intersection() {
      difference() {
         difference() {
            union() {
               cylinder (r=r2,h=20);
               cylinder (r=r4,h=10);
            }
            translate([0,0,2]) cylinder (r=r1,h=31);
         }
         translate([0,0,2]) difference() {
            cylinder (r=r3,h=40);
            cylinder (r=r2,h=41);
         }
      }
      translate([0,0,-1]) cube([30,30,20],center=false);
   }
}


module top() {
   hull() {
      translate([5,5,0]) cylinder(r=4,h=2);
      translate([1,5,0]) cube([4,18,2],center=false);
      translate([5,1,0]) cube([18,4,2],center=false);
      translate([4,4,0]) intersection() {
         cylinder(r=20,h=2);
         translate([0,0,-1]) cube([30,30,20],center=false);
      }
      translate([8,8,5]) rotate([0,-10,45]) cube([10,10,5],center=true);
   }

   difference() {
      translate([6.6,6.6,16]) rotate([0,-10,45]) cube([10,10,30],center=true);
      translate([5,5,30]) rotate([90,0,45]) translate([0,0,-10]) cylinder(d=6,h=20);
   }
}

translate([0,0,0])  top();
translate([30,0,0]) bottom();

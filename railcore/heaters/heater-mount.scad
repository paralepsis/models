// 60mm heater mount
use <BOSL2/std.scad>

wid    = 60;
ht     = 60;
dep    = 50;
slop   = 0.1;
angleX = -10;
clearZ = 5;
thk    = 3;

extra = 1;

// corner();
//translate([40,-50,39]) rotate([angleX,0,30]) heater();

translate([40,-50,0]) rotate([0,0,30]) for (w=[-wid/2+thk/2,-wid/6,wid/6,wid/2-thk/2]) {
   translate([w,17,0]) cylinder($fn=30,d=7,h=0.3);
   translate([w,-37,0]) cylinder($fn=30,d=7,h=0.3);
}

difference() {
   translate([40,-50,39]) rotate([angleX,0,30]) union() {
      front();
      bottom();
   }
   translate([0,0,-10]) cube([200,200,20], center=true);
}

shape = [[-wid/2-extra,-ht/2-extra-3], [wid/2+12+extra,-ht/2-extra-3], [wid/2+12+extra, -ht/2+16+extra], [wid/2+extra, -ht/2+16+extra], [wid/2+extra, ht/2+extra],
         [-wid/2-12-extra,ht/2+extra], [-wid/2-12-extra,ht/2-16-extra], [-wid/2-extra, ht/2-16-extra]];

module front() {
   translate([0,-dep/2-3*slop, 0]) difference() {
      rotate([90,0,0]) linear_extrude(height=thk) polygon(round_corners(shape,radius=2,$fn=64));

      translate([0,slop,0]) rotate([90,0,0]) cylinder(d=54, h=thk+2*slop, $fn=64);

      for (i=[-1,1]) translate([i*(-wid/2-6),slop,i*(ht/2-10)])
         rotate([90,0,0]) cylinder(d=4.5, h=thk+2*slop, $fn=32);
   }
}


module bottom() {
   frontHt = dep * tan(abs(angleX)) + clearZ;

   for (w=[-wid/2+thk/2,-wid/6,wid/6,wid/2-thk/2]) {
      translate([w,-thk,-ht/2-extra-frontHt/2]) cube([4,dep,frontHt], center=true);
   }
}

module heater() {
   cube([wid,dep,ht],center=true);
   translate([0,-dep/2+slop,0]) rotate([90,0,0]) cylinder(d=53,h=5);


   for (i=[-1,1]) {
      translate([i*(-wid/2-6+slop),-(dep/2-5/2),i*(ht/2-10)]) difference() {
         cube([12,5,12],center=true);

         
         hull() {
            holeD = 4.5;
            for (j=[-1,1]) {
               translate([j,0,0]) rotate([90,0,0]) translate([0,0,-3]) cylinder(d=holeD,h=6,$fn=30);
            }
         }
      }
   }
}



module corner() {
   translate([50,0,0]) cube([100,15,15], center=true);
   translate([0,0,50]) cube([15,15,100], center=true);
   translate([0,-50,0]) cube([15,100,15], center=true);
}

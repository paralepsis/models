// 60mm heater mount
use <BOSL2/std.scad>

wid    = 60;
ht     = 61;
dep    = 50;
slop   = 0.1;
angleX = -15;
clearZ = 5;
thk    = 3;
side   = 3;

extra = 3;

// corner();
//translate([40,-50,39]) rotate([angleX,0,30]) heater();

// % import("./heater-mount.stl");

// translate([40,-50,0]) 
if (0) rotate([0,0,0]) for (w=[-wid/2+thk/2,-wid/6,wid/6,wid/2-thk/2]) {
   translate([w,17,0]) cylinder($fn=30,d=7,h=0.3);
   translate([w,-37,0]) cylinder($fn=30,d=7,h=0.3);
}

rotate([90-angleX,0,0]) difference() {
   translate([0,0,39]) rotate([angleX,0,0]) union() {
      front();
   }
   translate([0,0,-23]) cube([200,200,40], center=true);
}

function my_shape(my_extra) = [[-wid/2-my_extra,-ht/2-my_extra], [wid/2+14+my_extra,-ht/2-my_extra],
                               [wid/2+14+my_extra, -ht/2+16+my_extra], [wid/2+my_extra, -ht/2+16+my_extra],
                               [wid/2+my_extra, ht/2+my_extra], [-wid/2-14-my_extra,ht/2+my_extra],
                               [-wid/2-14-my_extra,ht/2-16-my_extra], [-wid/2-my_extra, ht/2-16-my_extra]];


module front() {
   translate([0,-dep/2-3*slop, 0]) difference() {
      rotate([90,0,0]) translate([0,0,-side]) linear_extrude(height=thk+side) polygon(round_corners(my_shape(3),radius=2,$fn=64));

      translate([0,slop,0]) rotate([90,0,0]) cylinder(d1=54, d2=58, h=thk+2*slop, $fn=64);
 
      rotate([90,0,0]) translate([0,0,-side-slop]) linear_extrude(height=side+slop) polygon(round_corners(my_shape(1),radius=2,$fn=64));

      for (i=[-1,1]) translate([i*(-wid/2-7),slop,i*(ht/2-10)])
         rotate([90,0,0]) cylinder(d=4.5, h=thk+2*slop, $fn=32);
   }

   // bottom fins
   for (w=[-wid/2+thk/2,-wid/6,wid/6,wid/2-thk/2]) {
      translate([w,-thk/2-3*slop,-ht/2-15-1]) cube([4,dep+thk,30], center=true);
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

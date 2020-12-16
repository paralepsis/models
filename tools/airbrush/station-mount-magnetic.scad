use <scad-utils/transformations.scad>
use <scad-utils/shapes.scad>
use <skin.scad>

$fn=60;

fn=20;
r1 = 122/2;
r2 = 97/2;
R = 85;
th = 3.2;

if (1) {
   translate([0,0,-6]) gasket();
   mountBottom();
   translate([0,0,6]) mountTop();
}
else {
   mount();
}

// cutPlane() -- cut the top off this for easier printing
//
module cutPlane() {
   translate([R,0,4.5]) rotate([0,45,0]) translate([-R-0.8,0,0]) {
      difference() {
         cylinder(d=150,h=150);
      }
   }
}

module mountBottom() {
   difference() {
      mount();
      cutPlane();
   }
}

module mountTop() {
   intersection() {
      mount();
      cutPlane();
   }
}

// gasket() -- the "bottom" piece, also a template for a foam gasket
//
module gasket(ht=4.5) {
   difference() {
      cylinder(d=170,h=ht);
      translate([0,0,-0.1]) cylinder(d=125,h=ht+0.2);
      for(i=[0:3]) {
         rotate([0,0,i*90+45]) boltGap(ht=ht);
      }
   }
}

module mount() {
   translate([0,0,4.5]) {
      difference() {
         cylinder(d=170,h=3);
         translate([0,0,-0.1]) cylinder(d=122-0.2,h=3.2);
         for(i=[0:3]) {
            rotate([0,0,i*90+45]) translate([148.5/2,0,0.1]) cylinder(d=10.9,h=7);
         }
      }
      for(i=[0:3]) {
         rotate([0,0,i*90+45]) magnetSpot();
      }
      tube();
      cutRing();
      outlet();
   }
}

// cutRing() -- ring of material positioned so that I can more easily
//              glue parts together when done.
//
module cutRing() {
   translate([R,0,0]) rotate([0,45,0]) translate([-R-0.8,0,-3]) {
      difference() {
         cylinder(d=130,h=6);
         translate([0,0,-0.1]) cylinder(d=106.5,h=6.2);
         for (i=[0:2]) {
            rotate([0,0,120*i]) translate([128/2-1,-1,-0.1]) cube([3,2,6.2]);
         }
      }
   }
}

module magnetSpot(underMagnet=0.4) {
   translate([148.5/2,0,0]) difference() {
      cylinder(d=11,h=7);
      translate([0,0,underMagnet]) cylinder(d=8.2,h=7);
   }
}

// boltGap -- used by gasket() 
//
module boltGap(ht=3) {
   translate([148.5/2,0,-0.1]) {
      hull() {
         cylinder(d=15,h=ht+0.2);
         translate([-13,-7.5,0]) cube([1,15,ht+0.2]);
      }
   }
}


module tube()
{
    translate([R,0,0]) difference()
    {
        skin([for(i=[0:fn])
              transform(rotation([0,90/fn*i,0])*translation([-R,0,0]),
                        circle(r1-(r1-r2)/fn*i))]);
        assign(r1 = r1-th, r2 = r2-th)
        skin([for(i=[0:fn])
              transform(rotation([0,90/fn*i,0])*translation([-R,0,0]),
                        circle(r1-(r1-r2)/fn*i))]);
    }
}

module outlet()
{
    translate([R,0,0]) rotate([0,90,0]) translate([-R,0,0]) difference() {
        cylinder(d=97,h=20);
        translate([0,0,-0.1]) cylinder(d=90.6,h=20.2);
    }
}

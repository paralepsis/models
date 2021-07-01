$fn=30;

% fail();

A=[-0.1,0];
B=[50/2,0];
C=[50/2,16.5];
D=[29/2,16.5];
E=[29/2,1.5];
F=[8,1.5];
G=[8,3.25];
H=[10,3.25];
I=[10,8];
J=[-0.1,8];

for (i=[0:1]) {
   mirror([i,0,0]) linear_extrude(height=54) polygon(points=[A,B,C,D,E,F,G,H,I,J]);
}
translate([-50/2,0,0]) cube([50,16.5,1.5]);

module fail() {
   translate([-50/2,0,0]) difference() {
      hull() {
      translate([1,17,0]) cylinder(r=1,h=35);
      translate([1,1,0]) cylinder(r=1,h=35);
      translate([49,17,0]) cylinder(r=1,h=35);
      translate([49,1,0]) cylinder(r=1,h=35);
      }
      translate([(50-29)/2,(18-15)/2,-0.5]) cube([29,15,35+1]);
   }
}

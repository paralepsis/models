x = 130;
y = 100;

$fn=30;

space = 10;
wid   = 0.88;
thick = 0.5;

for (i=[0:space:x]) {
   translate([i,0,0]) hull() {
      cylinder(d=wid,h=thick);
      translate([0,y,0]) cylinder(d=wid,h=thick);
   }
}

for(j=[0:space:y]) {
   translate([0,j,0]) hull() {
      cylinder(d=wid,h=thick);
      translate([x,0,0]) cylinder(d=wid,h=thick);
   }
}

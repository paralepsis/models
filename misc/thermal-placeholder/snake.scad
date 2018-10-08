$fn=40;

snake(ht=40);

module snake(ht) {
   difference() {
      snakePart(len=50,dia=13,ht=0.3);
      translate([0,0,-0.1]) snakePart(len=50,dia=5,ht=0.5);
   }
   difference() {
      snakePart(len=50,dia=10,ht=ht);
      translate([0,0,-0.5]) snakePart(len=50,dia=8.4,ht=ht+1);
   }
}

module snakePart(len = 50, dia=10,ht=40) {
   for (i=[0:4]) {
      if (i % 2) hull() {
         translate([i*len/6,0,0]) cylinder(h=ht,d=dia);
         translate([(i+1)*len/6,5,0]) cylinder(h=ht,d=dia);
      }
      else hull() {
         translate([i*len/6,5,0]) cylinder(h=ht,d=dia);
         translate([(i+1)*len/6,0,0]) cylinder(h=ht,d=dia);
      }
   }
}

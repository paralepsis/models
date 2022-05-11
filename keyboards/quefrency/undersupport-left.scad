totHt   = 5; // 4.25 fits too nicely, loose
webHt   = 1.5;
supDia  = 5.5;
boltDia = 2.3;

$fn=40;

supports=[[70,55.5,0],
          [4,36,0],
          [38.5,74.5,0],
          [105.5,75,0],
          [120,36.5,0],
          [72,17,0]];

complete();

module complete() {
   difference() {
      web();

      for (i=[0:5]) {
         translate(supports[i]) {
            translate([0,0,-0.1]) cylinder(h=totHt+0.2,d=boltDia);
         }
      }
   }
}

module web() {
   for (i=[0:5]) {
      translate(supports[i]) {
         cylinder(h=totHt,d=supDia);
      }
   }
   for(i=[1:5]) {
      hull() {
         translate(supports[0]) cylinder(h=webHt,d=supDia);
         translate(supports[i]) cylinder(h=webHt,d=supDia);
      }
   }

   for(i=[3:5]) {
      hull() {
         translate(supports[i-1]) cylinder(h=webHt,d=supDia);
         translate(supports[i]) cylinder(h=webHt,d=supDia);
      }
   }
   hull() {
      translate(supports[1]) cylinder(h=webHt,d=supDia);
      translate(supports[5]) cylinder(h=webHt,d=supDia);
   }
}

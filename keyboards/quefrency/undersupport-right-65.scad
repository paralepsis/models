totHt   = 4.25; // 4.25 fits too nicely, loose
webHt   = 1.5;
supDia  = 5.5;
boltDia = 1.8;

$fn=40;

supports=[[2,13.25],[14,33],[0,71],[57,71],[47.5,13.25],
          [86.75,13.25],[105,71],[139,13.25],[159,0]];

complete();

module complete() {
   difference() {
      web();

      for (i=[0:8]) {
         translate(supports[i]) {
            translate([0,0,-0.1]) cylinder(h=totHt+0.2,d=boltDia);
         }
      }
   }
}

module web() {
   for (i=[0:8]) {
      translate(supports[i]) {
         cylinder(h=totHt,d=supDia);
      }
   }
   for(i=[1:8]) {
      hull() {
         translate(supports[i-1]) cylinder(h=webHt,d=supDia);
         translate(supports[i]) cylinder(h=webHt,d=supDia);
      }
   }
   hull() {
      translate(supports[1]) cylinder(h=webHt,d=supDia);
      translate(supports[3]) cylinder(h=webHt,d=supDia);
   }
   hull() {
      translate(supports[1]) cylinder(h=webHt,d=supDia);
      translate(supports[4]) cylinder(h=webHt,d=supDia);
   }
   hull() {
      translate(supports[3]) cylinder(h=webHt,d=supDia);
      translate(supports[5]) cylinder(h=webHt,d=supDia);
   }
   hull() {
      translate(supports[5]) cylinder(h=webHt,d=supDia);
      translate(supports[7]) cylinder(h=webHt,d=supDia);
   }
   hull() {
      translate(supports[3]) cylinder(h=webHt,d=supDia);
      translate(supports[6]) cylinder(h=webHt,d=supDia);
   }
}

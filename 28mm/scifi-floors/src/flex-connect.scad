wid=50.8;
ht=7;
cylDia=5;
holeDia=1.9;

cube([wid,4,ht]);
cylindricalBit();

module cylindricalBit() {
   translate([0,-cylDia/2-1,cylDia/2+(ht-cylDia)/2]) rotate([0,90,0]) {
      difference() {
         union() {
            hull() {
               cylinder($fn=40,d=cylDia,h=wid);
               translate([-cylDia/2-(ht-cylDia)/2,0,0]) cube([cylDia+(ht-cylDia),cylDia/2+2,wid]);
            }
         }
         /* hole through the center */
         translate([0,0,-1]) cylinder($fn=40,d=holeDia,h=wid+2);

         /* cutouts */
         translate([-5,-8,50.8/4-0.25]) cube([20,20,50.8/4+0.5]);
         translate([-5,-8,3*50.8/4-0.25]) cube([20,20,50.8/4+0.5]);
      }
  }
}

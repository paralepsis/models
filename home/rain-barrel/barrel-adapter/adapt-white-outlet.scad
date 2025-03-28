// 1.25" hole (32mm)
// next size up is 1.5" hole (38mm)
$fn=60;

angle = 0; // degrees outlet is off perpendicular (18 is good)


barbedConnect(ht=42);

module barbedConnect(inDia=27, outDiaSm=31.0, outDiaLg=32.1, ht=35) {
   /* outer ring */
   difference() {
      scale([1.15,0.9,1]) cylinder(d=57,h=4.05);
      translate([0,0,-0.05]) cylinder(d=inDia,h=4.2);

      /* screw holes */
      translate([25,0,-0.05]) cylinder(d=2,h=4.2);
      translate([-25,0,-0.05]) cylinder(d=2,h=4.2);
   }

   difference() {
      rotate([angle,0,0]) difference() {
         /* barbed connector */
         union() {
            translate([0,0,-2]) cylinder(d=outDiaLg,h=12+2);
            translate([0,0,12]) for (i=[0:3]) {
               translate([0,0,i*(ht-12)/4])
               cylinder(d2=outDiaSm, d1=outDiaLg,h=(ht-12)/4+0.05);
            }
         }
         translate([0,0,-2.1]) cylinder(d=inDia,h=ht+4);
      }
      /* cut off bottom after rotate */
      translate([0,0,-25]) cube(center=true,[100,100,50]);
   }
}

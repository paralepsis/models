topOD    = 45.25;
botOD    = 43.5;
lipThick = 2.25;

$fn=80;

translate([0,0,4]) rotate([180,0,0]) difference() {
   hull() {
      for (i=[-1,1]) {
         for (j=[-1,1]) {
            translate([i*topOD/2,j*topOD/2,0]) cylinder(r=5,h=4);
         }
      }
   }

   for (i=[-1,1]) {
      for (j=[-1,1]) {
         translate([i*topOD/2,j*topOD/2,-0.1]) cylinder(d=3,h=10);
      }
   }

   translate([0,0,-0.1]) cylinder(d=topOD,h=lipThick+.01);
   cylinder(d=botOD,h=16);
}

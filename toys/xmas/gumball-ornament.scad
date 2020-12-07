$fn=60;

topDia=28;
topBevel=1;
totHt=40;

botDia=48;
botHt=12;

difference() {
   form();
   insides();
}

module form() {
   translate([0,0,totHt-topBevel]) rotate_extrude() hull() {
      translate([topDia/2-topBevel,0,0]) circle(r=TopBevel);
      translate([topDia/2-topBevel-4,0,0]) circle(r=TopBevel);
   }

   cylinder(d=botDia,h=botHt);
   translate([0,0,botHt-0.1]) cylinder(d1=botDia,d2=botDia-4,h=1.1);
   translate([0,0,botHt+1-0.1]) cylinder(d1=botDia-4,d2=topDia,h=totHt-(botHt+1-0.1)-topBevel+0.2);
}

module insides() {
   translate([0,0,-0.1]) cylinder(d1=botDia-4,d2=topDia-11.5,h=totHt);
}

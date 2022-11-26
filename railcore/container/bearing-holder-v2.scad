totWid         = 91;
totLen         = 150;
sideThk        = 5;
bearOpenDia    = 27;
bearCenterDist = 100;
bearCenterHt   = 50;
cornerRad      = 3;
botThk         = 12;

$fn=40;

if (0) difference() {
   hull() {
      translate([-totWid/2+cornerRad,-totLen/2+cornerRad,0])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2);
      translate([-totWid/2+cornerRad,+totLen/2-cornerRad,0])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2);
      translate([+totWid/2-cornerRad,-totLen/2+cornerRad,0])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2);
      translate([+totWid/2-cornerRad,+totLen/2-cornerRad,0])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2);
   }

   translate([-(totWid-2*sideThk)/2, -(totLen+1)/2, botThk])
      cube([totWid-2*sideThk,totLen+1, bearCenterHt + bearOpenDia]);

   translate([0,bearCenterDist/2,bearCenterHt]) rotate([0,-90,0])
      translate([0,0,-(totWid+5)/2]) {
         cylinder(d=bearOpenDia,h=totWid+5);
         translate([0,-bearOpenDia/2,0]) cube([bearOpenDia,bearOpenDia, totWid+5]);
      }
   translate([0,-bearCenterDist/2,bearCenterHt]) rotate([0,-90,0])
      translate([0,0,-(totWid+5)/2]) {
         cylinder(d=bearOpenDia,h=totWid+5);
         translate([0,-bearOpenDia/2,0]) cube([bearOpenDia,bearOpenDia, totWid+5]);
      }

   hull() {
      translate([-totWid/2+cornerRad+15,-totLen/2+cornerRad+10,-5])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2+10);
      translate([-totWid/2+cornerRad+15,+totLen/2-cornerRad-10,-5])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2+10);
      translate([+totWid/2-cornerRad-15,-totLen/2+cornerRad+10,-5])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2+10);
      translate([+totWid/2-cornerRad-15,+totLen/2-cornerRad-10,-5])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2+10);
   }
   
   translate([-totWid/2,0,0]) rotate([0,45,0]) cube([13,totLen+2,13],center=true);
   translate([totWid/2,0,0]) rotate([0,45,0]) cube([13,totLen+2,13],center=true);
}

cylinder(d=7.75,h=totWid);

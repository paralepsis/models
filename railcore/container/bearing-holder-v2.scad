frontWid       = 95;
backWid        = 89;
totWid         = 89;
totLen         = 146;
sideThk        = 6;
bearOpenDia    = 24;
bearCenterDist = 100;
bearCenterHt   = 40;
cornerRad      = 5;
botThk         = 12;

$fn=40;

if (1) difference() {
   hull() {
      translate([-frontWid/2+cornerRad,-totLen/2+cornerRad,0])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2);
      translate([-backWid/2+cornerRad,+totLen/2-cornerRad,0])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2);
      translate([+frontWid/2-cornerRad,-totLen/2+cornerRad,0])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2);
      translate([+backWid/2-cornerRad,+totLen/2-cornerRad,0])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2);
   }

   translate([0,0, botThk+5]) hull() {
      rotate([90,0,0]) translate([-(totWid/2)+5+sideThk,0,-(totLen+1)/2])
         cylinder(r=5,h=totLen+1);
      rotate([90,0,0]) translate([(totWid/2)-5-sideThk,0,-(totLen+1)/2])
         cylinder(r=5,h=totLen+1);
      translate([-(totWid-2*sideThk)/2, -(totLen+1)/2, 5]) 
         cube([totWid-2*sideThk,totLen+1, bearCenterHt + bearOpenDia-botThk-5]);
   }

   translate([0,bearCenterDist/2+3.5,bearCenterHt]) rotate([0,-90,0])
      translate([0,0,-(frontWid+5)/2]) {
         cylinder(d=bearOpenDia,h=frontWid+5);
         translate([0,-bearOpenDia/2,0]) cube([bearOpenDia,bearOpenDia, frontWid+5]);
      }
   translate([0,-bearCenterDist/2+3.5,bearCenterHt]) rotate([0,-90,0])
      translate([0,0,-(frontWid+5)/2]) {
         cylinder(d=bearOpenDia,h=frontWid+5);
         translate([0,-bearOpenDia/2,0]) cube([bearOpenDia,bearOpenDia, frontWid+5]);
      }

   hull() {
      translate([-totWid/2+cornerRad+20,-totLen/2+cornerRad+10,-5])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2+10);
      translate([-totWid/2+cornerRad+20,+totLen/2-cornerRad-10,-5])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2+10);
      translate([+totWid/2-cornerRad-20,-totLen/2+cornerRad+10,-5])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2+10);
      translate([+totWid/2-cornerRad-20,+totLen/2-cornerRad-10,-5])
         cylinder(r=cornerRad,h=bearCenterHt+bearOpenDia/2+10);
   }
   
   translate([-totWid/2,0,0]) rotate([0,-45,0]) cube([15,totLen+2,30],center=true);
   translate([totWid/2,0,0]) rotate([0,45,0]) cube([15,totLen+2,30],center=true);
}

if (0) {
   cylinder(d=8.1,h=backWid+2);
   translate([0,30,0]) cylinder(d=8.1,h=frontWid);
}



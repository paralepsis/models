depth = 76;
sideThk = 12;
sideHt  = 60;
overallWid = 220;

dishExtra=40;
dishWall = 2;
dishRad  = 10;

topThk=4;
botThk=1;

slop = 0.01;
$fn=80;

difference() {
   translate([0,dishWall,sideHt-topThk]) top();

   translate([-(overallWid-2*sideThk)/2-sideThk/2,0+dishWall,sideHt/2]) sideCut();
   translate([(overallWid-2*sideThk)/2+sideThk/2,0+dishWall,sideHt/2]) sideCut();
   boltHoles();
}

translate([-5,0,0]) difference() {
   intersection() {
      translate([-(overallWid-2*sideThk)/2-sideThk/2,0+dishWall,sideHt/2]) side();
      translate([-(overallWid-2*sideThk)/2-sideThk/2,0+dishWall,sideHt/2]) sideCut();
   }
   boltHoles();
}
translate([5,0,0]) difference() {
   intersection() {
      translate([(overallWid-2*sideThk)/2+sideThk/2,0+dishWall,sideHt/2]) side();
      translate([(overallWid-2*sideThk)/2+sideThk/2,0+dishWall,sideHt/2]) sideCut();
   }
   boltHoles();
}

difference() {
   bottom();

   translate([-(overallWid-2*sideThk)/2-sideThk/2,0+dishWall,sideHt/2]) sideCut();
   translate([(overallWid-2*sideThk)/2+sideThk/2,0+dishWall,sideHt/2]) sideCut();
   boltHoles();
}

module top() {
   difference() {
      translate([0,0,2]) cube([overallWid-2*sideThk,depth,4], center=true);
   
      translate([0,0,-.1]) for (i=[0:1]) {
         mirror([i%2,0,0]) hull() {
            translate([-64,40-14,0]) cylinder(d=20,h=5);
            translate([-58,40-14,0]) cylinder(d=20,h=5);
            translate([-61,40,2.5]) cube([26,12,5],center=true);
         }
         mirror([i%2,0,0]) hull() {
            translate([-64,-1*(40-14),0]) cylinder(d=20,h=5);
            translate([-58,-1*(40-14),0]) cylinder(d=20,h=5);
            translate([-61,-40,2.5]) cube([26,12,5],center=true);
         }
      }
      translate([0,depth/2,4.5]) cube([100,10,10],center=true);
      translate([0,-depth/2,4.5]) cube([100,10,10],center=true);
   }
   mirror([1,0,0]) translate([-overallWid/2+sideThk,-depth/2+4.75,0]) rotate([0,90,0])cylinder(r=3.5,h=5);
   mirror([1,0,0]) translate([-overallWid/2+sideThk,depth/2-5.25,0]) rotate([0,90,0])cylinder(r=3.5,h=5);
   translate([-overallWid/2+sideThk,-depth/2+4.75,0]) rotate([0,90,0])cylinder(r=3.5,h=5);
   translate([-overallWid/2+sideThk,depth/2-5.25,0]) rotate([0,90,0])cylinder(r=3.5,h=5);
}

module boltHoles() {
   translate([-110+3,depth/2-3,sideHt-5]) rotate([0,90,0]) m3();
   translate([-110+3,-depth/2+7,sideHt-5]) rotate([0,90,0]) m3();
   mirror([1,0,0]) translate([-110+3,depth/2-3,sideHt-5]) rotate([0,90,0]) m3();
   mirror([1,0,0]) translate([-110+3,-depth/2+7,sideHt-5]) rotate([0,90,0]) m3();
   translate([-110+3,0,4]) rotate([0,90,0]) m3();
   mirror([1,0,0]) translate([-110+3,0,4]) rotate([0,90,0]) m3();
}

module m3() {
   translate([0,0,-4]) {
      cylinder(d=6,h=4);
      translate([0,0,3.9]) cylinder(d=3.2,h=13);
   }
}

module sideCut() {
   difference() {
      cube([sideThk+.1, depth+.1, sideHt+1],center=true);
   }
}


module side() {
   difference() {
      cube([sideThk, depth, sideHt],center=true);
      rotate([0,90,0]) hull() {
         myDia = 8;
         myHt  = sideHt;
         myYZThk = 8;
         myXThk  = sideThk;
      
         translate([(myHt-2*myYZThk-myDia)/2-3.5,(depth-myDia)/2-myYZThk, -myXThk/2-slop])
            cylinder(d=myDia,h=myXThk+2*slop);
         translate([(myHt-2*myYZThk-myDia)/2-3.5,-(depth-myDia)/2+myYZThk, -myXThk/2-slop])
            cylinder(d=myDia,h=myXThk+2*slop);
         translate([-(myHt-2*myYZThk-myDia)/2,(depth-myDia)/2-myYZThk, -myXThk/2-slop])
            cylinder(d=myDia,h=myXThk+2*slop);
         translate([-(myHt-2*myYZThk-myDia)/2,-(depth-myDia)/2+myYZThk, -myXThk/2-slop])
            cylinder(d=myDia,h=myXThk+2*slop);
      }
   }
}


module bottom() {
   gap = 4;
   myDia = 8;

   difference() {
      hull() {
         translate([0,-dishExtra/2+myDia/2,(dishRad+botThk)/2])
            cube([overallWid, depth+dishExtra+2*dishWall-myDia, dishRad+botThk],center=true);
         translate([-(overallWid-myDia)/2,-(depth-myDia)/2-dishExtra-dishWall,0]) cylinder(d=myDia,h=dishRad+botThk);
         translate([(overallWid-myDia)/2,-(depth-myDia)/2-dishExtra-dishWall,0]) cylinder(d=myDia,h=dishRad+botThk);
      }
      if (1) hull() {
         translate([-overallWid/2+dishRad+sideThk+gap,depth/2-dishRad,dishRad+botThk])
            sphere(r=10);
         translate([-overallWid/2+dishRad+sideThk+gap,-depth/2-dishExtra+dishRad,dishRad+botThk])
            sphere(r=10);
         translate([overallWid/2-dishRad-sideThk-gap,depth/2-dishRad,dishRad+botThk])
            sphere(r=10);
         translate([overallWid/2-dishRad-sideThk-gap,-depth/2-dishExtra+dishRad,dishRad+botThk])
            sphere(r=10);
      }
   }
}

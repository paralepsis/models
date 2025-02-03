depth = 76;
sideThk = 12;
sideHt  = 60;
overallWid = 220;

dishExtra=40;
dishWall = 2;
dishRad  = 10;

botThk=1;

slop = 0.01;

module top() {
   difference() {
      translate([0,0,2]) cube([200,depth,4], center=true);
   
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
}

translate([0,0,sideHt]) top();

translate([-(overallWid-2*sideThk)/2,0,sideHt/2]) side();
translate([(overallWid-2*sideThk)/2,0,sideHt/2]) side();

module side() {
   difference() {
      cube([sideThk, depth, sideHt],center=true);
      rotate([0,90,0]) hull() {
         myDia = 8;
         myHt  = sideHt;
         myYZThk = 8;
         myXThk  = sideThk;
      
         translate([(myHt-2*myYZThk-myDia)/2,(depth-myDia)/2-myYZThk, -myXThk/2-slop])
            cylinder(d=myDia,h=myXThk+2*slop);
         translate([(myHt-2*myYZThk-myDia)/2,-(depth-myDia)/2+myYZThk, -myXThk/2-slop])
            cylinder(d=myDia,h=myXThk+2*slop);
         translate([-(myHt-2*myYZThk-myDia)/2,(depth-myDia)/2-myYZThk, -myXThk/2-slop])
            cylinder(d=myDia,h=myXThk+2*slop);
         translate([-(myHt-2*myYZThk-myDia)/2,-(depth-myDia)/2+myYZThk, -myXThk/2-slop])
            cylinder(d=myDia,h=myXThk+2*slop);
      }
   }
}

bottom();

module bottom() {
   difference() {
      translate([0,-dishExtra/2,(dishRad+botThk)/2])
         cube([overallWid, depth+dishExtra+2*dishWall, dishRad+botThk],center=true);
      hull() {
         translate([-overallWid/2+dishRad+sideThk,depth/2-dishRad,dishRad+botThk])
            sphere(r=10);
         translate([-overallWid/2+dishRad+sideThk,-depth/2-dishExtra+dishRad,dishRad+botThk])
            sphere(r=10);
         translate([overallWid/2-dishRad-sideThk,depth/2-dishRad,dishRad+botThk])
            sphere(r=10);
         translate([overallWid/2-dishRad-sideThk,-depth/2-dishExtra+dishRad,dishRad+botThk])
            sphere(r=10);
      }
   }
}

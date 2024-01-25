include <./polyround.scad>
use <./mittelschrift.ttf>

cardWidth = 65;
cardHeight = 90;
wallThick = 4.5;
floorThick = 2.5;
slotGap = 3;
endGap = 8;
spacing=0.6;
magnetRad=3;
magnetHeight=2;


bottomComplete();

// translate([0,0,10]) topComplete();
rotate([180,0,0]) translate([0,5,-55-(cardHeight+floorThick-55+3.5+0.01)]) topComplete();

lengthToEnd = 3*cardWidth+2*slotGap+2*endGap+2*wallThick;
// % translate([lengthToEnd,0,0]) cube([0.1,20,100]);
// % translate([lengthToEnd-endGap-2,0,0]) cube([0.1,20,100]);
// % translate([endGap+2,0,0]) cube([0.1,20,100]);

veryTopPoints = [[2,2,2],[3*cardWidth+2*slotGap+2*wallThick-2+2*endGap,2,2],
                [3*cardWidth+2*slotGap+2*wallThick-2+2*endGap,33+2*wallThick-2,2],
                [2,33+2*wallThick-2,2]];
topPoints = [[0,0,2],[3*cardWidth+2*slotGap+2*wallThick+2*endGap,0,2],
                [3*cardWidth+2*slotGap+2*wallThick+2*endGap,33+2*wallThick,2],
                [0,33+2*wallThick,2]];
module topForm() {
   hull() {
      translate([0,0,cardHeight+2*floorThick-4]) linear_extrude(height=5) {
         polygon(polyRound(veryTopPoints,3));
      }
      translate([0,0,floorThick+55]) linear_extrude(height=cardHeight+floorThick-55-2+1) {
         polygon(polyRound(topPoints,20));
      }
   }
}

module topComplete() {
   difference() {
      topForm();
      hull() {
         translate([2+endGap-spacing,2-spacing,floorThick])
            cube([lengthToEnd-2*endGap-4+2*spacing,
                  33+2*wallThick-4+2*spacing,
                  cardHeight+1]);
            /* cube([3*cardWidth+2*slotGap+2*2+2*spacing,
                  33+2*wallThick-4+spacing,
                  cardHeight+1]); */
      }
      translate([12,15,cardHeight+2*floorThick+0.01-2+1])
         linear_extrude(height=2)
         text(size=18,font="DIN Mittelschrift","RACE FOR THE GALAXY");

      /* magnet cutouts */
      translate([(endGap+2)/2,33/2+wallThick,55+magnetHeight-0.1])
         cylinder($fn=30,r2=magnetRad+0.1,r1=magnetRad+0.3,h=magnetHeight);
      translate([lengthToEnd-(endGap+2)/2,33/2+wallThick,55+magnetHeight-0.1])
         cylinder($fn=30,r2=magnetRad+0.1,r1=magnetRad+0.3,h=magnetHeight);
   }
}


veryBottomPoints = [[2,2,2],[3*cardWidth+2*slotGap+2*wallThick-2+2*endGap,2,2],
                [3*cardWidth+2*slotGap+2*wallThick-2+2*endGap,33+2*wallThick-2,2],
                [2,33+2*wallThick-2,2]];
bottomPoints = [[0,0,2],[3*cardWidth+2*slotGap+2*wallThick+2*endGap,0,2],
                [3*cardWidth+2*slotGap+2*wallThick+2*endGap,33+2*wallThick,2],
                [0,33+2*wallThick,2]];
topBottomPoints = [[2+endGap,2,2],[3*cardWidth+2*slotGap+2*wallThick-2+endGap,2,2],
                  [3*cardWidth+2*slotGap+2*wallThick-2+endGap,33+2*wallThick-2,2],
                  [2+endGap,33+2*wallThick-2,2]];
module bottomForm() {
   hull() {
      linear_extrude(height=4) {
         polygon(polyRound(veryBottomPoints,20));
      }
      translate([0,0,2]) linear_extrude(height=55) {
         polygon(polyRound(bottomPoints,20));
      }
   }
   translate([0,0,2]) linear_extrude(height=75) {
      polygon(polyRound(topBottomPoints,20));
   }
}

module bottomComplete() {
   difference() {
      bottomForm();

      /* holes to hold cards */
      cutouts();

      /* circular cutouts to help grab cards */
      translate([cardWidth/2+wallThick+endGap,0,55+20+floorThick])
         rotate([-90,0,0]) cylinder($fn=50,r=20,h=50);
      translate([1.5*cardWidth+wallThick+slotGap+endGap,0,55+20+floorThick])
         rotate([-90,0,0]) cylinder($fn=50,r=20,h=50);
      translate([2.5*cardWidth+wallThick+2*slotGap+endGap,0,55+20+floorThick])
         rotate([-90,0,0]) cylinder($fn=50,r=20,h=50);

      /* magnet cutouts */
      translate([(endGap+2)/2,33/2+wallThick,55+2-magnetHeight+0.1])
         cylinder($fn=30,r1=magnetRad+0.1,r2=magnetRad+0.3,h=magnetHeight);
      translate([lengthToEnd-(endGap+2)/2,33/2+wallThick,55+2-magnetHeight+0.1])
         cylinder($fn=30,r1=magnetRad+0.1,r2=magnetRad+0.3,h=magnetHeight);
   }
}



module cutouts() {
   translate([wallThick+endGap,wallThick,floorThick]) {
      translate([2*cardWidth + 2*slotGap,0,0]) base();
      translate([cardWidth + slotGap,0,0]) phases();
      translate([cardWidth + slotGap,18,0]) starters();
      artifacts();
      translate([0,18,0]) tokens();
   }
}

module phases() {
   cube([cardWidth,15,cardHeight]);
}
module starters() {
   cube([cardWidth,15,cardHeight]); /* was 12 */
}
module artifacts() {
   cube([cardWidth,15,cardHeight]);
}
module base() {
   cube([cardWidth,30+3,cardHeight]); /* +3 just to make things even */
}
module tokens() {
   cube([cardWidth,15,cardHeight]); /* was 12 */
}


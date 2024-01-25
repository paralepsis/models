include <./polyround.scad>
// use <./boston_traffic.ttf>
// use <./major_shift.ttf>
use <./postnobillscolombo-extrabold.ttf>

majorX = 220;
minorX = 180;
majorY = 100;


numberSidePts=[[-minorX/2,-20,2],[-majorX/2,majorY,2],[majorX/2,majorY,2],[minorX/2,-20,2]];

mountSidePts=[[-majorX/2,0,2],[-majorX/2,majorY,0.2],[majorX/2,majorY,0.2],[majorX/2,0,2]];

// polygon(polyRound(mountSidePts,3));

difference() {
   linear_extrude(height=5) polygon(polyRound(numberSidePts,3));
   translate([0,0,-0.1]) linear_extrude(height=10) text(size=80,halign="center",font="Post No Bills Colombo","830",$fn=100);
}

translate([0,majorY+3-0.1,-majorY+5]) rotate([90,0,0]) linear_extrude(height=5) polygon(polyRound(mountSidePts,3));

/*
topPoints = [[0,0,2],[3*cardWidth+2*slotGap+2*wallThick+2*endGap,0,2],
                [3*cardWidth+2*slotGap+2*wallThick+2*endGap,33+2*wallThick,2],
                [0,33+2*wallThick,2]];
module topForm() {
   hull() {
      translate([0,0,cardHeight+2*floorThick-4]) linear_extrude(height=5) {
         polygon(polyRound(veryTopPoints,3));
*/

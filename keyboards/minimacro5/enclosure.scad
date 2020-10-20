
/* Notes:
 * - my M2 heat set nuts, the shortest ones, are 3.5mm in diameter and 4mm
 *   long.
 * - stock miniMACRO5 shell leaves 5mm from top face to where the PCB hits
 *   the plastic underneath. Mill-max sockets supposedly take up an additional
 *   0.64mm of space above the board.
 * - rotary encoders only need about 12.25mm in the Y.
 */

$fn=30;

// translate([0,0,-5]) import("./orig/miniMACRO5.stl");
shape();

module shape() {
   difference() {
      simpleBody(ht=12);
      pcbPlus(ht=20);
      switchHoles();
   }
}

//Thickness of entire plate
plateThickness=4.8;
//Unit square length, from Cherry MX data sheet
lkey=19.05;
//Hole size, from Cherry MX data sheet
holesize=14;
//length, in units, of board
width=15;
//Height, in units, of board
height=1;

//calculated vars

holediff=lkey-holesize;
w=width*lkey;
h=height*lkey;

//
// THINGS TO PRINT
//
module miniHoles() {
   mm5 = [
         //start ROW 0
         [[0,0],1,"s"],
         [[1,0],1,"s"],
         [[2,0],1,"r"],
         [[3,0],1,"r"],
         [[4,0],1,"r"],
         ];

   holematrix(mm5,0,h-lkey);
}

module switchhole(size=1,openable=0,switch=1){
    translate([0,0,-0.1]) union(){
        if (switch) {
           cube([holesize,holesize,plateThickness+0.4+0.65]);
           translate([holesize/2-2,-1,1.3]) cube([4,holesize+2,plateThickness+0.4 - 1.3+0.65]); // for clip to catch
        }
        else /* encoder */ {
           translate([0,(holesize-12.25)/2,0]) {
              cube([holesize, 12.25, plateThickness+0.4]);
              translate([-0.5,0,1.8]) cube([holesize+1.5, 12.25, plateThickness+0.4]);
           }
        }
    }
}

module holematrix(holes,startx,starty){
    for (key = holes){
        translate([startx+lkey*key[0][0], starty-lkey*key[0][1], 0])
        translate([(lkey*key[1]-holesize)/2,(lkey - holesize)/2, 0])
        switchhole(size=key[1],switch=(key[2] == "s" ? 1 : 0));
    }
}

module pcbPlus(ht=1) {
   translate([-12.987,-11.087,0]) cube([12.987+89.187,11.087*2,ht]);

   /* cutout to account for solder points for arduino riser */
   translate([89.187-35-3.75,-11.087,-1.5]) cube([32,11.087*2,ht+1.5]);

   /* screws, heat set inserts */
   translate([-9.9,8,-4]) cylinder(d=3.65,h=5);
   translate([-9.9,-8,-4]) cylinder(d=3.65,h=5);
   translate([86.1,8,-4]) cylinder(d=3.65,h=5);
   translate([86.1,-8,-4]) cylinder(d=3.65,h=5);

   /* middle screw/heat set inserts */
   translate([28.5,8,-4]) cylinder(d=1.65,h=5);
   translate([28.5,-8,-4]) cylinder(d=1.65,h=5);

   /* USB */
   translate([80,-5.5,0.0]) cube([20,11,10.5]);
}

module simpleBody(ht=10.5) {
   if (0) {
      /* 5.65mm accounts for mill-max sockets */
      translate([0,0,-5.65]) linear_extrude(height=ht)
         polygon(points=[[-16,-14],[-16,14],[92,14],[92,-14]]);
   }
   else {
      translate([0,0,-5.65]) linear_extrude(height=ht)
         hull() {
            translate([-14,-13,0]) circle(r=2);
            translate([-14,13,0]) circle(r=2);
            translate([90,-13,0]) circle(r=2);
            translate([90,13,0]) circle(r=2);
         }
   }
}

module switchHoles() {
   translate([-7.15-2.525+0.15,-7.15-2.525+0.15,-5.65]) miniHoles();
}

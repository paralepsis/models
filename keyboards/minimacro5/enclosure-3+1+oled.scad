
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
enclosure();
// rotate([180,0,0]) translate([0,0,15-5-2]) bottomPlate();
// bottomPlate();

module enclosure() {
   difference() {
      simpleBody(ht=15); // 15 is the production value
      pcbPlus(ht=20);
      switchHoles();
      translate([-17-1.2,-14.75,-5.65]) oled12864();
   }

}

if (0) translate([70,-15,0]) difference() {
   simpleForm();
//   translate([-1,bodyWid,0]) rotate([90,0,0]) linear_extrude(height=bodyWid) polygon(points=oled128x32);
     oled12864();
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
         [[0,0],1,"x"],
         [[1,0],1,"s"],
         [[2,0],1,"r"],
         [[3,0],1,"r"],
         [[4,0],1,"r"],
         ];

   holematrix(mm5,0,h-lkey);
}


/* OLED values */
bodyWid     = 26;
bodyLen     = 25.4;
bodyDep     = 3;
windowLen   = 25;
windowOff   = 5;
windowDep   = 0.5;

epsilon     = 0.1;

   
module simpleForm(h=3.5) {
   hull() {
      translate([-2,-2,0]) cylinder(r=2,h=h);
      translate([-2,2+bodyWid,0]) cylinder(r=2,h=h);
      translate([2+bodyLen,2+bodyWid,0]) cylinder(r=2,h=h);
      translate([2+bodyLen,-2,0]) cylinder(r=2,h=h);
   }
}

module oled12864(extend=1) {
   translate([0,0,1.7]) cube([bodyLen, bodyWid, bodyDep]);
   if (extend) translate([-0.2,-0.2,3.2]) cube([bodyLen+0.4, bodyWid+1+0.4, 20]);

   translate([0,1.5,0.7]) cube([bodyLen, 20.5, bodyDep]);
   translate([1,8.5,-0.1]) cube([bodyLen-2, 12.5, bodyDep]);
   translate([0,23,0.7]) cube([bodyLen, bodyWid-22, bodyDep]);
}

module switchhole(size=1,openable=0,switch=1){
    translate([0,0,-0.1]) union(){
        if (switch) {
           cube([holesize,holesize,plateThickness+0.4+0.65]);
           translate([holesize/2-2,-1,1.3]) cube([4,holesize+2,plateThickness+0.4 - 1.3+0.65]); // for clip to catch
        }
        else /* encoder */ {
           translate([0,(holesize-12.15)/2,0]) {
              cube([holesize, 12.15, plateThickness+0.4]);
              translate([-0.5,0,1.8]) cube([holesize+1.5, 12.25, plateThickness+0.4]);
           }
        }
    }
}

module holematrix(holes,startx,starty){
    for (key = holes){
        translate([startx+lkey*key[0][0], starty-lkey*key[0][1], 0])
        translate([(lkey*key[1]-holesize)/2,(lkey - holesize)/2, 0])
        if (key[2] != "x") {
           switchhole(size=key[1],switch=(key[2] == "s" ? 1 : 0));
        }
    }
}

module bottomPlate() {
   ht = 1.5; // was 2.0
   gap = 0.2;
   postHt = 7.0;
   postDia = 5;

   difference() { 
      union() {
         translate([-12.987+gap-10,-11.087+gap-2,0])
            cube([12.987+89.187-2*gap+10,11.087*2-2*gap+2,ht]);

         translate([-12.987+gap,-11.087+gap,-1*(5-ht)])
            cube([62-gap,11.087*2-2*gap,5-ht+0.1]);

         translate([84.5,-11.087+gap,-1*(postHt-ht)])
            cube([89.187-gap-84.5,11.087*2-2*gap,postHt-ht+0.1]);

         /* posts */
         translate([-9.9,8,-1*(postHt-ht)]) cylinder(d=postDia,h=5.0);
         translate([-9.9,-8,-1*(postHt-ht)]) cylinder(d=postDia,h=5.0);
         // translate([86.1,8,-1*(postHt-ht)]) cylinder(d=postDia,h=5.0);
         // translate([86.1,-8,-1*(postHt-ht)]) cylinder(d=postDia,h=5.0);
         translate([28.5,8,-1*(postHt-ht)]) cylinder(d=postDia,h=5.0);
         translate([28.5,-8,-1*(postHt-ht)]) cylinder(d=postDia,h=5.0);
      }

      /* USB */
      translate([83,-5.5,-20.0]) cube([20,11,25.5]);

      /* reset */
      translate([-12.987+gap+20.0,11.087-5,-5+ht-0.1])
         cube([5,5,10]);
      translate([-12.987+gap+20.0+2.5,11.087-5,-5+ht-0.1])
         cylinder(d=5,h=10);
      translate([-12.987+gap+20.0-2.5,11.087-5-4,-5+ht-0.1])
         cube([10,10,3]);

      /* screw holes (make < -5.2 if needed to fill hole) */
      translate([-9.9,8,-8.3]) cylinder(d=2.25,h=8.0);
      translate([-9.9,8,0]) cylinder(d=4,h=2.1);

      translate([-9.9,-8,-8.3]) cylinder(d=2.25,h=8.0);
      translate([-9.9,-8,0]) cylinder(d=4,h=10);
      translate([86.1,8,-8.3]) cylinder(d=2.25,h=8.0);
      translate([86.1,8,0]) cylinder(d=4,h=10);
      translate([86.1,-8,-8.3]) cylinder(d=2.25,h=8.0);
      translate([86.1,-8,0]) cylinder(d=4,h=10);

      /* holes past oled */
      translate([-9.9-10-1,8+1,-8.3]) cylinder(d=2.25,h=8.0);
      translate([-9.9-10-1,8+1,0]) cylinder(d=4,h=2.1);
      translate([-9.9-10-1,-8-2,-8.3]) cylinder(d=2.25,h=8.0);
      translate([-9.9-10-1,-8-2,0]) cylinder(d=4,h=10);
   
      /* middle screw holes */
      translate([28.5,8,-8.3]) cylinder(d=2.25,h=8.0);
      translate([28.5,8,0]) cylinder(d=4,h=10);
      translate([28.5,-8,-8.3]) cylinder(d=2.25,h=8.0);
      translate([28.5,-8,0]) cylinder(d=4,h=10);

   }
}

module pcbPlus(ht=1) {
   translate([-12.987-10,-11.087-3,0]) cube([12.987+89.187+10,11.087*2+3,ht]);

   /* cutout to account for solder points for arduino riser */
   translate([89.187-35-3.75,-11.087,-1.5]) cube([32,11.087*2,ht+1.5]);

   /* screws, heat set inserts */
   translate([-9.9,8,-4]) cylinder(d2=3.65, d1=3.4,h=5);
   translate([-9.9,-8,-4]) cylinder(d2=3.65, d1=3.4,h=5);
   translate([86.1,8,-4]) cylinder(d2=3.65, d1=3.4,h=5);
   translate([86.1,-8,-4]) cylinder(d2=3.65, d1=3.4,h=5);

   /* new ones past OLED */
   translate([-9.9-10-1,8+1,-4]) cylinder(d2=3.65, d1=3.4,h=5);
   translate([-9.9-10-1,-8-2,-4]) cylinder(d2=3.65, d1=3.4,h=5);

   /* middle screw/heat set inserts */
   translate([28.5,8,-4]) cylinder(d2=3.65, d1=3.4,h=5);
   translate([28.5,-8,-4]) cylinder(d2=3.65, d1=3.4,h=5);

   /* USB */
   translate([80,-6,0.0]) cube([20,12,10.5]);
}

// this is the main form for the case.
module simpleBody(ht=10.5) {
   if (0) {
      /* 5.65mm accounts for mill-max sockets */
      translate([0,0,-5.65]) linear_extrude(height=ht)
         polygon(points=[[-16,-14],[-16,14],[92,14],[92,-14]]);
   }
   else {
      translate([0,0,-5.65]) linear_extrude(height=ht)
         hull() {
            translate([-23,-15,0]) circle(r=2); // changed here for OLED
            translate([-23,15,0]) circle(r=2);
            translate([89,-15,0]) circle(r=2);
            translate([89,15,0]) circle(r=2);
         }
   }
}

module switchHoles() {
   translate([-7.15-2.525+0.15,-7.15-2.525+0.15,-5.65]) miniHoles();
}
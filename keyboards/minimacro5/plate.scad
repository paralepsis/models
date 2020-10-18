// NOTE:
// - I think that a little more tuning of the space around screw-in stabs is
//   in order. Acrylic version was a bit of a tight fit when printed at 0.3mm.
//   Maybe need a little more space in the Y?
//

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
   holematrix(pokerkeyboard,0,h-lkey);
}

//poker keyboard layout layer
pokerkeyboard = [
//start ROW 0
[[0,0],1],
[[1,0],1],
[[2,0],1],
[[3,0],1],
[[4,0],1],
];

module switchhole(size=1,openable=0,up=1){
    translate([0,0,-0.1]) union(){
        cube([holesize,holesize,plateThickness+0.4]);
        translate([holesize/2-2,-1,1.3]) cube([4,holesize+2,plateThickness+0.4 - 1.3]); // for clip to catch
    }
}

module holematrix(holes,startx,starty){
    for (key = holes){
        translate([startx+lkey*key[0][0], starty-lkey*key[0][1], 0])
        translate([(lkey*key[1]-holesize)/2,(lkey - holesize)/2, 0])
        switchhole(size=key[1],up=(key[2] == "u" ? 1 : 0));
    }
}

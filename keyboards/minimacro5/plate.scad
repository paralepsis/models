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
height=5;
//Radius of mounting holes
mountingholeradius=2.5;
//height of switch clasp cutouts
cutoutheight = 3;
//width of switch clasp cutouts
cutoutwidth = 1;

cornerradius=3;

//calculated vars

holediff=lkey-holesize;
w=width*lkey;
h=height*lkey;

//
// THINGS TO PRINT
//
if (1) {
    translate([0,0,plateThickness]) rotate([180,0,0]) intersection() {
        acrylicDZPlate();
        lhs(slop=0.2);
    }
}

module lhs(slop=0.2) {
    translate([0,0,-1]) linear_extrude(height=plateThickness+2)
        polygon(points=[[-2,-2], [-2,100], [134-slop,100], [134-slop,76.5-slop],
                        [143-slop,76.5-slop], [143-slop,57-slop],
                        [148-slop,57-slop], [148-slop,38+slop],
                        [138-slop,38+slop], [138-slop,-2]]);
}


//poker keyboard layout layer
pokerkeyboard = [
//start ROW 0
[[0,0],1],
[[1,0],1],
[[2,0],1],
[[3,0],1],
[[4,0],1],
// [[13,0],2, "d"],
];

module plate(w,h,extraLeft=0,extraBottom=0,extraTop=0,extraRight=0){
        hull() {
        translate([cornerradius-extraLeft,cornerradius-extraBottom]) cylinder(r=cornerradius,h=plateThickness);
            translate([w-cornerradius+extraRight,cornerradius-extraBottom]) cylinder(r=cornerradius,h=plateThickness);
            translate([cornerradius-extraLeft,h-cornerradius+extraTop]) cylinder(r=cornerradius,h=plateThickness);
            translate([w-cornerradius+extraRight,h-cornerradius+extraTop]) cylinder(r=cornerradius,h=plateThickness);
    }
    // cube([w,h,plateThickness]);
}

// note: +0.2 is to make for clean differences

module switchhole(size=1,openable=0,up=1){
    translate([0,0,-0.1]) union(){
        cube([holesize,holesize,plateThickness+0.2]);
                translate([holesize/2-2,-1,0]) cube([4,holesize+2,plateThickness+0.1 - 1.3]); // for clip to catch

                if (openable) {
            translate([-cutoutwidth,1,0])
            cube([holesize+2*cutoutwidth,cutoutheight,plateThickness+0.2]);

            translate([-cutoutwidth,holesize-cutoutwidth-cutoutheight,0])
            cube([holesize+2*cutoutwidth,cutoutheight,plateThickness+0.2]);
        }

        if (size >= 2) {
            translate([-8.4,-1*(18-holesize)/2,0])
                cube([6.9,18,plateThickness+0.1-2]);
            translate([holesize+1.5,-1*(18-holesize)/2,0])
                cube([6.9,18,plateThickness+0.1-2]);

            if (up) {
                translate([-8.4,1,0])
                    cube([6.9,holesize-1,plateThickness+0.2]);
                translate([holesize+1.5,1,0])
                    cube([6.9,holesize-1,plateThickness+0.2]);
                translate([-8.4,holesize-0.1,0])
                    cube([holesize + 16.8,3.1,plateThickness+0.1-1.5]);
            }
            else {
                translate([-8.4,0,0])
                    cube([6.9,holesize-1,plateThickness+0.2]);
                translate([holesize+1.5,0,0])
                    cube([6.9,holesize-1,plateThickness+0.2]);
                translate([-8.4,-3,0])
                    cube([holesize + 16.8,3.1,plateThickness+0.1-1.5]);
            }
        }
    }
}

module holematrix(holes,startx,starty){
    for (key = holes){
        translate([startx+lkey*key[0][0], starty-lkey*key[0][1], 0])
        translate([(lkey*key[1]-holesize)/2,(lkey - holesize)/2, 0])
        switchhole(size=key[1],up=(key[2] == "u" ? 1 : 0));
    }
}

module mountingholes(outsides=1, dzExtras=1){
    translate([(1+1/3)*lkey,3.5*lkey,-0.1])
    cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=20);

    translate([(13+2/3)*lkey,3.5*lkey,-0.1])
    cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=20);
    
    translate([(6.75)*lkey,2.5*lkey,-0.1])
    cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=20);

    translate([(6.75)*lkey,2.5*lkey,-0.1])
    cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=20);

    translate([(10)*lkey,.5*lkey,-0.1])
    cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=20);

    if (outsides) {
        hull() {
            // note: the original offset in X was 0.2*lkey; modded for acrylic
            // translate([(.2)*lkey,2*lkey,-0.1])
            //
            translate([(.2)*lkey-1,2*lkey,-0.1])
            cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=20);
            // added to extend LHS hole to edge
            translate([-1,2*lkey,-0.1])
            cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=20);
        }

        hull() {
            translate([(14.8)*lkey,2*lkey,-0.1])
            cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=20);

            translate([(14.8)*lkey+10,2*lkey,-0.1])
            cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=20);
        }
    }

    if (dzExtras) {
        translate([(1.25)*lkey,.5*lkey,-0.1])
        cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=20);

        translate([(4)*lkey,4.5*lkey,-0.1])
        cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=20);

        translate([(10)*lkey,4.5*lkey,-0.1])
        cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=20);
        
    }
}

module acrylicDZPlate(){
    $fn=30;
    difference(){
        plate(w,h,extraLeft=1,extraBottom=1,extraRight=2);
        // plate(w,h);
        holematrix(pokerkeyboard,0,h-lkey);
        mountingholes(dzExtras=0);
    }
}

// translate([0,0,3]) import(file="swillkb.dxf");

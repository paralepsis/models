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
mountingholeradius=2.75;
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
        lhs(slop=0.05);
    }
}
if (1) {
    translate([-140,-110,plateThickness]) rotate([180,0,0]) difference() {
        acrylicDZPlate();
        lhs(slop=-0.05);
    }
}

translate([0,0,0]) cylinder(r=10,h=0.3);
translate([138,5,0]) cylinder(r=10,h=0.3);
translate([148,-48,0]) cylinder(r=10,h=0.3);
translate([134,-94,0]) cylinder(r=10,h=0.3);
translate([143,-75,0]) cylinder(r=10,h=0.3);
translate([0,-94,0]) cylinder(r=10,h=0.3);

translate([0,-110,0]) cylinder(r=10,h=0.3);
translate([0,-145,0]) cylinder(r=10,h=0.3);
translate([6,-170,0]) cylinder(r=10,h=0.3);
translate([-4,-196,0]) cylinder(r=10,h=0.3);
translate([148,-205,0]) cylinder(r=10,h=0.3);
translate([148,-110,0]) cylinder(r=10,h=0.3);

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
[[5,0],1],
[[6,0],1],
[[7,0],1],
[[8,0],1],
[[9,0],1],
[[10,0],1],
[[11,0],1],
[[12,0],1],
[[13,0],2, "d"],
//start ROW 1
[[  0,1],1.5],
[[1.5,1],1],
[[2.5,1],1],
[[3.5,1],1],
[[4.5,1],1],
[[5.5,1],1],
[[6.5,1],1],
[[7.5,1],1],
[[8.5,1],1],
[[9.5,1],1],
[[10.5,1],1],
[[11.5,1],1],
[[12.5,1],1],
[[13.5,1],1.5],
//start ROW 2
[[   0,2],1.75],
[[1.75,2],1],
[[2.75,2],1],
[[3.75,2],1],
[[4.75,2],1],
[[5.75,2],1],
[[6.75,2],1],
[[7.75,2],1],
[[8.75,2],1],
[[9.75,2],1],
[[10.75,2],1],
[[11.75,2],1],
[[12.75,2],2.25,"u"],
//start ROW 3
[[   0,3],2.25, "d"],
[[2.25,3],1],
[[3.25,3],1],
[[4.25,3],1],
[[5.25,3],1],
[[6.25,3],1],
[[7.25,3],1],
[[8.25,3],1],
[[9.25,3],1],
[[10.25,3],1],
[[11.25,3],1],
[[12.25,3],1.75],
[[14,3],1],
//start ROW 4
[[   0,4],1.25],
[[1.25,4],1.25],
[[2.5 ,4],1.25],
[[3.75,4],2.25, "u"],
[[6  ,4],1.25],
[[7.25,4],2.75, "u"],
[[10 ,4],1],
[[11 ,4],1],
[[12 ,4],1],
[[13 ,4],1],
[[14,4],1],
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
            translate([(.2)*lkey-2,2*lkey,-0.1])
            cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=20);
            // added to extend LHS hole to edge
            translate([-1,2*lkey,-0.1])
            cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=20);
        }

        hull() {
            translate([(14.8)*lkey+2,2*lkey,-0.1])
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
        plate(w,h,extraLeft=1,extraBottom=1,extraRight=1.25);
        // plate(w,h);
        holematrix(pokerkeyboard,0,h-lkey);
        mountingholes(dzExtras=0);
    }
}

// translate([0,0,3]) import(file="swillkb.dxf");


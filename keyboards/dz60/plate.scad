//Thickness of entire plate
plateThickness=3;
//Unit square length, from Cherry MX data sheet
lkey=19.05;
//Hole size, from Cherry MX data sheet
holesize=14;
//length, in units, of board
width=15;
//Height, in units, of board
height=5;
//Radius of mounting holes
mountingholeradius=3;
//height of switch clasp cutouts
cutoutheight = 3;
//width of switch clasp cutouts
cutoutwidth = 1;

cornerradius=3;

//calculated vars

holediff=lkey-holesize;
w=width*lkey;
h=height*lkey;

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
[[13,0],1],
[[14,0],1],
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
[[12.75,2],2.25],
//start ROW 3
[[   0,3],2.25],
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
[[3.75,4],2.25],
[[6  ,4],1.25],
[[7.25,4],2.75],
[[10 ,4],1],
[[11 ,4],1],
[[12 ,4],1],
[[13 ,4],1],
[[14,4],1],
];

module plate(w,h){
        hull() {
		translate([cornerradius,cornerradius]) cylinder(r=cornerradius,h=plateThickness);
        	translate([w-cornerradius,cornerradius]) cylinder(r=cornerradius,h=plateThickness);
        	translate([cornerradius,h-cornerradius]) cylinder(r=cornerradius,h=plateThickness);
        	translate([w-cornerradius,h-cornerradius]) cylinder(r=cornerradius,h=plateThickness);
	}
	// cube([w,h,plateThickness]);
}

// note: +0.2 is to make for clean differences

module switchhole(size=1,openable=0){
	translate([0,0,-0.1]) union(){
		cube([holesize,holesize,plateThickness+0.2]);
                translate([holesize/2-3,-1,0]) cube([6,holesize+2,plateThickness+0.1 - 1.5]); // for clip to catch

                if (openable) {
			translate([-cutoutwidth,1,0])
			cube([holesize+2*cutoutwidth,cutoutheight,plateThickness+0.2]);

			translate([-cutoutwidth,holesize-cutoutwidth-cutoutheight,0])
			cube([holesize+2*cutoutwidth,cutoutheight,plateThickness+0.2]);
		}

		if (size >= 2) {
			translate([-8.3,0,0]) cube([6.7,holesize,plateThickness+0.2]);
			translate([holesize+1.6,0,0]) cube([6.7,holesize,plateThickness+0.2]);
		}
	}
}

module holematrix(holes,startx,starty){
	for (key = holes){
		translate([startx+lkey*key[0][0], starty-lkey*key[0][1], 0])
		translate([(lkey*key[1]-holesize)/2,(lkey - holesize)/2, 0])
		switchhole(size=key[1]);
	}
}

module mountingholes(outsides=1, dzExtras=1){
	translate([(1+1/3)*lkey,3.5*lkey,-0.1])
	cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=12);

	translate([(13+2/3)*lkey,3.5*lkey,-0.1])
	cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=12);
	
	translate([(6.75)*lkey,2.5*lkey,-0.1])
	cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=12);

	translate([(6.75)*lkey,2.5*lkey,-0.1])
	cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=12);

	translate([(10)*lkey,.5*lkey,-0.1])
	cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=12);

	if (outsides) {
		translate([(.2)*lkey,2*lkey,-0.1])
		cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=12);

		translate([(14.8)*lkey,2*lkey,-0.1])
		cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=12);
	}

	if (dzExtras) {
		translate([(1.25)*lkey,.5*lkey,-0.1])
		cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=12);

		translate([(4)*lkey,4.5*lkey,-0.1])
		cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=12);

		translate([(10)*lkey,4.5*lkey,-0.1])
		cylinder(h=plateThickness+0.2,r=mountingholeradius, $fn=12);
		
	}
}

module pokerplate(){
	$fn=30;
	difference(){
		plate(w,h);
		holematrix(pokerkeyboard,0,h-lkey);
		mountingholes();
	}
}

// translate([0,0,3]) import(file="swillkb.dxf");

pokerplate();

% translate([0,0,-1]) linear_extrude(height=plateThickness+2) polygon(points=[[-1,-1], [-1,100], [134,100], [134,76.5], [143,76.5], [143,57], [148,57], [148,38], [138,38], [138,-1]]);


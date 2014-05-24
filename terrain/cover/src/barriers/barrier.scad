use <holeCutout.scad>
use <hole.scad>

height=60;
depth=25;
width=40;

/* Overlay rough build volume for reference */
% translate([0,0,155/2]) cube(size=[240, 153, 155], center=true);

translate([9,-28,0]) rotate([0,0,180]) import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");

render() barrierWall();

module barrierWall() {
	translate([-2*width - 1.95,0,0]) brokenBarrier3();
	translate([-1 * width - 1.1,0,0]) rotate([0,0,2]) damagedBarrier2();
	translate([0, 0,0]) damagedBarrier1();
	translate([width + 0.75,0,0]) rotate([0,0,-2]) brokenBarrier1();
	translate([width + 0.75-5,0,5]) rotate([90,5,23]) brokenBarrier1Top();
	translate([2*width + 1.75,0,0]) rotate([0,0,180]) brokenBarrier2();
}


/******** DEFORMED BARRIER MODULES ********/

module brokenBarrier1() {
	difference() {
		texasBarrier();
		brokenBarrier1Top();
		translate([-30,10,48]) rotate([0,180,180]) holeCutout();
	}
}

module brokenBarrier1Top() {
	intersection() {
		texasBarrier();
		union() {
			translate([0,0,height/2+30]) 
				cube([width+2,depth,height-20],center=true);
			translate([40,-11,50]) rotate([0,180,0]) holeCutout();
		}
	}
}

module brokenBarrier2() {
	difference() {
		texasBarrier();
		translate([0,0,height/2+25]) 
			cube([width+2,depth,height-20],center=true);
		translate([40,-6,37]) rotate([0,189,0]) holeCutout();
	}
}

module brokenBarrier3() {
	difference() {
		texasBarrier();
		translate([40,-11,55]) rotate([0,190,4]) holeCutout();
		translate([0,0,height/2+35]) cube([width+2,depth,height-20],center=true);

	}
}

module damagedBarrier1() {
	difference() {
		texasBarrier();
		translate([-13,25,17]) rotate([95,5,0]) hole();
	}
}

module damagedBarrier2() {
	difference() {
	texasBarrier();
	translate([100,-11,95]) rotate([0,190,0]) holeCutout();
	}
}

//render() brokenBarrier1();
//render() translate([-5,0,5])rotate([90,5,23]) brokenBarrier1Top();

/******** TEXAS BARRIER MODULE ********/

module texasBarrier() {
difference() {
	translate([width/2,-depth/2,0]) rotate([0,-90,0])
		linear_extrude(height=width)
			polygon(points=[[0,0], [0,depth], [9,depth-2],[9,depth/2+5], 	
					[height-1,depth/2+4], [height, depth/2+3],
					[height, depth/2-3], [height-1,depth/2-4], 
					[9,depth/2-5], [9,2], [0,0]],
					paths=[[0,1,2,3,4,5,6,7,8,9,10,0]]);

	/* Lazy way to round off the corners of the bottom. */
	translate([width/2+2,depth/2-2,5]) rotate([0,0,30]) 
		cube([9,10,12],center=true);
	translate([-1*(width/2+2),depth/2-2,5]) rotate([0,0,-30]) 
		cube([9,10,12],center=true);
	translate([width/2+2,-depth/2+2,5]) rotate([0,0,60]) 
		cube([10,9,12],center=true);
	translate([-1*(width/2+2),-depth/2+2,5]) rotate([0,0,-60]) 
		cube([10,9,12],center=true);
	}
}
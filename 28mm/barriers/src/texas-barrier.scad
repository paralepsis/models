/* Bremer Wall Set
 */
use <holeCutout.scad>
use <holeCutout2.scad>
use <hole.scad>
use <baseTexture220x90.scad>
use <baseTexture200x70.scad>

height=60;
depth=25;
width=40;

/* Overlay rough build volume for reference */
% translate([0,0,155/2]) cube(size=[240, 153, 155], center=true);

// translate([9,-28,5]) rotate([0,0,180]) import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");

bremerBarrier();

// completeModel2();
// completeModel1();

/******** COMPLETE MODEL 1 ********/

module completeModel1() {
    translate([0,20,0])
	difference() {
	union() {
	    barrierWall1();
	    base1();
	}
	translate([0,0,-10]) cube(size=[240, 153, 20],center=true);	
    }
}

module completeModel2() {
	difference() {
	union() {
	    barrierWall2();
	    // base2();
	}
	translate([0,0,-10]) cube(size=[240, 153, 20],center=true);	
    }
}

module simpleBarrierWall1() {
    translate([-2*width - 1.95,0,0]) bremerBarrier();
    translate([-1 * width - 1.1,0,0]) rotate([0,0,2]) bremerBarrier();
    translate([0, 0,0]) damagedBarrier1();
    translate([width + 0.75,0,0]) rotate([0,0,-2]) bremerBarrier();
    translate([width + 0.75-5,0,5]) rotate([90,5,23]) bremerBarrier1Top();
    translate([2*width + 1.75,0,0]) rotate([0,0,180]) bremerBarrier();
}

module barrierWall1() {
    translate([-2*width - 1.95,0,0]) brokenBarrier3();
    translate([-1 * width - 1.1,0,0]) rotate([0,0,2]) damagedBarrier2();
    translate([0, 0,0]) damagedBarrier1();
    translate([width + 0.75,0,0]) rotate([0,0,-2]) brokenBarrier1();
    translate([width + 0.75-5,0,5]) rotate([90,5,23]) brokenBarrier1Top();
    translate([2*width + 1.75,0,0]) rotate([0,0,180]) brokenBarrier2();
}

module barrierWall2() {
	difference() {
		union() {
			translate([-1 * width - 0.8, 0,0]) 
			    rotate([0,0,181.3]) damagedBarrier4();
			damagedBarrier3();
			translate([width + 1.2, 0,0]) rotate([0,0,-0.8]) bremerBarrier();
			translate([-2 * width - 1.86, 0,0]) brokenBarrier4();
			translate([2*width + 1.92,0,0]) rotate([0,0,2]) brokenBarrier5();
		}
		translate([-41,25,17]) rotate([95,5,0]) hole();
		translate([21,21,12]) rotate([83,-57,0]) hole();
		translate([34,21,18]) rotate([83,-97,0]) hole();
		translate([31,28,6]) rotate([83,-35,0]) scale([1,1,1.5]) hole();
		translate([26,-22,10]) rotate([83,-57,180]) hole();
	}
}

/******** BASE MODULES ********/

module base1() {
    $fs=0.3;
    translate([0,-25,-2])
	intersection() {	
	hull() {
	    translate([-98,-40]) cylinder(r=5,h=40,center=true);
	    translate([-98,40]) cylinder(r=5,h=40,center=true);
	    translate([98,-40]) cylinder(r=5,h=40,center=true);
	    translate([98,40]) cylinder(r=5,h=40,center=true);
	}
	scale([.93,1,1]) translate([-110,-45,0]) baseTexture220x90();
    }
}

module base2() {
    $fs=0.3;
    translate([0,0,-2])
	intersection() {	
	hull() {
	    translate([-99,-30]) cylinder(r=5,h=40,center=true);
	    translate([-99,30]) cylinder(r=5,h=40,center=true);
	    translate([99,-30]) cylinder(r=5,h=40,center=true);
	    translate([99,30]) cylinder(r=5,h=40,center=true);
	}
	scale ([1.02,1,1]) rotate([0,0,180]) translate([-100,-35,0]) baseTexture200x70();
    }
}

/******** DEFORMED BARRIER MODULES ********/

module brokenBarrier1() {
    difference() {
	bremerBarrier();
	brokenBarrier1Top();
	translate([-30,10,48]) rotate([0,180,180]) holeCutout();
    }
}

module brokenBarrier1Top() {
    intersection() {
	bremerBarrier();
	union() {
	    translate([0,0,height/2+30]) 
		cube([width+2,depth,height-20],center=true);
	    translate([40,-11,50]) rotate([0,180,0]) holeCutout();
	}
    }
}

module brokenBarrier2() {
    difference() {
	bremerBarrier();
	translate([0,0,height/2+25]) 
	    cube([width+2,depth,height-20],center=true);
	translate([40,-6,37]) rotate([0,189,0]) holeCutout();
    }
}

module brokenBarrier3() {
    difference() {
	bremerBarrier();
	translate([40,-11,55]) rotate([0,190,4]) holeCutout();
	translate([0,0,height/2+35]) 
	    cube([width+2,depth,height-20],center=true);
    }
}

module brokenBarrier4() {
	difference() {
		bremerBarrier();
		translate([-27,8,39]) rotate([180,-12,0]) holeCutout2();
		translate([0,0,height/2+15]) 
		    cube([width+2,depth,height-20],center=true);
	}
}

module brokenBarrier5() {
	difference() {
		bremerBarrier();
		translate([-27,13,73]) rotate([180,2,0]) holeCutout2();
		translate([-87,13,100]) rotate([180,2,0]) holeCutout2();
	}
}

module damagedBarrier1() {
    difference() {
	bremerBarrier();
	translate([-13,25,17]) rotate([95,5,0]) hole();
    }
}

module damagedBarrier2() {
    difference() {
	bremerBarrier();
	translate([100,-11,95]) rotate([0,190,0]) holeCutout();
    }
}

module damagedBarrier3() {
    difference() {
		bremerBarrier();	
		translate([-90,10,130]) rotate([180,0,0]) holeCutout2();
	}
}

module damagedBarrier4() {
	difference() {
		bremerBarrier();
		translate([-40,10,80]) rotate([180,0,0]) holeCutout2();
	}
}

/******** BREMER BARRIER MODULE ********/

module bremerBarrier() {
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

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */

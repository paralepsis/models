/* Greg Frost
 * http://www.thingiverse.com/thing:135408/#files
 *
 * LGPL
 */

module bevel_extrude_example()
{
	bevel_extrude(height=10,bevel_depth=2,$fn=16) 
	example_shape();
}

module example_shape()
{
	union()
	{
		square([8,30],true);
		rotate(30)
		square([35,8],true);
	
		translate([0,15])
		square([30,8],true);
	}
}

module bevel_border(size=0.02)
{
	difference()
	{
		minkowski()
		{
			children(0);
			square(size,true);
		}
		children(0);
	}
}

module bevel_cutaway(bevel_depth=5)
{
	translate([0,0,-bevel_depth])
	minkowski()
	{
		linear_extrude(height=bevel_depth,convexity=5)
		bevel_border(0.02)
		children(0);
		cylinder(h=bevel_depth+1,r1=0,r2=bevel_depth*sqrt(2));
	}
}

module bevel_extrude(height=20,bevel_depth=1)
{
	difference()
	{
		linear_extrude(height=height,convexity=5)
		children(0);

		translate([0,0,height])
		bevel_cutaway(bevel_depth)
		children(0);
	}	
}

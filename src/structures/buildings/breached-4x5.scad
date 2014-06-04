use <building.scad>
use <damage.scad>

translate([34,48,5]) rotate([0,0,180]) 
	color("red") import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");

difference() {
    building(b1Dims, b1Windows, b1Doors);
    difference() {
	translate([124,34,-14]) rotate([0,-25,90]) scale([.8,1,1]) wallBreach();
	cube([300,200,8],center=true);
    }
}

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
b1Dims = [127, // xdim
	     100, // ydim
	     65, // height
	     7, // wall thickness
	     4, // floor/roof thickness
	     1]; // ears

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
b1Windows = [[[0, 30, 0], [0,0,-90]],
		    [[0, 70, 0], [0,0,-90]],
		    [[90,93,0], [0,0,0]],
		   ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
b1Doors = [[[40, 93, 0], [0,0,0], [1,0,0]],
          ];

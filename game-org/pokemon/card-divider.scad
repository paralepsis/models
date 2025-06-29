use <BOSL2/std.scad>

$fn=50;

polygon_points = [[0,0], [86,0], [86,9], [94,9], [94,60], [86,60], [86,69], [8,69], [8,60], [0,60]];

rounded_polygon = round_corners(polygon_points, method="circle", radius=2);

linear_extrude(height=0.8) polygon(rounded_polygon);



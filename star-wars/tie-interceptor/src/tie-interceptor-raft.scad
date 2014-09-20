rad = 2;
xDim = 31;
yDim = 26;

linear_extrude(height=0.3) hull() {
   translate([0,    0, 0])    circle(r=rad);
   translate([xDim, 0, 0])    circle(r=rad);
   translate([0,    yDim, 0]) circle(r=rad);
   translate([xDim, yDim, 0]) circle(r=rad);
}


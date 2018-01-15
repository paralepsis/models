extrusionWidth=0.4;
layerHeight=0.3;

for (i=[0:9]) {
   translate([0,7*i,0]) cube([70,extrusionWidth,layerHeight]);
}

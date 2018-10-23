extrusionWidth=0.34;
layerHeight=0.3;
mult=2;
length=100;

for (i=[0:9]) {
   translate([0,7*i,0]) cube([length,extrusionWidth,mult*layerHeight]);
}

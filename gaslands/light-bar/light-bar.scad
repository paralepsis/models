include <./polyround.scad>

// Individual light shape
thick=1.25;
width=2.5;
length=5;

lightBar();

module lightBar() {
   for(i=[0:7]) {
      translate([-(width-0.05)*3.5+(width-0.05)*i,0,0]) light();
   }

   translate([-(width-0.05)*3.5,0,-0.39+.2]) cube([2,length-1,0.4],center=true);
   translate([(width-0.05)*3.5,0,-0.39+.2]) cube([2,length-1,0.4],center=true);
}

module light() {
   lightPoints = [[-width/2,-length/2,0.5], [-width/2,length/2,0.5],
                  [width/2,length/2,0.5], [width/2,-length/2,0.5]];
   hull() {
     linear_extrude(height=thick) polygon(polyRound(lightPoints,3));
     scale([0.8,0.8,1.2]) linear_extrude(height=thick) polygon(polyRound(lightPoints,3));
   }
}


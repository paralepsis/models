myWidth=7;
widthPoints=7; // cannot modify without editing code

wall();

module wall() {
   linear_extrude(height=2.0) for (i=[0:10]) {
      translate([i*(myWidth+0.5),0,0]) plank(width=myWidth,seed=i);
   }

   translate([0,65,1.99]) rotate([0,0,-90])
      linear_extrude(height=2.0) plank(length=81,width=myWidth,seed=101);
   translate([0,10,1.99]) rotate([0,0,-90])
      linear_extrude(height=2.0) plank(length=81,width=myWidth,seed=101);
   translate([0,17,1.99]) rotate([0,0,-63])
      linear_extrude(height=2.0) plank(length=90,width=myWidth,seed=101);
}

module plank(width=7,length=70,seed=1) {
   rough = rands(min_value=-1,max_value=1,value_count=2*(widthPoints+1),
                 seed_value=seed);

   polygon(points=[[0,0+rough[0]], [0,length+rough[1]],
                   [width/widthPoints,length+rough[2]],
                   [2*width/widthPoints,length+rough[3]],
                   [3*width/widthPoints,length+rough[4]],
                   [4*width/widthPoints,length+rough[5]],
                   [5*width/widthPoints,length+rough[6]],
                   [6*width/widthPoints,length+rough[7]],
                   [7*width/widthPoints,length+rough[8]],
                   [7*width/widthPoints,rough[9]],
                   [6*width/widthPoints,rough[10]],
                   [5*width/widthPoints,rough[11]],
                   [4*width/widthPoints,rough[12]],
                   [3*width/widthPoints,rough[13]],
                   [2*width/widthPoints,rough[14]],
                   [width/widthPoints,rough[15]]]);
}

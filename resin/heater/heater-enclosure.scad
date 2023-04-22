include <polyround.scad>

extWidth     = 93;
extDepth     = 65;
extHt        = 65;
wallThk      = 2;

pwrHoleDia   = 22.5;

extRadiiPoints = [
   [ -extWidth/2, -extDepth/2, 1.5],
   [  extWidth/2, -extDepth/2, 1.5],
   [  extWidth/2,  extDepth/2, 1.5],
   [ -extWidth/2,  extDepth/2, 1.5]
];

intRadiiPoints = [
   [ -extWidth/2+wallThk, -extDepth/2+wallThk, 1.5],
   [  extWidth/2-wallThk, -extDepth/2+wallThk, 1.5],
   [  extWidth/2-wallThk,  extDepth/2-wallThk, 1.5],
   [ -extWidth/2+wallThk,  extDepth/2-wallThk, 1.5]
];

// electronics();

heatIntDim = 80;
heatExtDim = 88;

extHeatPoints = [
   [ -heatExtDim/2, -heatExtDim/2, 3 ],
   [ -heatExtDim/2,  heatExtDim/2, 3 ],
   [  heatExtDim/2,  heatExtDim/2, 3 ],
   [  heatExtDim/2, -heatExtDim/2, 3 ]
];

intHeatPoints = [
   [ -heatIntDim/2, -heatIntDim/2, 3 ],
   [ -heatIntDim/2,  heatIntDim/2, 3 ],
   [  heatIntDim/2,  heatIntDim/2, 3 ],
   [  heatIntDim/2, -heatIntDim/2, 3 ]
];


heat();
// electronics();

module heat() {
   difference() {
      union() {
         difference() {
            linear_extrude(height=7) polygon(polyRound(extHeatPoints,20));
            translate([0,0,-1]) linear_extrude(height=9) polygon(polyRound(intHeatPoints,20));
         }
         for (i=[-1,1]) translate([i*83/2,83/2,0]) cylinder($fn=30,h=35,d=8);
         for (i=[-1,1]) translate([i*83/2,-83/2,0]) cylinder($fn=30,h=8,d=8);
      }
      heatMountHoles();
   }
}

difference() {
   translate([-heatExtDim/2-8,-heatExtDim/2+8,0]) cube([9.5,heatExtDim-16,30]);
   translate([-heatExtDim/2-6,-heatExtDim/2+10,-1]) cube([10,heatExtDim-20,40]);
}



module heatMountHoles() {
   for (i=[-1,1]) translate([i*83/2,83/2,-1]) cylinder($fn=30,h=40,d=4.2);
   for (i=[-1,1]) translate([i*83/2,-83/2,-1]) cylinder($fn=30,h=40,d=4.2);
}



// BUILDING BLOCKS BELOW

module electronics() {
   difference() {
      box();
   
      // MOUNTING POINT HOLES
      mountPtHole();
      mirror([1,0,0]) mountPtHole();

      // VENTS
      translate([6,extDepth/2, 10]) rotate([90,0,0])
         grillHoles(width=extWidth-18, height=extHt-15);

      // POWER SWITCH HOLE
      translate([extWidth/2 - 5,-15,pwrHoleDia/2+5]) rotate([0,90,0])
         cylinder($fn=40,d=pwrHoleDia, h=10);

      // POWER CABLE HOLE
      translate([0,-extDepth/2-1,extHt/2-10]) rotate([-90,0,0])
         cylinder(d=30,h=5);

      // CIRCUIT BOARD HOLE
      translate([-extWidth/2+10, -extDepth/2+20,-1]) cylinder($fn=30,d=2.85,h=20);

      // LED HOLE
      translate([-extWidth/2+8,extDepth/2-3,extHt-11.75]) rotate([-90,0,0])
         cylinder($fn=30,d=5,h=5);
   }
}

module box() {
   difference() {
      linear_extrude(height=extHt) polygon(polyRound(extRadiiPoints,20));
      translate([0,0,wallThk]) linear_extrude(height=extHt)
        polygon(polyRound(intRadiiPoints,20));
      translate([-(extWidth+2)/2,-extDepth/2-1,extHt-8]) cube([extWidth+2,extDepth-27+1,10]);
   }

   // MOUNTING POINTS
   mountPt();
   mirror([1,0,0]) mountPt();

   // CIRCUIT BOARD
   translate([-extWidth/2+10, -extDepth/2+20,0]) cylinder($fn=30,d=8,h=10);

}

module mountPtHole() {
   $fn=30;

   echo(extWidth/2-4);

   translate([83/2,-extDepth/2-1,extHt]) rotate([-90,0,0]) 
      cylinder(d=4.2,h=extDepth+2);
}
 
module mountPt() {
   translate([83/2,(extDepth/2)-27,extHt]) rotate([-90,0,0]) hull() {
      $fn=30;
      cylinder(d=8,h=27);
      translate([4,10,0]) cylinder(d=1,h=26);
   }
}


module grillHoles(width, height) {
   wid   = 3;
   thick = 10;
   ct    = floor(width/(wid*2));

   for (i=[0:ct-1]) {
      hull() {
         translate([-(floor(width/(wid*2))*wid)+2*wid*i,0,-thick/2])
            cylinder($fn=20, d=wid, h=thick);
         translate([-(floor(width/(wid*2))*wid)+2*wid*i,height-2*wid,-thick/2])
            cylinder($fn=20, d=wid, h=thick);
      }
   }
}

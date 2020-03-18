% import("./robagon-example.stl");

// [ angle from vert, distance from Z axis, rotation around Z, ht, dia ]
crystals = [[7,10,80,30,13],
            [10,5,120,20,12]
           ];

for (p=crystals) {
  rotate([0,0,p[2]]) translate([p[1],0,0]) rotate([0,p[0],0])
    crystal(ht=p[3],dia=p[4]);
}

module crystal(ht=30,dia=13) {
   cylinder($fn=6,d1=0.7*dia,d2=dia,h=ht-0.7*dia);
   translate([0,0,ht-0.7*dia]) cylinder($fn=6,d1=dia,d2=0,h=0.7*dia);
}

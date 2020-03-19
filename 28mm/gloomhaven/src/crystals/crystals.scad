// % import("./robagon-example.stl");

postDia = 5.25; // including space
postHt  = 40;

module postHole() {
   translate([0,0,1.6]) cylinder($fn=40, d=postDia, h=postHt);
   translate([0,-1,1.6]) cube([postDia/2+2, 2, 5]);
   rotate([0,0,120]) translate([0,-1,1.6]) cube([postDia/2+2, 2, 5]);
   rotate([0,0,240]) translate([0,-1,1.6]) cube([postDia/2+2, 2, 5]);
}


difference() {
   form();
   postHole();
}

//          [ vert angle, dist. Z, rotation Z, ht, dia ]
crystals = [[12.5,        5,       80,         32, 14],
            [13.5,          5,       220,        29, 14],
            [21,          13,       0,        13, 5],
            [28,          10,       31,        13, 7],
            [19,          12,       60,        16, 8],
            [28,          10,       92,        15, 7],
            [21,          13,       150,        9, 4],
            [13,          10,       123,        15, 7],
            [17,          12,       185,        8, 5],
            [28,          10,       211,        11, 6],
            [17,          12,       247,        14, 7],
            [21,          11,       272,        8, 5],
            [15,          14,       304,        15, 6],
            [28,          10,       331,        12, 7],
            [10,          8,        290,        21, 9],
            [12,          6,        350,        25, 12],
            [13,          7,        160,        23, 10],
           ];

module form() {
   intersection() {
      translate([-50,-50,0]) cube([100,100,50]);
      union() {
         for (p=crystals) {
           rotate([0,0,p[2]]) translate([p[1],0,0]) rotate([0,p[0],0])
             crystal(ht=p[3],dia=p[4]);
         }
         base();
      }
   }
}

module base() {
   hull() { 
      translate([0,0,-1]) minkowski() {
         linear_extrude(height=1) hull() projection(cut=true) {
            for (p=crystals) {
              rotate([0,0,p[2]]) translate([p[1],0,0]) rotate([0,p[0],0])
                crystal(ht=p[3],dia=p[4]);
            }
         }
         sphere($fn=20,r=1.75);
      }
      translate([0,0,2]) scale([1,1,0.4]) sphere(r=12);
   }
}

module crystal(ht=30,dia=13) {
   cylinder($fn=6,d1=0.7*dia,d2=dia,h=ht-0.7*dia);
   translate([0,0,ht-0.7*dia-0.01]) cylinder($fn=6,d1=dia,d2=0,h=0.7*dia);
}

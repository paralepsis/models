// note: this is for 2x2 only
//

tileWidth = 50.8;
slop = 0.25;
height = 8;

wallThick = 1.29; // prusa suggested for 3 perimeters

difference() {
   translate([0,0,height/2]) cube([tileWidth+2*slop+2*wallThick,
                                   tileWidth+2*slop+2*wallThick,
                                   height],center=true);

   translate([0,0,height/2+1.2]) cube([tileWidth+2*slop,
                                       tileWidth+2*slop,height],center=true);

   translate([0,0,0.99]) cube([30,30,2],center=true);
}

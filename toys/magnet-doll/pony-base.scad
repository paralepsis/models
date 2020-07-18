cutWid = 5.25;

difference() { 
   translate([-49/2,0,0]) cube([49,78,17]);
   translate([-cutWid/2,-0.25,17-8]) cube([cutWid,78.5,9]);
}

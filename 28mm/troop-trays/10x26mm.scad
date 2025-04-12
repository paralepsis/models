dia  = 26; // little extra room
wall = 1.04; // from PS
ht = 4;
$fn=80;
cutout = 12;
spacing = 32;


locs = [[-1,-1,6],[-1,0,4],[-1,1,6],[0,-1.5,4],[0,-0.5,4],[0,0.5,4],[0,1.5,4],[1,-1,6],[1,0,4],[1,1,6]];

difference() {
   union() { 
      spots();
      hull() holes(ht=1.5);
   }
   holes();
}

module spots() {
   for (i=[0:len(locs)-1]) {
      loc = [locs[i][0]*spacing,locs[i][1]*spacing,0];
      translate(loc) spot(ht=locs[i][2]);
   }
}

module spot(ht = 4) {
   difference() {
      cylinder (d=dia+2*wall,h=ht);
      translate([0,0,1.5]) cylinder (d=dia,h=ht);
   }
}

module holes(ht=4) {
   for (i=[0:len(locs)-1]) {
      loc = [locs[i][0]*spacing,locs[i][1]*spacing,0];
      translate(loc) hole(ht=ht);
   }
}

module hole(ht=4) {
   if (ht<4) translate([0,0,0]) cylinder (d=cutout,h=ht);
   else translate([0,0,-1]) cylinder (d=cutout,h=ht);
}

$fn   = 80;
$wall = 1.04;
$ht   = 20;	

% cube([234,150,1]);

translate([16+$wall,16+$wall,0]) for (i=[0:6]) {
   translate([(32+$wall)*i,0,0]) 32mm();
}
translate([0.55,46,0]) for (i=[1:6]) {
   translate([(32+$wall)*i,0,0]) 32mm();
}
if (0) translate([16+$wall,75,0]) for (i=[0:6]) {
   translate([(32+$wall)*i,0,0]) 32mm();
}

translate([14+$wall,77+2,0]) for (i=[0:7]) {
   translate([(28+$wall)*i,0,0]) 28mm();
}
translate([0.55,102+2,0]) for (i=[1:7]) {
   translate([(28+$wall)*i,0,0]) 28mm();
}
translate([14+$wall,127+2,0]) for (i=[0:7]) {
   translate([(28+$wall)*i,0,0]) 28mm();
}

module 28mm() {
   difference() {
      cylinder(d=28+2*$wall,h=$ht);
      translate([0,0,-1]) cylinder(d=28,h=$ht+2);
   }
}

module 32mm() {
   difference() {
      cylinder(d=32+2*$wall,h=$ht);
      translate([0,0,-1]) cylinder(d=32,h=$ht+2);
   }
}

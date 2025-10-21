inside_width = 175;
ht_to_center_peg = 95;
peg_dia = 7;
peg_len=9;
base_width = 40;
additional_ht = 15;
leg_thick = 7;
base_thick = 7;

difference() {
   translate([-leg_thick-inside_width/2, -base_thick,0])
      cube([inside_width+2*leg_thick, base_thick+ht_to_center_peg+additional_ht, base_width]);

   if (0) translate([-inside_width/2,0,-0.5])
      cube([inside_width, ht_to_center_peg+additional_ht+1,base_width+1]);
   hull() {
       translate([inside_width/2-5,5,-0.5]) cylinder($fn=40,d=10,h=base_width+1);
       translate([-(inside_width/2-5),5,-0.5]) cylinder($fn=40,d=10,h=base_width+1);
       translate([inside_width/2-5,ht_to_center_peg+additional_ht+1,-0.5]) cylinder($fn=40,d=10,h=base_width+1);
       translate([-(inside_width/2-5),ht_to_center_peg+additional_ht+1,-0.5]) cylinder($fn=40,d=10,h=base_width+1);
   }
   
   translate([0,ht_to_center_peg,base_width/2]) rotate([0,90,0])
      translate([0,0,-(inside_width+2*leg_thick+2)/2])
      cylinder($fn=80,d=peg_dia+0.4,h=inside_width+2*leg_thick+2);
   translate([0,111,-0.1]) rotate([45,0,0])
      translate([-(inside_width+2*leg_thick+2)/2,-10,-10])
      cube([inside_width+2*leg_thick+2,20,20]);
   translate([0,111,base_width+0.1]) rotate([45,0,0])
      translate([-(inside_width+2*leg_thick+2)/2,-10,-10])
      cube([inside_width+2*leg_thick+2,20,20]);
}

translate([-10,10,0]) cylinder($fn=80,d=peg_dia,h=peg_len+leg_thick);
translate([10,10,0]) cylinder($fn=80,d=peg_dia,h=peg_len+leg_thick);

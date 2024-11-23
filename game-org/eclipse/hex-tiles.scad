total_ht = 30.5+21.5+26+3.2+4;
echo(total_ht);

top();
// bottom();

module bottom() {
   difference() {
      union() {
         translate([-219/2,0,0]) cube([219,48+6,total_ht]);
         translate([-219/2+2,-10,2]) cube([219-4,48,total_ht-4]);
      }
      hex_piles();
   
      translate([-220/4,105/2+3,-1]) cylinder($fn=80,h=90,r=22);
      translate([220/4,105/2+3,-1]) cylinder($fn=80,h=90,r=22);
   }
}


module top() {
   difference() {
      // translate([-219/2,-46,0]) cube([219,46,total_ht]);
      translate([-219/2,-46,0]) cube([219,46,total_ht]);

      translate([-219/2+1.7,-10.3,1.7]) cube([219-3.4,48,total_ht-3.4]);
      translate([-219/2+1.7+1.8,-44.5,1.7+2]) cube([219-3.4-3.6,48,total_ht-3.4-4]);
      // hex_piles();
   }
}

module hex_piles() {
   translate([-107/2,1,4.5]) {
      hex_pile(ht=45.6);
      translate([0,0,47.5]) hex_pile(ht=18.4);
      translate([0,0,47.5+20.6]) overflow_pile(ht=8);

      translate([106+1,0,0]) hex_pile(ht=28.6);
      translate([106+1,0,30.6]) hex_pile(ht=18.4);
      translate([106+1,0,30.6+20.6]) card_pile(ht=25);
   }
}

// hex_piles();


module hex_pile(ht=10)
{
   cylinder($fn=6,h=ht,d=105);
   translate([-105/2,-91/2+0.02,0]) cube([105,91/2,ht]);
}

module card_pile(ht=24)
{
   translate([-67.5/2,-91/2,0]) cube([67.5,91,ht], center=false);
}

module overflow_pile(ht=2)
{
   translate([-89/2,-91/2,0]) cube([89,89,ht]);
}
